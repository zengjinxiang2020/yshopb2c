/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.system.service.impl;

import co.yixiang.modules.system.domain.User;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.modules.system.domain.UserAvatar;
import co.yixiang.modules.system.service.*;
import co.yixiang.modules.system.service.mapper.RoleMapper;
import co.yixiang.utils.SecurityUtils;
import co.yixiang.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import co.yixiang.dozer.service.IGenerator;
import com.github.pagehelper.PageInfo;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.utils.FileUtil;
import co.yixiang.modules.system.service.dto.UserDto;
import co.yixiang.modules.system.service.dto.UserQueryCriteria;
import co.yixiang.modules.system.service.mapper.SysUserMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
* @author hupeng
* @date 2020-05-14
*/
@Service
//@AllArgsConstructor
//@CacheConfig(cacheNames = "user")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class SysUserServiceImpl extends BaseServiceImpl<SysUserMapper, User> implements UserService {

    @Value("${file.avatar}")
    private String avatar;

    private final IGenerator generator;
    private final SysUserMapper userMapper;
    private final UserAvatarService userAvatarService;
    private final JobService jobService;
    private final DeptService deptService;
    private final RoleMapper roleMapper;

    public SysUserServiceImpl(IGenerator generator, SysUserMapper userMapper, UserAvatarService userAvatarService, JobService jobService, DeptService deptService, RoleService roleService, RoleMapper roleMapper) {
        this.generator = generator;
        this.userMapper = userMapper;
        this.userAvatarService = userAvatarService;
        this.jobService = jobService;
        this.deptService = deptService;
        this.roleMapper = roleMapper;
    }

    @Override
    //@Cacheable
    public Map<String, Object> queryAll(UserQueryCriteria criteria, Pageable pageable) {
        getPage(pageable);
        PageInfo<User> page = new PageInfo<>(queryAll(criteria));
        Map<String, Object> map = new LinkedHashMap<>(2);
        map.put("content", generator.convert(page.getList(), UserDto.class));
        map.put("totalElements", page.getTotal());
        return map;
    }


    @Override
    //@Cacheable
    public List<User> queryAll(UserQueryCriteria criteria){
       List<User> userList =  baseMapper.selectList(QueryHelpPlus.getPredicate(User.class, criteria));
        for (User user : userList) {
            user.setJob(jobService.getById(user.getJobId()));
            user.setDept(deptService.getById(user.getDeptId()));
            user.setRoles(roleMapper.findByUsers_Id(user.getId()));
        }
       return userList;
    }


    @Override
    public void download(List<UserDto> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (UserDto user : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("邮箱", user.getEmail());
            map.put("状态：1启用、0禁用", user.getEnabled());
            map.put("密码", user.getPassword());
            map.put("用户名", user.getUsername());
            map.put("部门名称", user.getDeptId());
            map.put("手机号码", user.getPhone());
            map.put("创建日期", user.getCreateTime());
            map.put("最后修改密码的日期", user.getLastPasswordResetTime());
            map.put("昵称", user.getNickName());
            map.put("性别", user.getSex());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }

    /**
     * 根据用户名查询
     *
     * @param userName /
     * @return /
     */
    @Override
    public UserDto findByName(String userName) {
      User user =   this.getOne(new QueryWrapper<User>().lambda()
                .eq(User::getUsername,userName));
        //用户所属岗位
        user.setJob(jobService.getById(user.getJobId()));
        //用户所属部门
        user.setDept(deptService.getById(user.getDeptId()));
        return generator.convert(user,UserDto.class);
    }

    /**
     * 修改密码
     *
     * @param username        用户名
     * @param encryptPassword 密码
     */
    @Override
    public void updatePass(String username, String encryptPassword) {
        userMapper.updatePass(encryptPassword,new Date(),username);
    }

    /**
     * 修改头像
     *
     * @param multipartFile 文件
     */
    @Override
    public void updateAvatar(MultipartFile multipartFile) {
        User user = this.getOne(new QueryWrapper<User>().eq("username",SecurityUtils.getUsername()));
        UserAvatar userAvatar = user.getUserAvatar();
        String oldPath = "";
        if(userAvatar != null){
            oldPath = userAvatar.getPath();
        }
        File file = FileUtil.upload(multipartFile, avatar);
        assert file != null;
        UserAvatar saveUserAvatar = new UserAvatar(userAvatar,file.getName(), file.getPath(), FileUtil.getSize(multipartFile.getSize()));
        userAvatarService.save(saveUserAvatar);
        user.setUserAvatar(saveUserAvatar);
        this.save(user);
        if(StringUtils.isNotBlank(oldPath)){
            FileUtil.del(oldPath);
        }
    }

    /**
     * 修改邮箱
     *
     * @param username 用户名
     * @param email    邮箱
     */
    @Override
    public void updateEmail(String username, String email) {
        userMapper.updateEmail(email, username);
    }

}
