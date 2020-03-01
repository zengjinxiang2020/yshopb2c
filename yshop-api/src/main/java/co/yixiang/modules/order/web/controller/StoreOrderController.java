/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.order.web.controller;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.aop.log.Log;
import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.enums.OrderInfoEnum;
import co.yixiang.exception.ErrorRequestException;
import co.yixiang.express.ExpressService;
import co.yixiang.express.dao.ExpressInfo;
import co.yixiang.modules.activity.entity.YxStoreBargainUser;
import co.yixiang.modules.activity.service.YxStoreBargainUserService;
import co.yixiang.modules.activity.service.YxStorePinkService;
import co.yixiang.modules.order.entity.YxStoreOrder;
import co.yixiang.modules.order.entity.YxStoreOrderCartInfo;
import co.yixiang.modules.order.service.YxStoreOrderCartInfoService;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.modules.order.service.YxStoreOrderStatusService;
import co.yixiang.modules.order.web.dto.*;
import co.yixiang.modules.order.web.param.*;
import co.yixiang.modules.order.web.vo.YxStoreOrderQueryVo;
import co.yixiang.modules.shop.entity.YxStoreProductReply;
import co.yixiang.modules.shop.service.YxStoreCartService;
import co.yixiang.modules.shop.service.YxStoreCouponUserService;
import co.yixiang.modules.shop.service.YxStoreProductReplyService;
import co.yixiang.modules.shop.service.YxSystemConfigService;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;
import co.yixiang.modules.user.service.YxUserAddressService;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.utils.OrderUtil;
import co.yixiang.utils.SecurityUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.order.WxPayMwebOrderResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * <p>
 * 订单控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Slf4j
@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "订单模块", tags = "商城:订单模块", description = "订单模块")
public class StoreOrderController extends BaseController {

    private final YxStoreOrderService storeOrderService;
    private final YxStoreCartService cartService;
    private final YxUserService userService;
    private final YxUserAddressService addressService;
    private final YxStoreOrderCartInfoService orderCartInfoService;
    private final YxStoreProductReplyService productReplyService;
    private final YxStoreOrderStatusService orderStatusService;
    private final YxStoreCouponUserService couponUserService;
    private final YxSystemConfigService systemConfigService;
    private final YxStorePinkService storePinkService;
    private final ExpressService expressService;
    private final YxStoreBargainUserService storeBargainUserService;

    private static Lock lock = new ReentrantLock(false);


