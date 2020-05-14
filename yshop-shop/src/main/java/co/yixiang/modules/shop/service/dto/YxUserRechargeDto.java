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
public class YxUserRechargeDto implements Serializable {

    private Integer id;

    /** 充值用户UID */
    private Integer uid;

    /** 订单号 */
    private String orderId;

    /** 充值金额 */
    private BigDecimal price;

    /** 充值类型 */
    private String rechargeType;

    /** 是否充值 */
    private Integer paid;

    /** 充值支付时间 */
    private Integer payTime;

    /** 充值时间 */
    private Integer addTime;

    /** 退款金额 */
    private BigDecimal refundPrice;

    /** 昵称 */
    private String nickname;
}
