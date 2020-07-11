///**
// * Copyright (C) 2018-2020
// * All rights reserved, Designed By www.yixiang.co
// * 注意：
// * 本软件为www.yixiang.co开发研制，未经购买不得使用
// * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
// * 一经发现盗用、分享等行为，将追究法律责任，后果自负
// */
//package co.yixiang.modules.wechat.rest.rest;
//
//import cn.binarywang.wx.miniapp.api.WxMaService;
//import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
//import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
//import cn.binarywang.wx.miniapp.config.impl.WxMaDefaultConfigImpl;
//import cn.hutool.core.util.StrUtil;
//import co.yixiang.commonold.api.ApiResult;
//import co.yixiang.exception.ErrorRequestException;
//import co.yixiang.modules.user.entity.YxUser;
//import co.yixiang.modules.user.service.YxUserService;
//import co.yixiang.modules.user.service.YxWechatUserService;
//import co.yixiang.modules.user.rest.vo.YxUserQueryVo;
//import co.yixiang.modules.wechat.rest.param.BindPhoneParam;
//import co.yixiang.modules.wechat.rest.param.WxPhoneParam;
//import co.yixiang.mp.config.ShopKeyUtils;
//import co.yixiang.utils.RedisUtil;
//import co.yixiang.utils.RedisUtils;
//import co.yixiang.utils.SecurityUtils;
//import io.swagger.annotations.Api;
//import io.swagger.annotations.ApiOperation;
//import lombok.RequiredArgsConstructor;
//import me.chanjar.weixin.commonold.error.WxErrorException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.validation.annotation.Validated;
//import org.springframework.rest.bind.annotation.PostMapping;
//import org.springframework.rest.bind.annotation.RequestBody;
//import org.springframework.rest.bind.annotation.RestController;
//
//import java.util.LinkedHashMap;
//import java.util.Map;
//
///**
// * @author hupeng
// * @date 2020/02/07
// */
//@RestController
//@RequiredArgsConstructor(onConstructor = @__(@Autowired))
//@Api(value = "微信其他", tags = "微信:微信其他", description = "微信其他")
//public class WxMaUserController {
//
//    private final WxMaService wxMaService;
//    private final YxWechatUserService wechatUserService;
//    private final YxUserService userService;
//    private final RedisUtils redisUtils;
//
//
//
//    @PostMapping("/binding")
//    @ApiOperation(value = "公众号绑定手机号", notes = "公众号绑定手机号")
//    public ApiResult<String> verify(@Validated @RequestBody BindPhoneParam param) {
//
//        Object codeObj = redisUtils.get("code_" + param.getPhone());
//        if(codeObj == null){
//            return ApiResult.fail("请先获取验证码");
//        }
//        String code = codeObj.toString();
//
//
//        if (!StrUtil.equals(code, param.getCaptcha())) {
//            return ApiResult.fail("验证码错误");
//        }
//
//        int uid = SecurityUtils.getUserId().intValue();
//        YxUserQueryVo userQueryVo = userService.getYxUserById(uid);
//        if(StrUtil.isNotBlank(userQueryVo.getPhone())){
//            return ApiResult.fail("您的账号已经绑定过手机号码");
//        }
//
//        YxUser yxUser = new YxUser();
//        yxUser.setPhone(param.getPhone());
//        yxUser.setUid(uid);
//        userService.updateById(yxUser);
//
//        return ApiResult.ok("绑定成功");
//
//    }
//
//
//
//    @PostMapping("/wxapp/binding")
//    @ApiOperation(value = "小程序绑定手机号", notes = "小程序绑定手机号")
//    public ApiResult<Map<String,Object>> phone(@Validated @RequestBody WxPhoneParam param) {
//
//        int uid = SecurityUtils.getUserId().intValue();
//        YxUserQueryVo userQueryVo = userService.getYxUserById(uid);
//        if(StrUtil.isNotBlank(userQueryVo.getPhone())){
//            return ApiResult.fail("您的账号已经绑定过手机号码");
//        }
//
//        //读取redis配置
//        String appId = RedisUtil.get(ShopKeyUtils.getWxAppAppId());
//        String secret = RedisUtil.get(ShopKeyUtils.getWxAppSecret());
//        if (StrUtil.isBlank(appId) || StrUtil.isBlank(secret)) {
//            throw new ErrorRequestException("请先配置小程序");
//        }
//        WxMaDefaultConfigImpl wxMaConfig = new WxMaDefaultConfigImpl();
//        wxMaConfig.setAppid(appId);
//        wxMaConfig.setSecret(secret);
//        wxMaService.setWxMaConfig(wxMaConfig);
//        String phone = "";
//        try {
//            WxMaJscode2SessionResult session = wxMaService.getUserService()
//                    .getSessionInfo(param.getCode());
//
//            // 解密
//            WxMaPhoneNumberInfo phoneNoInfo = wxMaService.getUserService()
//                    .getPhoneNoInfo(session.getSessionKey(), param.getEncryptedData(), param.getIv());
//
//            phone = phoneNoInfo.getPhoneNumber();
//            YxUser yxUser = new YxUser();
//            yxUser.setPhone(phone);
//            yxUser.setUid(uid);
//            userService.updateById(yxUser);
//        } catch (WxErrorException e) {
//            return ApiResult.fail(e.getMessage());
//            //e.printStackTrace();
//        }
//        Map<String,Object> map = new LinkedHashMap<>();
//        map.put("phone",phone);
//
//        return ApiResult.ok(map,"绑定成功");
//    }
//
//
//
//}