package co.yixiang.modules.wechat.rest.param;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * @ClassName WxPhoneParam
 * @Author hupeng <610796224@qq.com>
 * @Date 2020/02/07
 **/
@Getter
@Setter
public class WxPhoneParam {

    @NotBlank(message = "code参数缺失")
    @ApiModelProperty(value = "小程序登陆code")
    private String code;

    @ApiModelProperty(value = "小程序完整用户信息的加密数据")
    private String encryptedData;

    @ApiModelProperty(value = "小程序加密算法的初始向量")
    private String iv;
}
