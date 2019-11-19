package co.yixiang.modules.security.rest;


import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.modules.monitor.service.RedisService;
import co.yixiang.modules.security.rest.param.RegParam;
import co.yixiang.modules.security.rest.param.VerityParam;
import co.yixiang.modules.security.security.JwtUser;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.utils.EncryptUtils;
import co.yixiang.utils.OrderUtil;
import co.yixiang.utils.SecurityUtils;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import co.yixiang.aop.log.Log;
import co.yixiang.modules.security.security.AuthenticationInfo;
import co.yixiang.modules.security.security.AuthorizationUser;
import co.yixiang.modules.security.utils.JwtTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;


/**
 * @author hupeng
 * @date 2019-10-01
 * 授权、根据token获取用户详细信息
 */
@Slf4j
@RestController
public class AuthenticationController extends BaseController {

    @Value("${jwt.header}")
    private String tokenHeader;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;


    @Autowired
    @Qualifier("jwtUserDetailsService")
    private UserDetailsService userDetailsService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private YxUserService userService;

    /**
     * 登录授权
     * @param authorizationUser
     * @return
     */
    @Log("用户登录")
    @PostMapping(value = "${jwt.auth.path}")
    public ApiResult<Map<String,String>> login(@Validated @RequestBody AuthorizationUser authorizationUser){

        final JwtUser jwtUser = (JwtUser) userDetailsService.loadUserByUsername(authorizationUser.getAccount());

        if(!jwtUser.getPassword().equals(EncryptUtils.encryptPassword(authorizationUser.getPassword()))){
            throw new AccountExpiredException("密码错误");
        }

        if(!jwtUser.isEnabled()){
            throw new AccountExpiredException("账号已停用，请联系管理员");
        }

        //设置推广关系
        if(StrUtil.isNotEmpty(authorizationUser.getSpread()) &&
                !authorizationUser.getSpread().equals("NaN")){
            userService.setSpread(Integer.valueOf(authorizationUser.getSpread()),
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
    }

    @PostMapping("/register/verify")
    @ApiOperation(value = "验证码发送",notes = "验证码发送")
    public ApiResult<String> verify(@Validated @RequestBody VerityParam param){
        Boolean isTest = true;
        YxUser yxUser = userService.findByName(param.getPhone());
        if(param.getType().equals("register") && ObjectUtil.isNotNull(yxUser)){
            return ApiResult.fail("手机号已注册");
        }
        if(param.getType().equals("login") && ObjectUtil.isNull(yxUser)){
            return ApiResult.fail("账号不存在");
        }
        if(StrUtil.isNotEmpty(redisService.getCodeVal("code_"+param.getPhone()))){
            return ApiResult.fail("10分钟内有效:"+redisService.getCodeVal("code_"+param.getPhone()));
        }
        String code = RandomUtil.randomNumbers(6);
        redisService.saveCode("code_"+param.getPhone(),code,600L);
        if(isTest){
            return ApiResult.fail("测试阶段验证码:"+code);
        }
        return ApiResult.ok("发送成功");
    }

    @PostMapping("/register")
    @ApiOperation(value = "H5注册新用户",notes = "H5注册新用户")
    public ApiResult<String> register(@Validated @RequestBody RegParam param){
        String code = redisService.getCodeVal("code_"+param.getAccount());
        if(StrUtil.isEmpty(code)){
            return ApiResult.fail("请先获取验证码");
        }

        if(!StrUtil.equals(code,param.getCaptcha())){
            return ApiResult.fail("验证码错误");
        }

        YxUser yxUser = userService.findByName(param.getAccount());
        if(ObjectUtil.isNotNull(yxUser)){
            return ApiResult.fail("用户已存在");
        }

        YxUser user = new YxUser();
        user.setAccount(param.getAccount());
        user.setUsername(param.getAccount());
        user.setPassword(EncryptUtils.encryptPassword(param.getPassword()));
        user.setPwd(EncryptUtils.encryptPassword(param.getPassword()));
        user.setPhone(param.getAccount());
        user.setUserType("h5");
        user.setAddTime(OrderUtil.getSecondTimestampTwo());
        user.setLastTime(OrderUtil.getSecondTimestampTwo());
        user.setNickname(param.getAccount());
        user.setAvatar("https://image.dayouqiantu.cn/5dc2c7f3a104c.png");
        user.setNowMoney(BigDecimal.ZERO);
        user.setBrokeragePrice(BigDecimal.ZERO);
        user.setIntegral(BigDecimal.ZERO);

        userService.save(user);

        return ApiResult.ok("注册成功");
    }


    /**
     * 退出登录
     * @return
     */
    @PostMapping(value = "/auth/logout")
    public ApiResult logout(){
        return ApiResult.ok("退出成功");
    }


}
