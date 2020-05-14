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
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_store_product_attr_value")
public class YxStoreProductAttrValue implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 商品ID */
    //@Column(name = "product_id",nullable = false)
   //@NotNull
    private Integer productId;


    /** 商品属性索引值 (attr_value|attr_value[|....]) */
    //@Column(name = "suk",nullable = false)
    //@NotBlank
    private String suk;


    /** 属性对应的库存 */
    //@Column(name = "stock",nullable = false)
   //@NotNull
    private Integer stock;


    /** 销量 */
    //@Column(name = "sales")
    private Integer sales;


    /** 属性金额 */
    //@Column(name = "price",nullable = false)
   //@NotNull
    private BigDecimal price;


    /** 图片 */
    //@Column(name = "image")
    private String image;


    /** 唯一值 */
     @TableField(value = "`unique`")
    //@NotBlank
    private String unique;


    /** 成本价 */
    //@Column(name = "cost",nullable = false)
   //@NotNull
    private BigDecimal cost;


    public void copy(YxStoreProductAttrValue source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
