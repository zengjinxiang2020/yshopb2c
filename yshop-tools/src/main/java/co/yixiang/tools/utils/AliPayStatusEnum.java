/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.tools.utils;

/**
 * 支付状态
 * @author zhengjie
 * @date 2018/08/01 16:45:43
 */
public enum  AliPayStatusEnum {

    /** 交易成功 */
    FINISHED("交易成功", "TRADE_FINISHED"),

    /** 支付成功 */
    SUCCESS("支付成功", "TRADE_SUCCESS"),

    /** 交易创建 */
    BUYER_PAY("交易创建", "WAIT_BUYER_PAY"),

    /** 交易关闭 */
    CLOSED("交易关闭", "TRADE_CLOSED");

    private String value;

    AliPayStatusEnum(String name, String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