    /**
     * 订单确认
     */
    @PostMapping("/order/confirm")
    @ApiOperation(value = "订单确认",notes = "订单确认")
    public ApiResult<ConfirmOrderDTO> confirm(@RequestBody String jsonStr){
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        String cartId = jsonObject.getString("cartId");
        if(StrUtil.isEmpty(cartId)){
            return ApiResult.fail("请提交购买的商品");
        }
        int uid = SecurityUtils.getUserId().intValue();
        Map<String, Object> cartGroup = cartService.getUserProductCartList(uid,cartId,1);
        if(ObjectUtil.isNotEmpty(cartGroup.get("invalid"))){
            return ApiResult.fail("有失效的商品请重新提交");
        }
        if(ObjectUtil.isEmpty(cartGroup.get("valid"))){
            return ApiResult.fail("请提交购买的商品");
        }
        List<YxStoreCartQueryVo> cartInfo = (List<YxStoreCartQueryVo>)cartGroup.get("valid");
        PriceGroupDTO priceGroup = storeOrderService.getOrderPriceGroup(cartInfo);

        ConfirmOrderDTO confirmOrderDTO = new ConfirmOrderDTO();

        confirmOrderDTO.setUsableCoupon(couponUserService
                .beUsableCoupon(uid,priceGroup.getTotalPrice()));
        //积分抵扣
        OtherDTO other = new OtherDTO();
        other.setIntegralRatio(systemConfigService.getData("integral_ratio"));
        other.setIntegralFull(systemConfigService.getData("integral_full"));
        other.setIntegralMax(systemConfigService.getData("integral_max"));

        //todo 拼团 砍价 秒杀
        int combinationId = 0;
        if(cartId.split(",").length == 1){
            YxStoreCartQueryVo cartQueryVo = cartService.getYxStoreCartById(Integer
                    .valueOf(cartId));
            combinationId = cartQueryVo.getCombinationId();
        }

        int secKillId = 0;
        if(cartId.split(",").length == 1){
            YxStoreCartQueryVo cartQueryVo = cartService.getYxStoreCartById(Integer
                    .valueOf(cartId));
            secKillId = cartQueryVo.getSeckillId();
        }

        int bargainId = 0;
        if(cartId.split(",").length == 1){
            YxStoreCartQueryVo cartQueryVo = cartService.getYxStoreCartById(Integer
                    .valueOf(cartId));
            bargainId = cartQueryVo.getBargainId();
        }

        //拼团砍价秒杀类产品不参与抵扣
        if(combinationId > 0 || secKillId > 0 || bargainId > 0) confirmOrderDTO.setDeduction(true);

        //判断积分是否满足订单额度
        if(priceGroup.getTotalPrice() < Double.valueOf(other.getIntegralFull())) confirmOrderDTO.setEnableIntegral(false);

        confirmOrderDTO.setEnableIntegralNum(Double.valueOf(other.getIntegralMax()));


        confirmOrderDTO.setAddressInfo(addressService.getUserDefaultAddress(uid));

        confirmOrderDTO.setCartInfo(cartInfo);
        confirmOrderDTO.setPriceGroup(priceGroup);
        confirmOrderDTO.setOrderKey(storeOrderService.cacheOrderInfo(uid,cartInfo,
                                    priceGroup,other));


        confirmOrderDTO.setUserInfo(userService.getYxUserById(uid));

        return ApiResult.ok(confirmOrderDTO);
    }

