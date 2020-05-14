/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author hupeng
 * 通用枚举
 */
@Getter
@AllArgsConstructor
public enum CommonEnum {

	DEL_STATUS_0(0,"未删除"),
	DEL_STATUS_1(1,"已删除"),

	SHOW_STATUS_0(0,"未显示"),
	SHOW_STATUS_1(1,"显示");


	private Integer value;
	private String desc;


}
