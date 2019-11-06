package co.yixiang.modules.order.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.exception.ErrorRequestException;
import co.yixiang.modules.monitor.service.RedisService;
import co.yixiang.modules.order.entity.YxStoreOrder;
import co.yixiang.modules.order.entity.YxStoreOrderCartInfo;
import co.yixiang.modules.order.mapper.YxStoreOrderMapper;
import co.yixiang.modules.order.mapping.OrderMap;
import co.yixiang.modules.order.service.YxStoreOrderCartInfoService;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.modules.order.service.YxStoreOrderStatusService;
import co.yixiang.modules.order.web.dto.*;
import co.yixiang.modules.order.web.param.OrderParam;
import co.yixiang.modules.order.web.param.RefundParam;
import co.yixiang.modules.order.web.param.YxStoreOrderQueryParam;
import co.yixiang.modules.order.web.vo.YxStoreOrderQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.entity.YxStoreCart;
import co.yixiang.modules.shop.mapper.YxStoreCartMapper;
import co.yixiang.modules.shop.service.YxStoreProductReplyService;
import co.yixiang.modules.shop.service.YxStoreProductService;
import co.yixiang.modules.shop.service.YxSystemConfigService;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.entity.YxUserAddress;
import co.yixiang.modules.user.entity.YxUserBill;
import co.yixiang.modules.user.entity.YxWechatUser;
import co.yixiang.modules.user.service.YxUserAddressService;
import co.yixiang.modules.user.service.YxUserBillService;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.service.YxWechatUserService;
import co.yixiang.modules.user.web.controller.UserAddressController;
import co.yixiang.modules.user.web.vo.YxUserAddressQueryVo;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import co.yixiang.modules.user.web.vo.YxWechatUserQueryVo;
import co.yixiang.utils.OrderUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderRequest;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreOrderServiceImpl extends BaseServiceImpl<YxStoreOrderMapper, YxStoreOrder> implements YxStoreOrderService {

    @Autowired
    private YxStoreOrderMapper yxStoreOrderMapper;

    @Autowired
    private  YxSystemConfigService systemConfigService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private OrderMap orderMap;

    @Autowired
    private YxUserService userService;

    @Autowired
    private YxUserAddressService userAddressService;

    @Autowired
    private YxStoreProductService productService;

    @Autowired
    private YxStoreOrderCartInfoService orderCartInfoService;

    @Autowired
    private YxStoreCartMapper storeCartMapper;

    @Autowired
    private YxStoreOrderStatusService orderStatusService;

    @Autowired
    private YxUserBillService billService;

    @Autowired
    private YxStoreProductReplyService storeProductReplyService;

    @Autowired
    private  WxPayService wxPayService;

    @Autowired
    private YxWechatUserService wechatUserService;


    /**
     * 奖励积分
     * @param order
     */
    @Override
    public void gainUserIntegral(YxStoreOrderQueryVo order) {
        if(order.getGainIntegral().intValue() > 0){
            YxUserQueryVo userQueryVo = userService
                    .getYxUserById(order.getUid());

            YxUser user = new YxUser();

            user.setIntegral(NumberUtil.add(userQueryVo.getIntegral(),
                    order.getGainIntegral()));
            user.setUid(order.getUid());
            userService.updateById(user);

            YxUserBill userBill = new YxUserBill();
            userBill.setUid(order.getUid());
            userBill.setTitle("购买商品赠送积分");
            userBill.setLinkId(order.getId().toString());
            userBill.setCategory("integral");
            userBill.setType("gain");
            userBill.setNumber(order.getGainIntegral());
            userBill.setBalance(userQueryVo.getIntegral());
            userBill.setMark("购买商品赠送");
            userBill.setStatus(1);
            userBill.setPm(1);
            userBill.setAddTime(OrderUtil.getSecondTimestampTwo());
            billService.save(userBill);

        }
    }


    /**
     * 删除订单
     * @param orderId
     * @param uid
     */
    @Override
    public void removeOrder(String orderId, int uid) {
        YxStoreOrderQueryVo order = getOrderInfo(orderId,uid);
        if(ObjectUtil.isNull(order)) throw new ErrorRequestException("订单不存在");
        order = handleOrder(order);
        if(!order.get_status().get_type().equals("0") &&
                !order.get_status().get_type().equals("-2") &&
                !order.get_status().get_type().equals("4")) {
            throw new ErrorRequestException("该订单无法删除");
        }

        YxStoreOrder storeOrder = new YxStoreOrder();
        storeOrder.setIsDel(1);
        storeOrder.setId(order.getId());
        yxStoreOrderMapper.updateById(storeOrder);

        //增加状态
        orderStatusService.create(order.getId(),"remove_order","删除订单");
    }

    /**
     * 订单确认收货
     * @param orderId
     * @param uid
     */
    @Override
    public void takeOrder(String orderId, int uid) {
        YxStoreOrderQueryVo order = getOrderInfo(orderId,uid);
        if(ObjectUtil.isNull(order)) throw new ErrorRequestException("订单不存在");
        order = handleOrder(order);
        if(!order.get_status().get_type().equals("2")) throw new ErrorRequestException("订单状态错误");

        YxStoreOrder storeOrder = new YxStoreOrder();
        storeOrder.setStatus(2);
        storeOrder.setId(order.getId());
        yxStoreOrderMapper.updateById(storeOrder);

        //增加状态
        orderStatusService.create(order.getId(),"user_take_delivery","用户已收货");

        //奖励积分
        gainUserIntegral(order);

        //todo 分销计算

    }

    /**
     * 申请退款
     * @param param
     * @param uid
     */
    @Override
    public void orderApplyRefund(RefundParam param, int uid) {
        YxStoreOrderQueryVo order = getOrderInfo(param.getUni(),uid);
        if(ObjectUtil.isNull(order)) throw new ErrorRequestException("订单不存在");
        if(order.getRefundStatus() == 2) throw new ErrorRequestException("订单已退款");
        if(order.getRefundStatus() == 1) throw new ErrorRequestException("正在申请退款中");
        if(order.getStatus() == 1 ) throw new ErrorRequestException("订单当前无法退款");

        YxStoreOrder storeOrder = new YxStoreOrder();
        storeOrder.setRefundStatus(1);
        storeOrder.setRefundReasonTime(OrderUtil.getSecondTimestampTwo());
        storeOrder.setRefundReasonWapExplain(param.getRefund_reason_wap_explain());
        storeOrder.setRefundReasonWapImg(param.getRefund_reason_wap_img());
        storeOrder.setRefundReasonWap(param.getText());
        storeOrder.setId(order.getId());
        yxStoreOrderMapper.updateById(storeOrder);

        //增加状态
        orderStatusService.create(order.getId(),"apply_refund","用户申请退款，原因："+param.getText());

        //todo 推送
    }

    /**
     * 订单列表
     * @param uid
     * @param type
     * @param page
     * @param limit
     * @return
     */
    @Override
    public List<YxStoreOrderQueryVo> orderList(int uid, int type, int page, int limit) {
        QueryWrapper<YxStoreOrder> wrapper= new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("uid",uid).orderByDesc("add_time");

        switch (type){
            case 0://未支付
                wrapper.eq("paid",0).eq("refund_status",0).eq("status",0);
                break;
            case 1://待发货
                wrapper.eq("paid",1).eq("refund_status",0).eq("status",0);
                break;
            case 2://待收货
                wrapper.eq("paid",1).eq("refund_status",0).eq("status",1);
                break;
            case 3://待评价
                wrapper.eq("paid",1).eq("refund_status",0).eq("status",2);
                break;
            case 4://已完成
                wrapper.eq("paid",1).eq("refund_status",0).eq("status",3);
                break;
            case -1://退款中
                wrapper.eq("paid",1).eq("refund_status",1);
                break;
            case -2://已退款
                wrapper.eq("paid",0).eq("refund_status",2);
                break;
            case -3://退款
                String[] strs = {"1","2"};
                wrapper.eq("paid",1).in("refund_status",strs);
                break;
        }

        Page<YxStoreOrder> pageModel = new Page<>(page, limit);

        IPage<YxStoreOrder> pageList = yxStoreOrderMapper.selectPage(pageModel,wrapper);
        List<YxStoreOrderQueryVo> list = orderMap.toDto(pageList.getRecords());
        List<YxStoreOrderQueryVo> newList = new ArrayList<>();
        for (YxStoreOrderQueryVo order : list) {
            YxStoreOrderQueryVo orderQueryVo = handleOrder(order);
            newList.add(orderQueryVo);
        }

        return newList;
    }

    /**
     * 获取某个用户的订单统计数据
     * @return
     */
    @Override
    public OrderCountDTO orderData(int uid) {

        OrderCountDTO countDTO = new OrderCountDTO();
        //订单支付没有退款 数量
        QueryWrapper<YxStoreOrder> wrapperOne = new QueryWrapper<>();
        wrapperOne.eq("is_del",0).eq("paid",1)
                .eq("uid",uid).eq("refund_status",0);
        countDTO.setOrderCount(yxStoreOrderMapper.selectCount(wrapperOne));

        //订单支付没有退款 支付总金额
        countDTO.setSumPrice(yxStoreOrderMapper.sumPrice(uid));

        //订单待支付 数量
        QueryWrapper<YxStoreOrder> wrapperTwo = new QueryWrapper<>();
        wrapperTwo.eq("is_del",0).eq("paid",0)
                .eq("uid",uid).eq("refund_status",0).eq("status",0);
        countDTO.setUnpaidCount(yxStoreOrderMapper.selectCount(wrapperTwo));

        //订单待发货 数量
        QueryWrapper<YxStoreOrder> wrapperThree = new QueryWrapper<>();
        wrapperThree.eq("is_del",0).eq("paid",1)
                .eq("uid",uid).eq("refund_status",0).eq("status",0);
        countDTO.setUnshippedCount(yxStoreOrderMapper.selectCount(wrapperThree));

        //订单待收货 数量
        QueryWrapper<YxStoreOrder> wrapperFour = new QueryWrapper<>();
        wrapperFour.eq("is_del",0).eq("paid",1)
                .eq("uid",uid).eq("refund_status",0).eq("status",1);
        countDTO.setReceivedCount(yxStoreOrderMapper.selectCount(wrapperFour));

        //订单待评价 数量
        QueryWrapper<YxStoreOrder> wrapperFive = new QueryWrapper<>();
        wrapperFive.eq("is_del",0).eq("paid",1)
                .eq("uid",uid).eq("refund_status",0).eq("status",2);
        countDTO.setEvaluatedCount(yxStoreOrderMapper.selectCount(wrapperFive));

        //订单已完成 数量
        QueryWrapper<YxStoreOrder> wrapperSix= new QueryWrapper<>();
        wrapperSix.eq("is_del",0).eq("paid",1)
                .eq("uid",uid).eq("refund_status",0).eq("status",3);
        countDTO.setCompleteCount(yxStoreOrderMapper.selectCount(wrapperSix));

        //订单退款
        QueryWrapper<YxStoreOrder> wrapperSeven= new QueryWrapper<>();
        String[] strArr = {"1","2"};
        wrapperSeven.eq("is_del",0).eq("paid",1)
                .eq("uid",uid).in("refund_status",strArr);
        countDTO.setRefundCount(yxStoreOrderMapper.selectCount(wrapperSeven));


        return countDTO;
    }

    /**
     * 处理订单返回的状态
     * @param order order
     * @return
     */
    @Override
    public YxStoreOrderQueryVo handleOrder(YxStoreOrderQueryVo order) {
        QueryWrapper<YxStoreOrderCartInfo> wrapper = new QueryWrapper<>();
        wrapper.eq("oid",order.getId());
        List<YxStoreOrderCartInfo> cartInfos = orderCartInfoService.list(wrapper);

        List<YxStoreCartQueryVo> cartInfo = new ArrayList<>();
        for (YxStoreOrderCartInfo info : cartInfos) {
            YxStoreCartQueryVo cartQueryVo = JSON.parseObject(info.getCartInfo(),YxStoreCartQueryVo.class);
            cartQueryVo.setUnique(info.getUnique());
            //新增是否评价字段
            cartQueryVo.setIsReply(storeProductReplyService.replyCount(info.getUnique()));
            cartInfo.add(cartQueryVo);
        }
        order.setCartInfo(cartInfo);
        StatusDTO statusDTO = new StatusDTO();
        if(order.getPaid() == 0){
            statusDTO.set_class("nobuy");
            statusDTO.set_msg("请完成支付");
            statusDTO.set_type("0");
            statusDTO.set_title("未支付");
        }else if(order.getRefundStatus() == 1){
            statusDTO.set_class("state-sqtk");
            statusDTO.set_msg("商家审核中,请耐心等待");
            statusDTO.set_type("-1");
            statusDTO.set_title("申请退款中");
        }else if(order.getRefundStatus() == 2){
            statusDTO.set_class("state-sqtk");
            statusDTO.set_msg("已为您退款,感谢您的支持");
            statusDTO.set_type("-2");
            statusDTO.set_title("已退款");
        }else if(order.getStatus() == 0){
            //todo 拼团
            //todo 店铺核销
            statusDTO.set_class("state-nfh");
            statusDTO.set_msg("商家未发货,请耐心等待");
            statusDTO.set_type("1");
            statusDTO.set_title("未发货");
        }else if(order.getStatus() == 1){
            statusDTO.set_class("state-ysh");
            statusDTO.set_msg("服务商已发货");
            statusDTO.set_type("2");
            statusDTO.set_title("待收货");
        }else if(order.getStatus() == 2){
            statusDTO.set_class("state-ypj");
            statusDTO.set_msg("已收货,快去评价一下吧");
            statusDTO.set_type("3");
            statusDTO.set_title("待评价");
        }else if(order.getStatus() == 3){
            statusDTO.set_class("state-ytk");
            statusDTO.set_msg("交易完成,感谢您的支持");
            statusDTO.set_type("4");
            statusDTO.set_title("交易完成");
        }

        if(order.getPayType().equals("weixin")){
            statusDTO.set_payType("微信支付");
        }else{
            statusDTO.set_payType("余额支付");
        }

        order.set_status(statusDTO);


        return order;
    }

    /**
     * 支付成功后操作
     * @param orderId 订单号
     * @param payType 支付方式
     */
    @Override
    public void paySuccess(String orderId, String payType) {
        YxStoreOrderQueryVo orderInfo = getOrderInfo(orderId,0);
        //System.out.println("orderInfo:"+orderInfo);

        //更新订单状态
        QueryWrapper<YxStoreOrder> wrapper = new QueryWrapper<>();
        wrapper.eq("order_id",orderId);
        YxStoreOrder storeOrder = new YxStoreOrder();
        storeOrder.setPaid(1);
        storeOrder.setPayType(payType);
        storeOrder.setPayTime(OrderUtil.getSecondTimestampTwo());
        yxStoreOrderMapper.update(storeOrder,wrapper);

        //增加用户购买次数
        userService.incPayCount(orderInfo.getUid());
        //增加状态
        orderStatusService.create(orderInfo.getId(),"pay_success","用户付款成功");

        //todo 拼团
        //todo 模板消息推送
    }

    /**
     * 微信支付
     * @param orderId
     */
    @Override
    public WxPayMpOrderResult wxPay(String orderId) throws WxPayException {
        YxStoreOrderQueryVo orderInfo = getOrderInfo(orderId,0);
        if(ObjectUtil.isNull(orderInfo)) throw new ErrorRequestException("订单不存在");
        if(orderInfo.getPaid() == 1) throw new ErrorRequestException("该订单已支付");

        if(orderInfo.getPayPrice().doubleValue() <= 0) throw new ErrorRequestException("该支付无需支付");

        WxPayUnifiedOrderRequest orderRequest = new WxPayUnifiedOrderRequest();
        YxWechatUser wechatUser = wechatUserService.getById(orderInfo.getUid());
        if(ObjectUtil.isNull(wechatUser)) throw new ErrorRequestException("用户错误");
        orderRequest.setBody("商品购买");
        orderRequest.setOutTradeNo(orderId);
        BigDecimal bigDecimal = new BigDecimal(100);
        orderRequest.setTotalFee(bigDecimal.multiply(orderInfo.getPayPrice()).intValue());//元转成分
        orderRequest.setOpenid(wechatUser.getOpenid());
        orderRequest.setSpbillCreateIp("127.0.0.1");
        orderRequest.setNotifyUrl("https://h5api.dayouqiantu.cn/api/wechat/notify");
        orderRequest.setTradeType("JSAPI");

        WxPayMpOrderResult orderResult = wxPayService.createOrder(orderRequest);

        return orderResult;

    }

    /**
     * 余额支付
     * @param orderId 订单号
     * @param uid 用户id
     */
    @Override
    public void yuePay(String orderId, int uid) {
        YxStoreOrderQueryVo orderInfo = getOrderInfo(orderId,uid);
        if(ObjectUtil.isNull(orderInfo)) throw new ErrorRequestException("订单不存在");

        if(orderInfo.getPaid() == 1) throw new ErrorRequestException("该订单已支付");

        YxUserQueryVo userInfo = userService.getYxUserById(uid);

        if(userInfo.getNowMoney().doubleValue() < orderInfo.getPayPrice().doubleValue()){
            throw new ErrorRequestException("余额不足");
        }

        userService.decPrice(uid,orderInfo.getPayPrice().doubleValue());

        YxUserBill userBill = new YxUserBill();
        userBill.setUid(uid);
        userBill.setTitle("购买商品");
        userBill.setLinkId(orderInfo.getId().toString());
        userBill.setCategory("now_money");
        userBill.setType("pay_product");
        userBill.setNumber(orderInfo.getPayPrice());
        userBill.setBalance(userInfo.getNowMoney());
        userBill.setMark("余额支付");
        userBill.setStatus(1);
        userBill.setPm(0);
        userBill.setAddTime(OrderUtil.getSecondTimestampTwo());
        billService.save(userBill);

        //支付成功后处理
        paySuccess(orderInfo.getOrderId(),"yue");

    }

    /**
     * 创建订单
     * @param uid uid
     * @param key key
     * @param param param
     * @return
     */
    @Override
    public YxStoreOrder createOrder(int uid, String key, OrderParam param) {
        YxUserQueryVo userInfo = userService.getYxUserById(uid);
        if(ObjectUtil.isNull(userInfo)) throw new ErrorRequestException("用户不存在");

        CacheDTO cacheDTO = getCacheOrderInfo(uid,key);
        if(ObjectUtil.isNull(cacheDTO)){
            throw new ErrorRequestException("订单已过期,请刷新当前页面");
        }

        List<YxStoreCartQueryVo> cartInfo = cacheDTO.getCartInfo();
        Double totalPrice =  cacheDTO.getPriceGroup().getTotalPrice();
        Double payPrice = cacheDTO.getPriceGroup().getTotalPrice();
        Double payPostage = cacheDTO.getPriceGroup().getStorePostage();
        OtherDTO other = cacheDTO.getOther();
        YxUserAddressQueryVo userAddress = null;
        if(param.getShippingType() == 1){
            if(StrUtil.isEmpty(param.getAddressId())) throw new ErrorRequestException("请选择收货地址");
            userAddress = userAddressService.getYxUserAddressById(param.getAddressId());
            if(ObjectUtil.isNull(userAddress)) throw new ErrorRequestException("地址选择有误");
        }

        Integer totalNum = 0;
        Integer gainIntegral = 0;
        List<String> cartIds = new ArrayList<>();

        for (YxStoreCartQueryVo cart : cartInfo) {
            cartIds.add(cart.getId().toString());
            totalNum += cart.getCartNum();
            //计算积分
            BigDecimal cartInfoGainIntegral = BigDecimal.ZERO;
            if(cart.getProductInfo().getGiveIntegral().intValue() > 0){
                cartInfoGainIntegral = NumberUtil.mul(cart.getCartNum(),cart.
                        getProductInfo().getGiveIntegral());
            }
            gainIntegral = NumberUtil.add(gainIntegral,cartInfoGainIntegral).intValue();
        }

        //todo 优惠券
        int couponId = 0;
        Double couponPrice = 0d;
        if(ObjectUtil.isNotEmpty(param.getCouponId())){
            //todo
        }
        //todo 门店等二期

        if(param.getShippingType() == 1){
            payPrice = NumberUtil.add(payPrice,payPostage);
        }

        //todo 积分抵扣

        if(payPrice <= 0) payPrice = 0d;

        //组合数据
        YxStoreOrder storeOrder = new YxStoreOrder();
        storeOrder.setUid(uid);
        storeOrder.setOrderId(OrderUtil.orderSn());
        storeOrder.setRealName(userAddress.getRealName());
        storeOrder.setUserPhone(userAddress.getPhone());
        storeOrder.setUserAddress(userAddress.getProvince()+" "+userAddress.getCity()+
                " "+userAddress.getDistrict()+" "+userAddress.getDetail());
        storeOrder.setCartId(StrUtil.join(",",cartIds));
        storeOrder.setTotalNum(totalNum);
        storeOrder.setTotalPrice(BigDecimal.valueOf(totalPrice));
        storeOrder.setTotalPostage(BigDecimal.valueOf(payPostage));
        storeOrder.setCouponId(couponId);
        storeOrder.setCouponPrice(BigDecimal.valueOf(couponPrice));
        storeOrder.setPayPrice(BigDecimal.valueOf(payPrice));
        storeOrder.setPayPostage(BigDecimal.valueOf(payPostage));
        storeOrder.setDeductionPrice(BigDecimal.ZERO);
        storeOrder.setPaid(0);
        storeOrder.setPayType(param.getPayType());
        storeOrder.setUseIntegral(BigDecimal.valueOf(param.getUseIntegral()));
        storeOrder.setGainIntegral(BigDecimal.valueOf(gainIntegral));
        storeOrder.setMark(param.getMark());
        storeOrder.setCombinationId(0);
        storeOrder.setPinkId(0);
        storeOrder.setSeckillId(0);
        storeOrder.setBargainId(0);
        storeOrder.setCost(BigDecimal.valueOf(cacheDTO.getPriceGroup().getCostPrice()));
        storeOrder.setIsChannel(param.getIsChannel());
        storeOrder.setAddTime(OrderUtil.getSecondTimestampTwo());
        storeOrder.setUnique(key);
        storeOrder.setShippingType(param.getShippingType());

        boolean res = save(storeOrder);
        if(!res) throw new ErrorRequestException("订单生成失败");

        //减库存加销量
        for (YxStoreCartQueryVo cart : cartInfo) {
            productService.decProductStock(cart.getCartNum(),cart.getProductId(),
                    cart.getProductAttrUnique());
        }

        //保存购物车商品信息
        orderCartInfoService.saveCartInfo(storeOrder.getId(),cartInfo);

        //购物车状态修改
        QueryWrapper<YxStoreCart> wrapper = new QueryWrapper<>();
        wrapper.in("id",cartIds);
        YxStoreCart cartObj = new YxStoreCart();
        cartObj.setIsPay(1);
        storeCartMapper.update(cartObj,wrapper);

        //删除缓存
        delCacheOrderInfo(uid,key);

        //增加状态
        orderStatusService.create(storeOrder.getId(),"cache_key_create_order","订单生成");



        return storeOrder;
    }

    /**
     * 计算价格
     * @param key
     * @param couponId
     * @param useIntegral
     * @param shippingType
     * @return
     */
    @Override
    public ComputeDTO computedOrder(int uid, String key, int couponId,
                                    int useIntegral, int shippingType) {
        CacheDTO cacheDTO = getCacheOrderInfo(uid,key);
        if(ObjectUtil.isNull(cacheDTO)){
            throw new ErrorRequestException("订单已过期,请刷新当前页面");
        }
        ComputeDTO computeDTO = new ComputeDTO();
        computeDTO.setTotalPrice(cacheDTO.getPriceGroup().getTotalPrice());
        Double payPrice = cacheDTO.getPriceGroup().getTotalPrice();
        Double payPostage = cacheDTO.getPriceGroup().getStorePostage();
        //todo 优惠券

        //todo 积分抵扣
        computeDTO.setPayPrice(payPrice);
        computeDTO.setPayPostage(payPostage);
        computeDTO.setCouponPrice(0d);
        computeDTO.setDeductionPrice(0d);

        return computeDTO;
    }

    /**
     * 订单信息
     * @param unique
     * @param uid
     * @return
     */
    @Override
    public YxStoreOrderQueryVo getOrderInfo(String unique,int uid) {
        QueryWrapper<YxStoreOrder> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).and(
                i->i.eq("order_id",unique).or().eq("`unique`",unique));
        if(uid > 0) wrapper.eq("uid",uid);

        return orderMap.toDto(yxStoreOrderMapper.selectOne(wrapper));
    }

    @Override
    public CacheDTO getCacheOrderInfo(int uid, String key) {

        return (CacheDTO)redisService.getObj("user_order_"+uid+key);
    }

    @Override
    public void delCacheOrderInfo(int uid, String key) {
        redisService.delete("user_order_"+uid+key);
    }

    /**
     * 缓存订单
     * @param uid uid
     * @param cartInfo cartInfo
     * @param priceGroup priceGroup
     * @param other other
     * @return
     */
    @Override
    public String cacheOrderInfo(int uid, List<YxStoreCartQueryVo> cartInfo, PriceGroupDTO priceGroup, OtherDTO other) {
        String key = IdUtil.simpleUUID();
        CacheDTO cacheDTO = new CacheDTO();
        cacheDTO.setCartInfo(cartInfo);
        cacheDTO.setPriceGroup(priceGroup);
        cacheDTO.setOther(other);
        redisService.saveCode("user_order_"+uid+key,cacheDTO,600L);
        return key;
    }

    /**
     * 获取订单价格
     * @param cartInfo
     * @return
     */
    @Override
    public PriceGroupDTO getOrderPriceGroup(List<YxStoreCartQueryVo> cartInfo) {

        String storePostageStr = systemConfigService.getData("store_postage");//邮费基础价
        Double storePostage = 0d;
        if(StrUtil.isNotEmpty(storePostageStr)) storePostage = Double.valueOf(storePostageStr);

        String storeFreePostageStr = systemConfigService.getData("store_free_postage");//满额包邮
        Double storeFreePostage = 0d;
        if(StrUtil.isNotEmpty(storeFreePostageStr)) storeFreePostage = Double.valueOf(storeFreePostageStr);

        Double totalPrice = getOrderSumPrice(cartInfo, "truePrice");//获取订单总金额
        Double costPrice = getOrderSumPrice(cartInfo, "costPrice");//获取订单成本价
        Double vipPrice = getOrderSumPrice(cartInfo, "vipTruePrice");//获取订单会员优惠金额

        if(storeFreePostage == 0){//包邮
            storePostage = 0d;
        }else{
            for (YxStoreCartQueryVo storeCart : cartInfo) {
                if(storeCart.getProductInfo().getIsPostage() == 0){//不包邮
                    storePostage = NumberUtil.add(storePostage
                            ,storeCart.getProductInfo().getPostage()).doubleValue();
                }
            }
            //如果总价大于等于满额包邮 邮费等于0
            if (storeFreePostage <= totalPrice) storePostage = 0d;
        }

        PriceGroupDTO priceGroupDTO = new PriceGroupDTO();
        priceGroupDTO.setStorePostage(storePostage);
        priceGroupDTO.setStoreFreePostage(storeFreePostage);
        priceGroupDTO.setTotalPrice(totalPrice);
        priceGroupDTO.setCostPrice(costPrice);
        priceGroupDTO.setVipPrice(vipPrice);

        return priceGroupDTO;
    }

    /**
     * 获取某字段价格
     * @param cartInfo
     * @param key
     * @return
     */
    @Override
    public Double getOrderSumPrice(List<YxStoreCartQueryVo> cartInfo, String key) {
        BigDecimal sumPrice = BigDecimal.ZERO;

        if(key.equals("truePrice")){
            for (YxStoreCartQueryVo storeCart : cartInfo) {
                sumPrice = NumberUtil.add(sumPrice,NumberUtil.mul(storeCart.getCartNum(),storeCart.getTruePrice()));
            }
        }else if(key.equals("costPrice")){
            for (YxStoreCartQueryVo storeCart : cartInfo) {
                sumPrice = NumberUtil.add(sumPrice,
                        NumberUtil.mul(storeCart.getCartNum(),storeCart.getCostPrice()));
            }
        }else if(key.equals("vipTruePrice")){
            for (YxStoreCartQueryVo storeCart : cartInfo) {
                sumPrice = NumberUtil.add(sumPrice,
                        NumberUtil.mul(storeCart.getCartNum(),storeCart.getVipTruePrice()));
            }
        }

        //System.out.println("sumPrice:"+sumPrice);
        return sumPrice.doubleValue();
    }

    @Override
    public YxStoreOrderQueryVo getYxStoreOrderById(Serializable id) throws Exception{
        return yxStoreOrderMapper.getYxStoreOrderById(id);
    }

    @Override
    public Paging<YxStoreOrderQueryVo> getYxStoreOrderPageList(YxStoreOrderQueryParam yxStoreOrderQueryParam) throws Exception{
        Page page = setPageParam(yxStoreOrderQueryParam,OrderItem.desc("create_time"));
        IPage<YxStoreOrderQueryVo> iPage = yxStoreOrderMapper.getYxStoreOrderPageList(page,yxStoreOrderQueryParam);
        return new Paging(iPage);
    }

}