    /**
     * 订单创建
     */
    @PostMapping("/order/create/{key}")
    @ApiOperation(value = "订单创建",notes = "订单创建")
    public ApiResult<ConfirmOrderDTO> create(@Valid @RequestBody OrderParam param,
                                             @PathVariable String key){

        Map<String,Object> map = new LinkedHashMap<>();
        int uid = SecurityUtils.getUserId().intValue();
        if(StrUtil.isEmpty(key)) return ApiResult.fail("参数错误");

        YxStoreOrderQueryVo storeOrder = storeOrderService.getOrderInfo(key,uid);
        if(ObjectUtil.isNotNull(storeOrder)){
            map.put("status","EXTEND_ORDER");
            OrderExtendDTO orderExtendDTO = new OrderExtendDTO();
            orderExtendDTO.setKey(key);
            orderExtendDTO.setOrderId(storeOrder.getOrderId());
            map.put("result",orderExtendDTO);
            return ApiResult.ok(map,"订单已生成");
        }

        // 砍价
        if(ObjectUtil.isNotNull(param.getBargainId())){
            YxStoreBargainUser storeBargainUser = storeBargainUserService.
                    getBargainUserInfo(param.getBargainId(),uid);
            if(ObjectUtil.isNull(storeBargainUser)) return ApiResult.fail("砍价失败");
            if(storeBargainUser.getStatus().equals(OrderInfoEnum.BARGAIN_STATUS_3.getValue())) return ApiResult.fail("砍价已支付");

            storeBargainUserService.setBargainUserStatus(param.getBargainId(),uid);

        }
        // 拼团
        if(ObjectUtil.isNotNull(param.getPinkId())){
            int pinkId = param.getPinkId();
            if(pinkId > 0){
                YxStoreOrder yxStoreOrder = storeOrderService.getOrderPink(pinkId,uid,1);
                if(ObjectUtil.isNotNull(yxStoreOrder)){
                    if(storePinkService.getIsPinkUid(pinkId,uid) > 0){
                        map.put("status","ORDER_EXIST");
                        OrderExtendDTO orderExtendDTO = new OrderExtendDTO();
                        orderExtendDTO.setOrderId(yxStoreOrder.getOrderId());
                        map.put("result",orderExtendDTO);
                        return ApiResult.ok(map,"订单生成失败，你已经在该团内不能再参加了");
                    }
                }

                YxStoreOrder yxStoreOrderT = storeOrderService.getOrderPink(pinkId,uid,0);
                if(ObjectUtil.isNotNull(yxStoreOrderT)){
                    map.put("status","ORDER_EXIST");
                    OrderExtendDTO orderExtendDTO = new OrderExtendDTO();
                    orderExtendDTO.setOrderId(yxStoreOrder.getOrderId());
                    map.put("result",orderExtendDTO);
                    return ApiResult.ok(map,"订单生成失败，你已经参加该团了，请先支付订单");
                }
            }

        }


        if(param.getFrom().equals("weixin"))  param.setIsChannel(0);
        //创建订单
        YxStoreOrder order = null;
        try{
             lock.lock();
             order = storeOrderService.createOrder(uid,key,param);
        }finally {
             lock.unlock();
        }


        if(ObjectUtil.isNull(order)) throw new ErrorRequestException("订单生成失败");

        String orderId = order.getOrderId();

        OrderExtendDTO orderDTO = new OrderExtendDTO();
        orderDTO.setKey(key);
        orderDTO.setOrderId(orderId);
        map.put("status","SUCCESS");
        map.put("result",orderDTO);
        //开始处理支付
        if(StrUtil.isNotEmpty(orderId)){
            //处理金额为0的情况
            if(order.getPayPrice().doubleValue() <= 0){
                storeOrderService.yuePay(orderId,uid);
                return ApiResult.ok(map,"支付成功");
            }

            switch (param.getPayType()){
                case "weixin":
                     try {
                         Map<String,String> jsConfig = new HashMap<>();
                         if(param.getFrom().equals("weixinh5")){
                             WxPayMwebOrderResult wxPayMwebOrderResult = storeOrderService
                                     .wxH5Pay(orderId);
                             log.info("wxPayMwebOrderResult:{}",wxPayMwebOrderResult);
                             jsConfig.put("mweb_url",wxPayMwebOrderResult.getMwebUrl());
                             orderDTO.setJsConfig(jsConfig);
                             map.put("result",orderDTO);
                             map.put("status","WECHAT_H5_PAY");
                             return ApiResult.ok(map);
                         }else if(param.getFrom().equals("routine")){
                             map.put("status","WECHAT_PAY");
                             WxPayMpOrderResult wxPayMpOrderResult = storeOrderService
                                     .wxAppPay(orderId);
                             jsConfig.put("appId",wxPayMpOrderResult.getAppId());
                             jsConfig.put("timeStamp",wxPayMpOrderResult.getTimeStamp());
                             jsConfig.put("nonceStr",wxPayMpOrderResult.getNonceStr());
                             jsConfig.put("package",wxPayMpOrderResult.getPackageValue());
                             jsConfig.put("signType",wxPayMpOrderResult.getSignType());
                             jsConfig.put("paySign",wxPayMpOrderResult.getPaySign());
                             orderDTO.setJsConfig(jsConfig);
                             map.put("result",orderDTO);
                             return ApiResult.ok(map,"订单创建成功");
                         }else{
                             map.put("status","WECHAT_PAY");
                             WxPayMpOrderResult wxPayMpOrderResult = storeOrderService
                                     .wxPay(orderId);
                             jsConfig.put("appId",wxPayMpOrderResult.getAppId());
                             jsConfig.put("timestamp",wxPayMpOrderResult.getTimeStamp());
                             jsConfig.put("nonceStr",wxPayMpOrderResult.getNonceStr());
                             jsConfig.put("package",wxPayMpOrderResult.getPackageValue());
                             jsConfig.put("signType",wxPayMpOrderResult.getSignType());
                             jsConfig.put("paySign",wxPayMpOrderResult.getPaySign());
                             orderDTO.setJsConfig(jsConfig);
                             map.put("result",orderDTO);
                             return ApiResult.ok(map,"订单创建成功");
                         }

                     } catch (WxPayException e) {
                        return ApiResult.fail(e.getMessage());
                    }
                case "yue":
                    storeOrderService.yuePay(orderId,uid);
                    return ApiResult.ok(map,"余额支付成功");
            }
        }


        return ApiResult.fail("订单生成失败");
    }


