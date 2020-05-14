/**
* Copyright (C) 2018-2019
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.system.service.dto;

import lombok.Data;
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-14
*/
@Data
public class UserDto implements Serializable {

    /** ID */
    private Long id;

    /** 头像 */
    private Long avatarId;

    private String avatar;

    /** 邮箱 */
    private String email;

    /** 状态：1启用、0禁用 */
    private Boolean enabled;

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
    private Timestamp createTime;

    /** 最后修改密码的日期 */
    private Timestamp lastPasswordResetTime;

    /** 昵称 */
    private String nickName;

    private DeptSmallDto dept;

    private JobSmallDto job;

    /** 性别 */
    private String sex;
}
