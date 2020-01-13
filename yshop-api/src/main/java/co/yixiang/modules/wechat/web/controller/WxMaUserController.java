package co.yixiang.modules.wechat.web.controller;

import cn.binarywang.wx.miniapp.api.WxMaService;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.service.YxWechatUserService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信小程序用户接口
 *
 * @author xuwenbo
 */
@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "微信小程序", tags = "微信小程序", description = "微信小程序")
public class WxMaUserController {
    private final WxMaService wxMaService;
    private final YxWechatUserService wechatUserService;
    private final YxUserService userService;



//    /**
//     * <pre>
//     * 获取用户绑定手机号信息
//     * </pre>
//     */
//    @GetMapping("/phone")
//    public String phone(String sessionKey, String signature,
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
