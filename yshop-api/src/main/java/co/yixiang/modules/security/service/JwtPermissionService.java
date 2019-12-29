package co.yixiang.modules.security.service;


import co.yixiang.modules.user.entity.YxUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

@Service
//@CacheConfig(cacheNames = "role")
public class JwtPermissionService {


    /**
     * key的名称如有修改，请同步修改 UserServiceImpl 中的 update 方法
     * @param user
     * @return
     */
    //@Cacheable(key = "'loadPermissionByUser:' + #p0.username")
    public Collection<GrantedAuthority> mapToGrantedAuthorities(YxUser user) {

        System.out.println("--------------------loadPermissionByUser:" + user.getUsername() + "---------------------");

        //Set<Role> roles = roleRepository.findByUsers_Id(user.getId());

        return new ArrayList<>();
    }
}
