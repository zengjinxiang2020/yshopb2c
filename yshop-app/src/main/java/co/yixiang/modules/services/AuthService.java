/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.services;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaUserInfo;
import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import co.yixiang.api.YshopException;
import co.yixiang.common.util.IpUtil;
import co.yixiang.constant.ShopConstants;
import co.yixiang.enums.AppFromEnum;
import co.yixiang.modules.auth.param.LoginParam;
import co.yixiang.modules.auth.param.RegParam;
import co.yixiang.modules.user.domain.YxUser;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.service.dto.WechatUserDto;
import co.yixiang.mp.config.WxMpConfiguration;
import co.yixiang.utils.RedisUtils;
import co.yixiang.utils.ShopKeyUtils;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.vdurmont.emoji.EmojiParser;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.common.error.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @ClassName 登陆认证服务类
 * @Author hupeng <610796224@qq.com>
 * @Date 2020/6/14
 **/
@Slf4j
@Service
@AllArgsConstructor
public class AuthService {

    private final YxUserService userService;
    private final RedisUtils redisUtil;
    private final WxMaService wxMaService;

    /**
     * 小程序登陆
     * @param loginParam loginParam
     * @return long
     */
    @Transactional
    public long wxappLogin(LoginParam loginParam) {
        String code = loginParam.getCode();
        String encryptedData = loginParam.getEncryptedData();
        String iv = loginParam.getIv();
        String spread = loginParam.getSpread();
        try {
            //读取redis配置
            String appId = redisUtil.getY(ShopKeyUtils.getWxAppAppId());
            String secret = redisUtil.getY(ShopKeyUtils.getWxAppSecret());
            if (StrUtil.isBlank(appId) || StrUtil.isBlank(secret)) {
                throw new YshopException("请先配置小程序");
            }
            WxMaDefaultConfigImpl wxMaConfig = new WxMaDefaultConfigImpl();
            wxMaConfig.setAppid(appId);
            wxMaConfig.setSecret(secret);

            wxMaService.setWxMaConfig(wxMaConfig);
            WxMaJscode2SessionResult session = wxMaService.getUserService().getSessionInfo(code);

            String openid = session.getOpenid();
            //如果开启了UnionId
            if (StrUtil.isNotBlank(session.getUnionid())) {
                openid = session.getUnionid();
            }

            YxUser yxUser = userService.getOne(Wrappers.<YxUser>lambdaQuery()
                    .eq(YxUser::getUsername, openid),false);

            long uid = 0;
            if (ObjectUtil.isNull(yxUser)) {

                WxMaUserInfo wxMpUser = wxMaService.getUserService()
                        .getUserInfo(session.getSessionKey(), encryptedData, iv);
                //过滤掉表情
                String nickname = EmojiParser.removeAllEmojis(wxMpUser.getNickName());
                String ip = IpUtil.getRequestIp();
                YxUser user = YxUser.builder()
                        .username(openid)
                        .nickname(nickname)
                        .avatar(wxMpUser.getAvatarUrl())
                        .addIp(ip)
                        .lastIp(ip)
                        .userType(AppFromEnum.ROUNTINE.getValue())
                        .build();

                //构建微信用户
                WechatUserDto wechatUserDTO = WechatUserDto.builder()
                        .nickname(nickname)
                        .openid(wxMpUser.getOpenId())
                        .unionId(wxMpUser.getUnionId())
                        .sex(Integer.valueOf(wxMpUser.getGender()))
                        .language(wxMpUser.getLanguage())
                        .city(wxMpUser.getCity())
                        .province(wxMpUser.getProvince())
                        .country(wxMpUser.getCountry())
                        .headimgurl(wxMpUser.getAvatarUrl())
                        .build();

                user.setWxProfile(JSON.toJSONString(wechatUserDTO));

                userService.save(user);

                uid = user.getUid();

            } else {
                uid = yxUser.getUid();
                WechatUserDto wechatUser = JSON.parseObject(yxUser.getWxProfile(), WechatUserDto.class);
                if ((StrUtil.isBlank(wechatUser.getOpenid()) && StrUtil.isNotBlank(session.getOpenid()))
                        || (StrUtil.isBlank(wechatUser.getUnionId()) && StrUtil.isNotBlank(session.getUnionid()))) {
                    wechatUser.setRoutineOpenid(session.getOpenid());
                    wechatUser.setUnionId(session.getUnionid());

                    yxUser.setWxProfile(JSON.toJSONString(wechatUser));
                    userService.updateById(yxUser);
                }
            }
            userService.setSpread(spread, uid);

            return uid;
        } catch (WxErrorException e) {
            e.printStackTrace();
            log.error(e.getMessage());
            throw new YshopException(e.toString());
        }


    }

