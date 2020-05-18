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

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_system_store")
public class YxSystemStore implements Serializable {

    @TableId
    private Integer id;


    /** 门店名称 */
    @NotBlank(message = "请填写门店名称")
    private String name;


    /** 简介 */
    @NotBlank(message = "请填写门店简介")
    private String introduction;


    /** 手机号码 */
    @NotBlank(message = "请填手机号码")
    private String phone;


    /** 省市区 */
    @NotBlank(message = "请填地址")
    private String address;


    /** 详细地址 */
    private String detailedAddress;


    /** 门店logo */
    @NotBlank(message = "请上传门店logo")
    private String image;


    /** 纬度 */
    @NotBlank(message = "请输入纬度")
    private String latitude;


    /** 经度 */
    @NotBlank(message = "请输入经度")
    private String longitude;


    /** 核销有效日期 */
    @NotBlank(message = "请输入核销时效")
    private String validTime;


    /** 每日营业开关时间 */
    @NotBlank(message = "请输入营业时间")
    private String dayTime;


    /** 添加时间 */
    @TableField(fill= FieldFill.INSERT)
    private Integer addTime;


    /** 是否显示 */
    private Integer isShow;


    /** 是否删除 */
    private Integer isDel;

    private Date validTimeEnd;

    private Date validTimeStart;

    private Date dayTimeStart;

    private Date dayTimeEnd;


    public void copy(YxSystemStore source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
