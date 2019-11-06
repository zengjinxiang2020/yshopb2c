package co.yixiang.modules.wechat.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.modules.order.web.vo.YxStoreOrderQueryVo;
import co.yixiang.modules.security.security.JwtUser;
import co.yixiang.modules.security.utils.JwtTokenUtil;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.entity.YxWechatUser;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.service.YxWechatUserService;
import co.yixiang.utils.EncryptUtils;
import co.yixiang.utils.OrderUtil;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyResponse;
import com.github.binarywang.wxpay.bean.notify.WxPayOrderNotifyResult;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private JwtTokenUtil jwtTokenUtil;


    @Autowired
    @Qualifier("jwtUserDetailsService")
    private UserDetailsService userDetailsService;

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
    public ApiResult<Object> authLogin(@RequestParam(value = "code") String code) {
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
                jwtUser = (JwtUser) userDetailsService.loadUserByUsername(wechatUser.getNickname());
            }else{
                //保存微信用户
                YxWechatUser yxWechatUser = new YxWechatUser();
               // System.out.println("wxMpUser:"+wxMpUser);
                yxWechatUser.setAddTime(OrderUtil.getSecondTimestampTwo());
                yxWechatUser.setNickname(wxMpUser.getNickname());
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

                wechatUserService.save(yxWechatUser);


                //用户保存
                YxUser user = new YxUser();
                user.setAccount(wxMpUser.getNickname());
                user.setUsername(wxMpUser.getNickname());
                user.setPassword(EncryptUtils.encryptPassword("123456"));
                user.setPwd(EncryptUtils.encryptPassword("123456"));
                user.setPhone("");
                user.setUserType("wechat");
                user.setAddTime(OrderUtil.getSecondTimestampTwo());
                user.setLastTime(OrderUtil.getSecondTimestampTwo());
                user.setNickname(wxMpUser.getNickname());
                user.setAvatar(wxMpUser.getHeadImgUrl());
                user.setNowMoney(BigDecimal.ZERO);
                user.setBrokeragePrice(BigDecimal.ZERO);
                user.setIntegral(BigDecimal.ZERO);
                user.setUid(yxWechatUser.getUid());
                userService.save(user);

                jwtUser = (JwtUser) userDetailsService.loadUserByUsername(wxMpUser.getNickname());
            }

            //System.out.println("jwtUser:"+jwtUser);

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




}
