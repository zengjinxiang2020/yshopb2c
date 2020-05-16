/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service.dto;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;


/**
* @author hupeng
* @date 2019-10-06
*/
@Data
public class YxUserSmallDTO implements Serializable {

    // 用户id
    private Integer uid;

    // 用户昵称
    private String nickname;

    // 用户头像
    private String avatar;

    // 手机号码
    private String phone;


}
