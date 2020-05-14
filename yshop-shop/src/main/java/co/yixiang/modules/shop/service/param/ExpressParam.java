/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service.param;

import lombok.Data;

import java.io.Serializable;

/**
 * @ClassName ExpressParam
 * @Author hupeng <610796224@qq.com>
 * @Date 2019/12/9
 **/
@Data
public class ExpressParam implements Serializable {
    ////@NotBlank()
    private String orderCode;
    private String shipperCode;
    private String logisticCode;
}
