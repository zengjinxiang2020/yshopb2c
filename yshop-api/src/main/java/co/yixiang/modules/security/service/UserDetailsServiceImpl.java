package co.yixiang.modules.security.service;

import co.yixiang.exception.BadRequestException;
import co.yixiang.modules.security.security.vo.JwtUser;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.service.YxUserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Optional;

/**
 * @author hupeng
 * @date 2020/01/12
 */
@Service("userDetailsService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class UserDetailsServiceImpl implements UserDetailsService {

    private final YxUserService userService;
    private final JwtPermissionService permissionService;


    public UserDetailsServiceImpl(YxUserService userService,JwtPermissionService permissionService) {
        this.userService = userService;
        this.permissionService = permissionService;
    }

    @Override
    public UserDetails loadUserByUsername(String username){
        YxUser user = userService.findByName(username);
        if (user == null) {
            throw new BadRequestException("账号不存在");
        } else {
            if (!user.getStatus()) {
                throw new BadRequestException("账号未激活");
            }
            return createJwtUser(user);
        }
    }

    private UserDetails createJwtUser(YxUser user) {
        return new JwtUser(
                Long.valueOf(user.getUid()),
                user.getUsername(),
                user.getNickname(),
                user.getPassword(),
                user.getAvatar(),
                user.getPhone(),
                permissionService.mapToGrantedAuthorities(user),
                user.getStatus(),
                user.getAddTime()
        );
    }
}
