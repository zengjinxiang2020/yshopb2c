/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.system.domain;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;

import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.*;
import java.sql.Timestamp;
import java.io.Serializable;
import java.util.Set;

/**
* @author hupeng
* @date 2020-05-14
*/
@Data
@TableName("user")
public class User implements Serializable {

    /** 系统用户ID */
    @TableId
    private Long id;


    /** 头像 */
    private Long avatarId;


    /** 邮箱 */
    private String email;


    /** 状态：1启用、0禁用 */
    private Boolean enabled;

    /** 用户头像 */
    @TableField(exist = false)
    private UserAvatar userAvatar;

    @TableField(exist = false)
    private Set<Role> roles;
    @TableField(exist = false)
    private Job job;
    @TableField(exist = false)
    private Dept dept;

    /** 密码 */
    private String password;


    /** 用户名 */
    private String username;


    /** 部门名称 */
    private Long deptId;


    /** 手机号码 */
    private String phone;


    /** 岗位名称 */
    private Long jobId;


    /** 创建日期 */
    @TableField(fill= FieldFill.INSERT)
    private Timestamp createTime;


    /** 最后修改密码的日期 */
    private Timestamp lastPasswordResetTime;


    /** 昵称 */
    private String nickName;


    /** 性别 */
    private String sex;


    public void copy(User source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
