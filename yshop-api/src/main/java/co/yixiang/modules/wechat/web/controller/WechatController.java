package co.yixiang.modules.wechat.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.common.api.ApiCode;
import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.modules.order.entity.YxStoreOrder;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.modules.order.web.vo.YxStoreOrderQueryVo;
import co.yixiang.modules.security.security.JwtUser;
import co.yixiang.modules.security.utils.JwtTokenUtil;
import co.yixiang.modules.shop.service.YxSystemConfigService;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.entity.YxWechatUser;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.service.YxWechatUserService;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import co.yixiang.utils.EncryptUtils;
import co.yixiang.utils.OrderUtil;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.bean.notify.WxPayRefundNotifyResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.vdurmont.emoji.EmojiParser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpMessageRouter;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.message.WxMpXmlMessage;
import me.chanjar.weixin.mp.bean.message.WxMpXmlOutMessage;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName WechatController
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/11/5
 **/
@Slf4j
@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "微信模块", tags = "微信模块", description = "微信模块")
public class WechatController extends BaseController {

    private final WxMpService wxService;
    private final YxWechatUserService wechatUserService;
    private final YxUserService userService;
    private final WxPayService wxPayService;
    private final YxStoreOrderService orderService;
    private final WxMpMessageRouter messageRouter;
    private final YxSystemConfigService systemConfigService;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;


    @Autowired
    @Qualifier("jwtUserDetailsService")
    private UserDetailsService userDetailsService;

    /**
     * 微信分享配置
     */
    @GetMapping("/share")
    @ApiOperation(value = "微信分享配置",notes = "微信分享配置")
    public ApiResult<Object> share() {
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("img",systemConfigService.getData("wechat_share_img"));
        map.put("title",systemConfigService.getData("wechat_share_title"));
        map.put("synopsis",systemConfigService.getData("wechat_share_synopsis"));
        Map<String,Object> mapt = new LinkedHashMap<>();
        mapt.put("data",map);
        return ApiResult.ok(mapt);
    }

    /**
     * jssdk配置
     */
    @GetMapping("/wechat/config")
    @ApiOperation(value = "jssdk配置",notes = "jssdk配置")
    public ApiResult<Object> jsConfig(@RequestParam(value = "url") String url) throws WxErrorException {
        return ApiResult.ok(wxService.createJsapiSignature(url));
    }