    /**
     *  订单支付
     */
    @Log(value = "订单支付",type = 1)
    @PostMapping("/order/pay")
    @ApiOperation(value = "订单支付",notes = "订单支付")
    public ApiResult<ConfirmOrderDTO> pay(@Valid @RequestBody PayParam param){

        Map<String,Object> map = new LinkedHashMap<>();
        int uid = SecurityUtils.getUserId().intValue();
        if(StrUtil.isEmpty(param.getUni())) return ApiResult.fail("参数错误");

        YxStoreOrderQueryVo storeOrder = storeOrderService
                .getOrderInfo(param.getUni(),uid);
        if(ObjectUtil.isNull(storeOrder)) return ApiResult.fail("订单不存在");

        if(storeOrder.getPaid().equals(OrderInfoEnum.REFUND_STATUS_1.getValue())) return ApiResult.fail("该订单已支付");


        String orderId = storeOrder.getOrderId();

        OrderExtendDTO orderDTO = new OrderExtendDTO();
        orderDTO.setOrderId(orderId);
        map.put("status","SUCCESS");
        map.put("result",orderDTO);
        //开始处理支付
        if(StrUtil.isNotEmpty(orderId)){
            switch (param.getPaytype()){
                case "weixin":
                    try {
                        Map<String,String> jsConfig = new HashMap<>();
                        if(param.getFrom().equals("weixinh5")){
                            WxPayMwebOrderResult wxPayMwebOrderResult = storeOrderService
                                    .wxH5Pay(orderId);
                            log.info("wxPayMwebOrderResult:{}",wxPayMwebOrderResult);
                            jsConfig.put("mweb_url",wxPayMwebOrderResult.getMwebUrl());
                            orderDTO.setJsConfig(jsConfig);
                            map.put("result",orderDTO);
                            map.put("status","WECHAT_H5_PAY");
                            return ApiResult.ok(map);
                        }else if(param.getFrom().equals("routine")){
                            map.put("status","WECHAT_PAY");
                            WxPayMpOrderResult wxPayMpOrderResult = storeOrderService
                                    .wxAppPay(orderId);
                            jsConfig.put("appId",wxPayMpOrderResult.getAppId());
                            jsConfig.put("timeStamp",wxPayMpOrderResult.getTimeStamp());
                            jsConfig.put("nonceStr",wxPayMpOrderResult.getNonceStr());
                            jsConfig.put("package",wxPayMpOrderResult.getPackageValue());
                            jsConfig.put("signType",wxPayMpOrderResult.getSignType());
                            jsConfig.put("paySign",wxPayMpOrderResult.getPaySign());
                            orderDTO.setJsConfig(jsConfig);
                            map.put("result",orderDTO);
                            return ApiResult.ok(map,"订单创建成功");
                        }else{
                            map.put("status","WECHAT_PAY");
                            WxPayMpOrderResult wxPayMpOrderResult = storeOrderService
                                    .wxPay(orderId);
                            //重新组装
                            jsConfig.put("appId",wxPayMpOrderResult.getAppId());
                            jsConfig.put("timestamp",wxPayMpOrderResult.getTimeStamp());
                            jsConfig.put("nonceStr",wxPayMpOrderResult.getNonceStr());
                            jsConfig.put("package",wxPayMpOrderResult.getPackageValue());
                            jsConfig.put("signType",wxPayMpOrderResult.getSignType());
                            jsConfig.put("paySign",wxPayMpOrderResult.getPaySign());
                            orderDTO.setJsConfig(jsConfig);
                            map.put("result",orderDTO);
                            return ApiResult.ok(map);
                        }

                    } catch (WxPayException e) {
                        return ApiResult.fail(e.getMessage());
                    }
                case "yue":
                    storeOrderService.yuePay(orderId,uid);
                    return ApiResult.ok(map,"余额支付成功");
            }
        }


        return ApiResult.fail("订单生成失败");
    }


