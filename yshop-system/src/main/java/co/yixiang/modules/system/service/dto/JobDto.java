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
public class JobDto implements Serializable {

    /** 岗位ID */
    private Long id;

    /** 岗位名称 */
    private String name;

    /** 岗位状态 */
    private Boolean enabled;

    /** 岗位排序 */
    private Long sort;

    /** 部门ID */
    private Long deptId;

    /** 创建日期 */
    private Timestamp createTime;
}
