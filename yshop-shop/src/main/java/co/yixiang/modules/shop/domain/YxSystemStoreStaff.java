/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_system_store_staff")
public class YxSystemStoreStaff implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 微信用户id */
    //@Column(name = "uid",nullable = false)
   //@NotNull
    private Integer uid;


    /** 店员头像 */
    //@Column(name = "avatar",nullable = false)
    //@NotBlank
    private String avatar;


    /** 门店id */
    //@Column(name = "store_id",nullable = false)
   //@NotNull
    private Integer storeId;


    /** 店员名称 */
    //@Column(name = "staff_name",nullable = false)
    //@NotBlank
    private String staffName;


    /** 手机号码 */
    //@Column(name = "phone",nullable = false)
    //@NotBlank
    private String phone;


    /** 核销开关 */
    //@Column(name = "verify_status",nullable = false)
   //@NotNull
    private Integer verifyStatus;


    /** 状态 */
    //@Column(name = "status")
    private Integer status;


    /** 添加时间 */
    //@Column(name = "add_time")
    private Integer addTime;


    /** 微信昵称 */
    //@Column(name = "nickname",nullable = false)
    //@NotBlank
    private String nickname;


    /** 所属门店 */
    //@Column(name = "store_name")
    private String storeName;


    public void copy(YxSystemStoreStaff source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