    /**
     * 订单列表
     */
    @Log(value = "查看订单列表",type = 1)
    @GetMapping("/order/list")
    @ApiOperation(value = "订单列表",notes = "订单列表")
    public ApiResult<List<YxStoreOrderQueryVo>> orderList(YxStoreOrderQueryParam queryParam){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(storeOrderService.orderList(uid,queryParam.getType().intValue(),
                queryParam.getPage().intValue(),queryParam.getLimit().intValue()));
    }


    /**
     * 订单详情
     */
    @Log(value = "查看订单详情",type = 1)
    @GetMapping("/order/detail/{key}")
    @ApiOperation(value = "订单详情",notes = "订单详情")
    public ApiResult<YxStoreOrderQueryVo> detail(@PathVariable String key){
        int uid = SecurityUtils.getUserId().intValue();
        if(StrUtil.isEmpty(key)) return ApiResult.fail("参数错误");
        YxStoreOrderQueryVo storeOrder = storeOrderService.getOrderInfo(key,uid);
        if(ObjectUtil.isNull(storeOrder)){
            return ApiResult.fail("订单不存在");
        }
        //todo 门店核销

        return ApiResult.ok(storeOrderService.handleOrder(storeOrder));
    }

    /**
     * 计算订单金额
     */
    @PostMapping("/order/computed/{key}")
    @ApiOperation(value = "计算订单金额",notes = "计算订单金额")
    public ApiResult<Map<String,Object>> computedOrder(@RequestBody String jsonStr,
                                                    @PathVariable String key){

        Map<String,Object> map = new LinkedHashMap<>();
        int uid = SecurityUtils.getUserId().intValue();
        if(StrUtil.isEmpty(key)) return ApiResult.fail("参数错误");
        YxStoreOrderQueryVo storeOrder = storeOrderService.getOrderInfo(key,uid);
        if(ObjectUtil.isNotNull(storeOrder)){
            map.put("status","EXTEND_ORDER");
            OrderExtendDTO orderExtendDTO = new OrderExtendDTO();
            orderExtendDTO.setKey(key);
            orderExtendDTO.setOrderId(storeOrder.getOrderId());
            map.put("result",orderExtendDTO);
            return ApiResult.ok(map,"订单已生成");
        }

        JSONObject jsonObject = JSON.parseObject(jsonStr);
        String addressId = jsonObject.getString("addressId");
        String couponId = jsonObject.getString("couponId");
        String shippingType = jsonObject.getString("shipping_type");
        String useIntegral = jsonObject.getString("useIntegral");
        //todo 砍价
        if(ObjectUtil.isNotNull(jsonObject.getInteger("bargainId"))){
            YxStoreBargainUser storeBargainUser = storeBargainUserService.getBargainUserInfo(jsonObject.getInteger("bargainId")
                    ,uid);
            if(ObjectUtil.isNull(storeBargainUser)) return ApiResult.fail("砍价失败");
            if(storeBargainUser.getStatus() == 3) return ApiResult.fail("砍价已支付");
        }
        //todo 拼团
        if(ObjectUtil.isNotNull(jsonObject.getInteger("pinkId"))){
            int pinkId = jsonObject.getInteger("pinkId");
            YxStoreOrder yxStoreOrder = storeOrderService.getOrderPink(pinkId,uid,1);
            if(storePinkService.getIsPinkUid(pinkId,uid) > 0){
                map.put("status","ORDER_EXIST");
                OrderExtendDTO orderExtendDTO = new OrderExtendDTO();
                orderExtendDTO.setOrderId(yxStoreOrder.getOrderId());
                map.put("result",orderExtendDTO);
                return ApiResult.ok(map,"订单生成失败，你已经在该团内不能再参加了");
            }
            YxStoreOrder yxStoreOrderT = storeOrderService.getOrderPink(pinkId,uid,0);
            if(ObjectUtil.isNotNull(yxStoreOrderT)){
                map.put("status","ORDER_EXIST");
                OrderExtendDTO orderExtendDTO = new OrderExtendDTO();
                orderExtendDTO.setOrderId(yxStoreOrder.getOrderId());
                map.put("result",orderExtendDTO);
                return ApiResult.ok(map,"订单生成失败，你已经参加该团了，请先支付订单");
            }

        }
        ComputeDTO computeDTO = storeOrderService.computedOrder(uid,key,
                Integer.valueOf(couponId),
                Integer.valueOf(useIntegral),
                Integer.valueOf(shippingType));


        map.put("result",computeDTO);
        map.put("status","NONE");
        return ApiResult.ok(map);
    }


