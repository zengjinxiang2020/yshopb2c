/**
 * Copyright (C) 2018-2019
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
@TableName("yx_system_store")
public class YxSystemStore implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 门店名称 */
    //@Column(name = "name",nullable = false)
    //@NotBlank
    private String name;


    /** 简介 */
    //@Column(name = "introduction",nullable = false)
    //@NotBlank
    private String introduction;


    /** 手机号码 */
    //@Column(name = "phone",nullable = false)
    //@NotBlank
    private String phone;


    /** 省市区 */
    //@Column(name = "address",nullable = false)
    //@NotBlank
    private String address;


    /** 详细地址 */
    //@Column(name = "detailed_address",nullable = false)
    //@NotBlank
    private String detailedAddress;


    /** 门店logo */
    //@Column(name = "image",nullable = false)
    //@NotBlank
    private String image;


    /** 纬度 */
    //@Column(name = "latitude",nullable = false)
    //@NotBlank
    private String latitude;


    /** 经度 */
    //@Column(name = "longitude",nullable = false)
    //@NotBlank
    private String longitude;


    /** 核销有效日期 */
    //@Column(name = "valid_time",nullable = false)
    //@NotBlank
    private String validTime;


    /** 每日营业开关时间 */
    //@Column(name = "day_time",nullable = false)
    //@NotBlank
    private String dayTime;


    /** 添加时间 */
    //@Column(name = "add_time",nullable = false)
   //@NotNull
    private Integer addTime;


    /** 是否显示 */
    //@Column(name = "is_show",nullable = false)
   //@NotNull
    private Integer isShow;


    /** 是否删除 */
    //@Column(name = "is_del",nullable = false)
   //@NotNull
    private Integer isDel;


    public void copy(YxSystemStore source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
