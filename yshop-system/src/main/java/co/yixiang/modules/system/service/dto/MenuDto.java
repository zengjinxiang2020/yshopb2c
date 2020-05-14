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
import java.util.List;

/**
* @author hupeng
* @date 2020-05-14
*/
@Data
public class MenuDto implements Serializable {

    /** ID */
    private Long id;

    /** 是否外链 */
    private Boolean iFrame;

    /** 菜单名称 */
    private String name;

    /** 组件 */
    private String component;

    /** 上级菜单ID */
    private Long pid;

    /** 排序 */
    private Long sort;

    /** 图标 */
    private String icon;

    /** 链接地址 */
    private String path;

    /** 缓存 */
    private Boolean cache;

    /** 是否隐藏 */
    private Boolean hidden;

    /** 组件名称 */
    private String componentName;

    /** 创建日期 */
    private Timestamp createTime;

    /** 权限 */
    private String permission;

    private List<MenuDto> children;

    /** 类型 */
    private Integer type;
}