    /**
     * 微信授权
     */
    @GetMapping("/wechat/auth")
    @ApiOperation(value = "微信授权",notes = "微信授权")
    public ApiResult<Object> authLogin(@RequestParam(value = "code") String code,
                                       @RequestParam(value = "spread") String spread) {
        //todo 分销人
        //String url = "https://h5.dayouqiantu.cn/";
        //wxService.oauth2buildAuthorizationUrl(url, WxConsts.OAuth2Scope.SNSAPI_USERINFO, null);

        try {
            WxMpOAuth2AccessToken wxMpOAuth2AccessToken = wxService.oauth2getAccessToken(code);
            WxMpUser wxMpUser = wxService.oauth2getUserInfo(wxMpOAuth2AccessToken, null);
            String openid = wxMpUser.getOpenId();
            YxWechatUser wechatUser = wechatUserService.getUserInfo(openid);


            JwtUser jwtUser = null;
            if(ObjectUtil.isNotNull(wechatUser)){
                YxUserQueryVo yxUserQueryVo = userService.getYxUserById(wechatUser.getUid());
                if(ObjectUtil.isNotNull(yxUserQueryVo)){
                    jwtUser = (JwtUser) userDetailsService.loadUserByUsername(wechatUser.getOpenid());
                }else{
                    if(ObjectUtil.isNotNull(wechatUser)){
                        wechatUserService.removeById(wechatUser.getUid());
                    }
                    if(ObjectUtil.isNotNull(yxUserQueryVo)){
                        userService.removeById(yxUserQueryVo.getUid());
                    }
                    return ApiResult.fail(ApiCode.FAIL_AUTH,"授权失败");
                }


            }else{

                //过滤掉表情
                String nickname = EmojiParser.removeAllEmojis(wxMpUser.getNickname());
                log.info("昵称：{}",nickname);
                //用户保存
                YxUser user = new YxUser();
                user.setAccount(nickname);
                user.setUsername(wxMpUser.getOpenId());
                user.setPassword(EncryptUtils.encryptPassword("123456"));
                user.setPwd(EncryptUtils.encryptPassword("123456"));
                user.setPhone("");
                user.setUserType("wechat");
                user.setAddTime(OrderUtil.getSecondTimestampTwo());
                user.setLastTime(OrderUtil.getSecondTimestampTwo());
                user.setNickname(nickname);
                user.setAvatar(wxMpUser.getHeadImgUrl());
                user.setNowMoney(BigDecimal.ZERO);
                user.setBrokeragePrice(BigDecimal.ZERO);
                user.setIntegral(BigDecimal.ZERO);

                userService.save(user);


                //保存微信用户
                YxWechatUser yxWechatUser = new YxWechatUser();
                yxWechatUser.setAddTime(OrderUtil.getSecondTimestampTwo());
                yxWechatUser.setNickname(nickname);
                yxWechatUser.setOpenid(wxMpUser.getOpenId());
                int sub = 0;
                if(ObjectUtil.isNotNull(wxMpUser.getSubscribe()) && wxMpUser.getSubscribe()) sub =1;
                yxWechatUser.setSubscribe(sub);
                yxWechatUser.setSex(wxMpUser.getSex());
                yxWechatUser.setLanguage(wxMpUser.getLanguage());
                yxWechatUser.setCity(wxMpUser.getCity());
                yxWechatUser.setProvince(wxMpUser.getProvince());
                yxWechatUser.setCountry(wxMpUser.getCountry());
                yxWechatUser.setHeadimgurl(wxMpUser.getHeadImgUrl());
                if(ObjectUtil.isNotNull(wxMpUser.getSubscribeTime())){
                    yxWechatUser.setSubscribeTime(wxMpUser.getSubscribeTime().intValue());
                }
                if(StrUtil.isNotEmpty(wxMpUser.getUnionId())){
                    yxWechatUser.setUnionid(wxMpUser.getUnionId());
                }
                if(StrUtil.isNotEmpty(wxMpUser.getRemark())){
                    yxWechatUser.setUnionid(wxMpUser.getRemark());
                }
                if(ObjectUtil.isNotEmpty(wxMpUser.getGroupId())){
                    yxWechatUser.setGroupid(wxMpUser.getGroupId());
                }
                yxWechatUser.setUid(user.getUid());

                wechatUserService.save(yxWechatUser);



                jwtUser = (JwtUser) userDetailsService.loadUserByUsername(wxMpUser.getOpenId());
            }


            //设置推广关系
            if(StrUtil.isNotEmpty(spread) && !spread.equals("NaN")){
                //System.out.println("spread:"+spread);
                userService.setSpread(Integer.valueOf(spread),
                        jwtUser.getId().intValue());
            }

            // 生成令牌
            final String token = jwtTokenUtil.generateToken(jwtUser);
            Date expiresTime = jwtTokenUtil.getExpirationDateFromToken(token);
            String expiresTimeStr = DateUtil.formatDateTime(expiresTime);
            Map<String,String> map = new LinkedHashMap<>();
            map.put("token",token);
            map.put("expires_time",expiresTimeStr);

            // 返回 token
            return ApiResult.ok(map);
        } catch (WxErrorException e) {
            e.printStackTrace();
            log.error(e.getMessage());
            return ApiResult.fail("授权失败");
        }
       // return ApiResult.ok(wxService.createJsapiSignature(url));
    }

