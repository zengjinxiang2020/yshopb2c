package co.yixiang.modules.wechat.web.controller;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import cn.binarywang.wx.miniapp.config.WxMaConfig;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.common.api.ApiCode;
import co.yixiang.common.api.ApiResult;
import co.yixiang.exception.ErrorRequestException;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.modules.security.security.JwtUser;
import co.yixiang.modules.security.utils.JwtTokenUtil;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.entity.YxWechatUser;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.service.YxWechatUserService;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import co.yixiang.mp.utils.JsonUtils;
import co.yixiang.utils.EncryptUtils;
import co.yixiang.utils.OrderUtil;
import co.yixiang.utils.RedisUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.bean.WxAccessToken;
import me.chanjar.weixin.common.util.http.apache.ApacheHttpClientBuilder;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;


import me.chanjar.weixin.common.error.WxErrorException;

import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.locks.Lock;

/**
 * 微信小程序用户接口
 *
 * @author xuwenbo
 */
@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "微信小程序", tags = "微信小程序", description = "微信小程序")
public class WxMaUserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final WxMaService wxMaService;
    private final YxWechatUserService wechatUserService;
    private final YxUserService userService;
    private final JwtTokenUtil jwtTokenUtil;


    @Autowired
    @Qualifier("jwtUserDetailsService")
    private UserDetailsService userDetailsService;

    /**
     * 小程序登陆接口
     */
    @PostMapping("/wechat/mp_auth")
    @ApiOperation(value = "小程序登陆",notes = "小程序登陆")
    public ApiResult<Object> login(@RequestParam(value = "code") String code,
                                   @RequestParam(value = "spread") String spread,
                                   @RequestParam(value = "encryptedData") String encryptedData,
                                   @RequestParam(value = "iv") String iv ) {
        if (StringUtils.isBlank(code)) {
            return ApiResult.fail("empty jscode");
        }
        try {
            //读取redis配置
            String appId = RedisUtil.get("wxapp_appId");
            String secret = RedisUtil.get("wxapp_secret");
            if(StrUtil.isBlank(appId) || StrUtil.isBlank(secret)){
                throw new ErrorRequestException("请先配置小程序");
            }
           WxMaDefaultConfigImpl wxMaConfig = new WxMaDefaultConfigImpl();
            wxMaConfig.setAppid(appId);
            wxMaConfig.setSecret(secret);


           wxMaService.setWxMaConfig(wxMaConfig);
            WxMaJscode2SessionResult session = wxMaService.getUserService().getSessionInfo(code);
            YxWechatUser wechatUser = wechatUserService.getUserInfo(session.getOpenid());;
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
                WxMaUserInfo wxMpUser = wxMaService.getUserService()
                        .getUserInfo(session.getSessionKey(), encryptedData, iv);
                //用户保存
                YxUser user = new YxUser();
                user.setAccount(wxMpUser.getNickName());
                user.setUsername(wxMpUser.getOpenId());
                user.setPassword(EncryptUtils.encryptPassword("123456"));
                user.setPwd(EncryptUtils.encryptPassword("123456"));
                user.setPhone("");
                user.setUserType("wechat");
                user.setAddTime(OrderUtil.getSecondTimestampTwo());
                user.setLastTime(OrderUtil.getSecondTimestampTwo());
                user.setNickname(wxMpUser.getNickName());
                user.setAvatar(wxMpUser.getAvatarUrl());
                user.setNowMoney(BigDecimal.ZERO);
                user.setBrokeragePrice(BigDecimal.ZERO);
                user.setIntegral(BigDecimal.ZERO);

                userService.save(user);


                //保存微信用户
                YxWechatUser yxWechatUser = new YxWechatUser();
                // System.out.println("wxMpUser:"+wxMpUser);
                yxWechatUser.setAddTime(OrderUtil.getSecondTimestampTwo());
                yxWechatUser.setNickname(wxMpUser.getNickName());
                yxWechatUser.setOpenid(wxMpUser.getOpenId());
                int sub = 0;
                yxWechatUser.setSubscribe(sub);
                yxWechatUser.setSex(Integer.valueOf(wxMpUser.getGender()));
                yxWechatUser.setLanguage(wxMpUser.getLanguage());
                yxWechatUser.setCity(wxMpUser.getCity());
                yxWechatUser.setProvince(wxMpUser.getProvince());
                yxWechatUser.setCountry(wxMpUser.getCountry());
                yxWechatUser.setHeadimgurl(wxMpUser.getAvatarUrl());
                if(StrUtil.isNotEmpty(wxMpUser.getUnionId())){
                    yxWechatUser.setUnionid(wxMpUser.getUnionId());
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
            this.logger.error(e.getMessage(), e);
            return ApiResult.fail(e.toString());
        }
    }


//    /**
//     * <pre>
//     * 获取用户绑定手机号信息
//     * </pre>
//     */
//    @GetMapping("/phone")
//    public String phone(@PathVariable String appid, String sessionKey, String signature,
//                        String rawData, String encryptedData, String iv) {
//
//        // 用户信息校验
//        if (!wxMaService.getUserService().checkUserInfo(sessionKey, rawData, signature)) {
//            return "user check failed";
//        }
//
//        // 解密
//        WxMaPhoneNumberInfo phoneNoInfo = wxMaService.getUserService().getPhoneNoInfo(sessionKey, encryptedData, iv);
//
//        return JsonUtils.toJson(phoneNoInfo);
//    }

}
