/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/
@Data
public class YxUserBillDto implements Serializable {

    /** 用户账单id */
    private Integer id;

    /** 用户uid */
    private Integer uid;

    /** 关联id */
    private String linkId;

    /** 0 = 支出 1 = 获得 */
    private Integer pm;

    /** 账单标题 */
    private String title;

    /** 明细种类 */
    private String category;

    /** 明细类型 */
    private String type;

    /** 明细数字 */
    private BigDecimal number;

    /** 剩余 */
    private BigDecimal balance;

    /** 备注 */
    private String mark;

    /** 添加时间 */
    private Integer addTime;

    /** 0 = 带确定 1 = 有效 -1 = 无效 */
    private Integer status;

    private String nickname;
}