    /**
     * 微信支付回调
     */
    @PostMapping("/wechat/notify")
    @ApiOperation(value = "微信支付回调",notes = "微信支付回调")
    public String notify(@RequestBody String xmlData) {
        try {
            WxPayOrderNotifyResult notifyResult = wxPayService.parseOrderNotifyResult(xmlData);
            String orderId = notifyResult.getOutTradeNo();
            YxStoreOrderQueryVo orderInfo = orderService.getOrderInfo(orderId,0);
            if(orderInfo.getPaid() == 1){
                return WxPayNotifyResponse.success("处理成功!");
            }

            orderService.paySuccess(orderId,"weixin");

            return WxPayNotifyResponse.success("处理成功!");
        } catch (WxPayException e) {
            log.error(e.getMessage());
            return WxPayNotifyResponse.fail(e.getMessage());
        }

    }

    /**
     * 微信退款回调
     * @param xmlData
     * @return
     * @throws WxPayException
     */
    @ApiOperation(value = "退款回调通知处理",notes = "退款回调通知处理")
    @PostMapping("/notify/refund")
    public String parseRefundNotifyResult(@RequestBody String xmlData) {
        try {
            WxPayRefundNotifyResult result = wxPayService.parseRefundNotifyResult(xmlData);
            String orderId = result.getReqInfo().getOutTradeNo();
            Integer refundFee = result.getReqInfo().getRefundFee()/100;
            YxStoreOrderQueryVo orderInfo = orderService.getOrderInfo(orderId,0);
            if(orderInfo.getRefundStatus() == 2){
                return WxPayNotifyResponse.success("处理成功!");
            }
            YxStoreOrder storeOrder = new YxStoreOrder();
            //修改状态
            storeOrder.setId(orderInfo.getId());
            storeOrder.setRefundStatus(2);
            storeOrder.setRefundPrice(BigDecimal.valueOf(refundFee));
            orderService.updateById(storeOrder);
            return WxPayNotifyResponse.success("处理成功!");
        } catch (WxPayException e) {
            log.error(e.getMessage());
            return WxPayNotifyResponse.fail(e.getMessage());
        }
    }


    /**
     * 微信验证消息
     */
    @GetMapping("/wechat/serve")
    @ApiOperation(value = "微信验证消息",notes = "微信验证消息")
    public String authGet(@RequestParam(name = "signature", required = false) String signature,
                          @RequestParam(name = "timestamp", required = false) String timestamp,
                          @RequestParam(name = "nonce", required = false) String nonce,
                          @RequestParam(name = "echostr", required = false) String echostr){

        if (wxService.checkSignature(timestamp, nonce, signature)) {
            return echostr;
        }

        return "fail";
    }


    @PostMapping("/wechat/serve")
    public void post(@RequestBody String requestBody,
                       @RequestParam("signature") String signature,
                       @RequestParam("timestamp") String timestamp,
                       @RequestParam("nonce") String nonce,
                       @RequestParam("openid") String openid,
                       @RequestParam(name = "encrypt_type", required = false) String encType,
                       @RequestParam(name = "msg_signature", required = false) String msgSignature,
                       HttpServletRequest request,
                       HttpServletResponse response) throws IOException {


        if (!wxService.checkSignature(timestamp, nonce, signature)) {
            throw new IllegalArgumentException("非法请求，可能属于伪造的请求！");
        }

        String out = null;
        if (encType == null) {
            // 明文传输的消息
            WxMpXmlMessage inMessage = WxMpXmlMessage.fromXml(requestBody);
            WxMpXmlOutMessage outMessage = this.route(inMessage);
            if(outMessage == null) return;
            out = outMessage.toXml();;
        } else if ("aes".equalsIgnoreCase(encType)) {
            // aes加密的消息
            WxMpXmlMessage inMessage = WxMpXmlMessage.fromEncryptedXml(requestBody, wxService.getWxMpConfigStorage(),
                    timestamp, nonce, msgSignature);
            WxMpXmlOutMessage outMessage = this.route(inMessage);

            out = outMessage.toEncryptedXml(wxService.getWxMpConfigStorage());
        }

        response.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print(out);
        writer.close();
    }

    private WxMpXmlOutMessage route(WxMpXmlMessage message) {
        try {
            return this.messageRouter.route(message);
        } catch (Exception e) {
            log.error("路由消息时出现异常！", e);
        }

        return null;
    }




}
