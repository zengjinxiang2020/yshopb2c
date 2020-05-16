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

/**
* @author hupeng
* @date 2020-05-12
*/
@Data
public class YxSystemStoreStaffDto implements Serializable {

    private Integer id;

    /** 微信用户id */
    private Integer uid;

    /** 店员头像 */
    private String avatar;

    /** 门店id */
    private Integer storeId;

    /** 店员名称 */
    private String staffName;

    /** 手机号码 */
    private String phone;

    /** 核销开关 */
    private Integer verifyStatus;

    /** 状态 */
    private Integer status;

    /** 添加时间 */
    private Integer addTime;

    /** 微信昵称 */
    private String nickname;

    /** 所属门店 */
    private String storeName;
}
