/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.config;

import co.yixiang.modules.system.service.UserService;
import co.yixiang.modules.system.service.dto.RoleSmallDTO;
import co.yixiang.modules.system.service.dto.UserDTO;
import co.yixiang.utils.SecurityUtils;
import co.yixiang.modules.system.domain.Dept;
import co.yixiang.modules.system.service.DeptService;
import co.yixiang.modules.system.service.RoleService;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 数据权限配置
 * @author hupeng
 * @date 2019-4-1
 */
@Component
public class DataScope {

    private final String[] scopeType = {"全部","本级","自定义"};

    private final UserService userService;

    private final RoleService roleService;

    private final DeptService deptService;

    public DataScope(UserService userService, RoleService roleService, DeptService deptService) {
        this.userService = userService;
        this.roleService = roleService;
        this.deptService = deptService;
    }

    public Set<Long> getDeptIds() {

        UserDTO user = userService.findByName(SecurityUtils.getUsername());

        // 用于存储部门id
        Set<Long> deptIds = new HashSet<>();

        // 查询用户角色
        List<RoleSmallDTO> roleSet = roleService.findByUsersId(user.getId());

        for (RoleSmallDTO role : roleSet) {

            if (scopeType[0].equals(role.getDataScope())) {
                return new HashSet<>() ;
            }

            // 存储本级的数据权限
            if (scopeType[1].equals(role.getDataScope())) {
                deptIds.add(user.getDept().getId());
            }

            // 存储自定义的数据权限
            if (scopeType[2].equals(role.getDataScope())) {
                Set<Dept> depts = deptService.findByRoleIds(role.getId());
                for (Dept dept : depts) {
                    deptIds.add(dept.getId());
                    List<Dept> deptChildren = deptService.findByPid(dept.getId());
                    if (deptChildren != null && deptChildren.size() != 0) {
                        deptIds.addAll(getDeptChildren(deptChildren));
                    }
                }
            }
        }
        return deptIds;
    }


    public List<Long> getDeptChildren(List<Dept> deptList) {
        List<Long> list = new ArrayList<>();
        deptList.forEach(dept -> {
                    if (dept!=null && dept.getEnabled()){
                        List<Dept> depts = deptService.findByPid(dept.getId());
                        if(deptList.size() != 0){
                            list.addAll(getDeptChildren(depts));
                        }
                        list.add(dept.getId());
                    }
                }
        );
        return list;
    }
}
