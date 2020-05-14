/**
* Copyright (C) 2018-2019
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.system.service.impl;

import co.yixiang.modules.system.domain.Dept;
import co.yixiang.modules.system.domain.Menu;
import co.yixiang.modules.system.domain.Role;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.modules.system.service.dto.RoleSmallDto;
import co.yixiang.modules.system.service.dto.UserDto;
import co.yixiang.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.AllArgsConstructor;
import co.yixiang.dozer.service.IGenerator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.utils.ValidationUtil;
import co.yixiang.utils.FileUtil;
import co.yixiang.modules.system.service.RoleService;
import co.yixiang.modules.system.service.dto.RoleDto;
import co.yixiang.modules.system.service.dto.RoleQueryCriteria;
import co.yixiang.modules.system.service.mapper.RoleMapper;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import co.yixiang.utils.PageUtil;
import co.yixiang.utils.QueryHelp;

import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.stream.Collectors;

/**
* @author hupeng
* @date 2020-05-14
*/
@Service
@AllArgsConstructor
//@CacheConfig(cacheNames = "role")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {

    private final IGenerator generator;
    private final RoleMapper roleMapper;

    @Override
    //@Cacheable
    public Map<String, Object> queryAll(RoleQueryCriteria criteria, Pageable pageable) {
        getPage(pageable);
        PageInfo<Role> page = new PageInfo<>(queryAll(criteria));
        Map<String, Object> map = new LinkedHashMap<>(2);
        map.put("content", generator.convert(page.getList(), RoleDto.class));
        map.put("totalElements", page.getTotal());
        return map;
    }


    @Override
    //@Cacheable
    public List<Role> queryAll(RoleQueryCriteria criteria){
        return baseMapper.selectList(QueryHelpPlus.getPredicate(Role.class, criteria));
    }


    @Override
    public void download(List<RoleDto> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (RoleDto role : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("名称", role.getName());
            map.put("备注", role.getRemark());
            map.put("数据权限", role.getDataScope());
            map.put("角色级别", role.getLevel());
            map.put("创建日期", role.getCreateTime());
            map.put("功能权限", role.getPermission());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }

    /**
     * 根据用户ID查询
     *
     * @param id 用户ID
     * @return /
     */
    @Override
    public List<RoleSmallDto> findByUsersId(Long id) {

        return null;
    }

    /**
     * 根据角色查询角色级别
     *
     * @param roles /
     * @return /
     */
    @Override
    public Integer findByRoles(Set<Role> roles) {
        Set<RoleDto> roleDtos = new HashSet<>();
        for (Role role : roles) {
            roleDtos.add(findById(role.getId()));
        }
        return Collections.min(roleDtos.stream().map(RoleDto::getLevel).collect(Collectors.toList()));
    }

    /**
     * 根据ID查询
     *
     * @param id /
     * @return /
     */
    @Override
    public RoleDto findById(long id) {
        Role role = this.getById(id);
        return generator.convert(role, RoleDto.class);
    }

    /**
     * 修改绑定的菜单
     *
     * @param resources /
     * @param roleDto   /
     */
    @Override
    public void updateMenu(Role resources, RoleDto roleDto) {
        Role role =generator.convert(roleDto,Role.class);
        role.setMenus(resources.getMenus());
        this.save(role);
    }

    /**
     * 获取用户权限信息
     *
     * @param user 用户信息
     * @return 权限信息
     */
    @Override
    //@Cacheable(key = "'loadPermissionByUser:' + #p0.username")
    public Collection<GrantedAuthority> mapToGrantedAuthorities(UserDto user) {
        Set<Role> roles = roleMapper.findByUsers_Id(user.getId());
        Set<String> permissions = roles.stream().filter(role -> StringUtils.isNotBlank(role.getPermission())).map(Role::getPermission).collect(Collectors.toSet());
        permissions.addAll(
                roles.stream().flatMap(role -> role.getMenus().stream())
                        .filter(menu -> StringUtils.isNotBlank(menu.getPermission()))
                        .map(Menu::getPermission).collect(Collectors.toSet())
        );
        return permissions.stream().map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }
}