    /**
     * 公众号登陆
     * @param code code码
     * @param spread 上级用户
     * @return uid
     */
    @Transactional
    public long wechatLogin(String code,String spread){
        try {
            WxMpService wxService = WxMpConfiguration.getWxMpService();
            WxMpOAuth2AccessToken wxMpOAuth2AccessToken = wxService.oauth2getAccessToken(code);
            WxMpUser wxMpUser = wxService.oauth2getUserInfo(wxMpOAuth2AccessToken, null);
            String openid = wxMpUser.getOpenId();

            //如果开启了UnionId
            if (StrUtil.isNotBlank(wxMpUser.getUnionId())) {
                openid = wxMpUser.getUnionId();
            }

            YxUser yxUser = userService.getOne(Wrappers.<YxUser>lambdaQuery()
                    .eq(YxUser::getUsername,openid),false);

            long uid = 0;

            if(yxUser == null){
                //过滤掉表情
                String nickname = EmojiParser.removeAllEmojis(wxMpUser.getNickname());
                log.info("昵称：{}", nickname);
                //用户保存
                String ip = IpUtil.getRequestIp();
                YxUser user = YxUser.builder()
                        .username(openid)
                        .nickname(nickname)
                        .avatar(wxMpUser.getHeadImgUrl())
                        .addIp(ip)
                        .lastIp(ip)
                        .userType(AppFromEnum.WECHAT.getValue())
                        .build();

                //构建微信用户
                WechatUserDto wechatUserDTO = WechatUserDto.builder()
                        .nickname(nickname)
                        .openid(wxMpUser.getOpenId())
                        .unionId(wxMpUser.getUnionId())
                        .sex(wxMpUser.getSex())
                        .language(wxMpUser.getLanguage())
                        .city(wxMpUser.getCity())
                        .province(wxMpUser.getProvince())
                        .country(wxMpUser.getCountry())
                        .headimgurl(wxMpUser.getHeadImgUrl())
                        .subscribe(wxMpUser.getSubscribe())
                        .subscribeTime(wxMpUser.getSubscribeTime())
                        .build();

                user.setWxProfile(JSON.toJSONString(wechatUserDTO));
                userService.save(user);
                uid = user.getUid();

            }else{
                uid = yxUser.getUid();
                WechatUserDto wechatUser = JSON.parseObject(yxUser.getWxProfile(), WechatUserDto.class);
                if((StrUtil.isBlank(wechatUser.getOpenid()) && StrUtil.isNotBlank(wxMpUser.getOpenId()))
                        || (StrUtil.isBlank(wechatUser.getUnionId()) && StrUtil.isNotBlank(wxMpUser.getUnionId()))){
                    wechatUser.setOpenid(wxMpUser.getOpenId());
                    wechatUser.setUnionId(wxMpUser.getUnionId());

                    yxUser.setWxProfile(JSON.toJSONString(wechatUser));
                    userService.updateById(yxUser);
                }

            }

            userService.setSpread(spread,uid);

            return uid;

        } catch (WxErrorException e) {
            e.printStackTrace();
            log.error(e.getMessage());
            throw new YshopException(e.toString());
        }
    }


    /**
     * 注册
     * @param param RegDTO
     */
    @Transactional
    public void register(RegParam param){
        String account = param.getAccount();
        String ip = IpUtil.getRequestIp();
        YxUser user = YxUser.builder()
                .username(account)
                .nickname(account)
                .password(SecureUtil.md5(param.getPassword()))
                .phone(account)
                .avatar(ShopConstants.YSHOP_DEFAULT_AVATAR)
                .addIp(ip)
                .lastIp(ip)
                .userType(AppFromEnum.H5.getValue())
                .build();

        userService.save(user);

        userService.setSpread(param.getSpread(),user.getUid());

    }

}