    /**
     * 订单收货
     */
    @Log(value = "订单收货",type = 1)
    @PostMapping("/order/take")
    @ApiOperation(value = "订单收货",notes = "订单收货")
    public ApiResult<Object> orderTake(@RequestBody String jsonStr){
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        String orderId = jsonObject.getString("uni");
        if(StrUtil.isEmpty(orderId)) return ApiResult.fail("参数错误");
        int uid = SecurityUtils.getUserId().intValue();
        storeOrderService.takeOrder(orderId,uid);

        return ApiResult.ok("ok");

    }

    /**
     * 订单产品信息
     */
    @PostMapping("/order/product")
    @ApiOperation(value = "订单产品信息",notes = "订单产品信息")
    public ApiResult<Object> product(@RequestBody String jsonStr){
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        String unique = jsonObject.getString("unique");
        if(StrUtil.isEmpty(unique)) return ApiResult.fail("参数错误");

        YxStoreOrderCartInfo orderCartInfo = orderCartInfoService.findByUni(unique);

        YxStoreCartQueryVo cartInfo = JSONObject.parseObject(orderCartInfo.getCartInfo(),
                YxStoreCartQueryVo.class);


        OrderCartInfoDTO orderCartInfoDTO = new OrderCartInfoDTO();
        orderCartInfoDTO.setBargainId(cartInfo.getBargainId());
        orderCartInfoDTO.setCartNum(cartInfo.getCartNum());
        orderCartInfoDTO.setCombinationId(cartInfo.getCombinationId());
        orderCartInfoDTO.setOrderId(storeOrderService
                .getById(orderCartInfo.getOid()).getOrderId());
        orderCartInfoDTO.setSeckillId(cartInfo.getSeckillId());

        ProductDTO productDTO = new ProductDTO();
        productDTO.setImage(cartInfo.getProductInfo().getImage());
        productDTO.setPrice(cartInfo.getProductInfo().getPrice().doubleValue());
        productDTO.setStoreName(cartInfo.getProductInfo().getStoreName());
        if(ObjectUtil.isNotEmpty(cartInfo.getProductInfo().getAttrInfo())){
            ProductAttrDTO productAttrDTO = new ProductAttrDTO();
            productAttrDTO.setImage(cartInfo.getProductInfo().getAttrInfo().getImage());
            productAttrDTO.setPrice(cartInfo.getProductInfo().getAttrInfo().getPrice().doubleValue());
            productAttrDTO.setProductId(cartInfo.getProductInfo().getAttrInfo().getProductId());
            productAttrDTO.setSuk(cartInfo.getProductInfo().getAttrInfo().getSuk());
            productDTO.setAttrInfo(productAttrDTO);
        }

        orderCartInfoDTO.setProductInfo(productDTO);


        return ApiResult.ok(orderCartInfoDTO);

    }

