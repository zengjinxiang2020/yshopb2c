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

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_express")
public class YxExpress implements Serializable {

    /** 快递公司id */
    @TableId
    private Integer id;


    /** 快递公司简称 */
    @NotBlank(message = "请输入快递公司编号")
    private String code;


    /** 快递公司全称 */
    @NotBlank(message = "请输入快递公司名称")

    private String name;


    /** 排序 */
    private Integer sort;


    /** 是否显示 */
    private Integer isShow;


    public void copy(YxExpress source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
