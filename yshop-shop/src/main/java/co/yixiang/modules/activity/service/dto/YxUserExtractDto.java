/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.activity.service.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
public class YxUserExtractDto implements Serializable {


    private Integer id;

    private Integer uid;

    // 名称
    private String realName;

    // bank = 银行卡 alipay = 支付宝wx=微信
    private String extractType;

    // 银行卡
    private String bankCode;

    // 开户地址
    private String bankAddress;

    // 支付宝账号
    private String alipayCode;

    // 提现金额
    private BigDecimal extractPrice;

    private String mark;

    private BigDecimal balance;

    // 无效原因
    private String failMsg;

    private Integer failTime;

    // 添加时间
    private Integer addTime;

    // -1 未通过 0 审核中 1 已提现
    private Integer status;

    // 微信号
    private String wechat;
}
