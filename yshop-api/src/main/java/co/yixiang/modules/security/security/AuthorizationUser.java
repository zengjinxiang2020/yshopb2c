package co.yixiang.modules.security.security;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

/**
 * @author Zheng Jie
 * @date 2018-11-30
 */
@Getter
@Setter
public class AuthorizationUser {

    @NotBlank
    private String account;

    @NotBlank
    private String password;

    private String code;

    private String uuid = "";

    private String spread;

    @Override
    public String toString() {
        return "{username=" + account  + ", password= ******}";
    }
}