    /**
     * 订单评价
     */
    @Log(value = "评价商品",type = 1)
    @PostMapping("/order/comment")
    @ApiOperation(value = "订单评价",notes = "订单评价")
    public ApiResult<Object> comment(@Valid @RequestBody YxStoreProductReply productReply){
        int uid = SecurityUtils.getUserId().intValue();
        YxStoreOrderCartInfo orderCartInfo = orderCartInfoService
                .findByUni(productReply.getUnique());
        if(ObjectUtil.isEmpty(orderCartInfo)) return ApiResult.fail("评价产品不存在");

        int count = productReplyService.getInfoCount(orderCartInfo.getOid()
                ,productReply.getUnique());
        if(count > 0) return ApiResult.fail("该产品已评价");

        if(productReply.getProductScore() < 1) return ApiResult.fail("请为产品评分");
        if(productReply.getServiceScore() < 1) return ApiResult.fail("请为商家服务评分");

        productReply.setUid(uid);
        productReply.setOid(orderCartInfo.getOid());
        productReply.setProductId(orderCartInfo.getProductId());
        productReply.setAddTime(OrderUtil.getSecondTimestampTwo());
        productReply.setReplyType("product");

        productReplyService.save(productReply);

        YxStoreOrder storeOrder = new YxStoreOrder();
        storeOrder.setStatus(3);
        storeOrder.setId(orderCartInfo.getOid());
        storeOrderService.updateById(storeOrder);

        orderStatusService.create(orderCartInfo.getOid(),"check_order_over","用户评价");

        return ApiResult.ok("ok");

    }


    /**
     * 订单删除
     */
    @PostMapping("/order/del")
    @ApiOperation(value = "订单删除",notes = "订单删除")
    public ApiResult<Object> orderDel(@RequestBody String jsonStr){
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        String orderId = jsonObject.getString("uni");
        if(StrUtil.isEmpty(orderId)) return ApiResult.fail("参数错误");
        int uid = SecurityUtils.getUserId().intValue();
        storeOrderService.removeOrder(orderId,uid);

        return ApiResult.ok("ok");

    }

    /**
     * 订单退款理由
     */
    @GetMapping("/order/refund/reason")
    @ApiOperation(value = "订单退款理由",notes = "订单退款理由")
    public ApiResult<Object> refundReason(){
        ArrayList<String> list = new ArrayList<>();
        list.add("收货地址填错了");
        list.add("与描述不符");
        list.add("信了息填错，重新拍\\");
        list.add("收到商品损坏了");
        list.add("未按预定时间发货");
        list.add("其它原因");

        return ApiResult.ok(list);
    }

    /**
     * 订单退款审核
     */
    @Log(value = "提交订单退款",type = 1)
    @PostMapping("/order/refund/verify")
    @ApiOperation(value = "订单退款审核",notes = "订单退款审核")
    public ApiResult<Object> refundVerify(@RequestBody RefundParam param){
        int uid = SecurityUtils.getUserId().intValue();
        storeOrderService.orderApplyRefund(param,uid);
        return ApiResult.ok("ok");
    }

    /**
     * 订单取消   未支付的订单回退积分,回退优惠券,回退库存
     */
    @Log(value = "取消订单",type = 1)
    @PostMapping("/order/cancel")
    @ApiOperation(value = "订单取消",notes = "订单取消")
    public ApiResult<Object> cancelOrder(@RequestBody String jsonStr){
        int uid = SecurityUtils.getUserId().intValue();
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        String orderId = jsonObject.getString("id");
        if(StrUtil.isEmpty(orderId)) return ApiResult.fail("参数错误");

        storeOrderService.cancelOrder(orderId,uid);

        return ApiResult.ok("ok");
    }


    /**@Valid
     * 获取物流信息,根据传的订单编号 ShipperCode快递公司编号 和物流单号,
     */
    @PostMapping("/order/express")
    @ApiOperation(value = "获取物流信息",notes = "获取物流信息",response = ExpressParam.class)
    public ApiResult<Object> express( @RequestBody ExpressParam expressInfoDo){
        ExpressInfo expressInfo = expressService.getExpressInfo(expressInfoDo.getOrderCode(),
                expressInfoDo.getShipperCode(), expressInfoDo.getLogisticCode());
        if(!expressInfo.isSuccess()) return ApiResult.fail(expressInfo.getReason());
        return ApiResult.ok(expressInfo);
    }


}

