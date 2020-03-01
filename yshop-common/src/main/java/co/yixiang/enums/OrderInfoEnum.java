package co.yixiang.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * 订单相关枚举
 */
@Getter
@AllArgsConstructor
public enum OrderInfoEnum {

	STATUS_0(0,"默认"),
	STATUS_1(1,"待收货"),
	STATUS_2(2,"已收货"),
	STATUS_3(3,"已完成"),

	PAY_STATUS_0(0,"未支付"),
	PAY_STATUS_1(1,"已支付"),

	REFUND_STATUS_0(0,"未支付"),
	REFUND_STATUS_1(1,"退款中"),
	REFUND_STATUS_2(2,"已退款"),

	BARGAIN_STATUS_1(1,"参与中"),
	BARGAIN_STATUS_2(2,"参与失败"),
	BARGAIN_STATUS_3(3,"参与成功"),

	CANCEL_STATUS_0(0,"正常"),
	CANCEL_STATUS_1(1,"已取消");



	private Integer value;
	private String desc;


}
