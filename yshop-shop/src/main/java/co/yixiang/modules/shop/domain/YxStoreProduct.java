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
@TableName("yx_store_product")
public class YxStoreProduct implements Serializable {

    /** 商品id */
    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 商户Id(0为总后台管理员创建,不为0的时候是商户后台创建) */
    //@Column(name = "mer_id")
    private Integer merId;


    /** 商品图片 */
    //@Column(name = "image",nullable = false)
    //@NotBlank
    private String image;


    /** 轮播图 */
    //@Column(name = "slider_image",nullable = false)
    //@NotBlank
    private String sliderImage;


    /** 商品名称 */
    //@Column(name = "store_name",nullable = false)
    //@NotBlank
    private String storeName;


    /** 商品简介 */
    //@Column(name = "store_info",nullable = false)
    //@NotBlank
    private String storeInfo;


    /** 关键字 */
    //@Column(name = "keyword",nullable = false)
    //@NotBlank
    private String keyword;


    /** 产品条码（一维码） */
    //@Column(name = "bar_code")
    private String barCode;


    /** 分类id */
    //@Column(name = "cate_id",nullable = false)
    //@NotBlank
    private String cateId;


    /** 商品价格 */
    //@Column(name = "price",nullable = false)
   //@NotNull
    private BigDecimal price;


    /** 会员价格 */
    //@Column(name = "vip_price")
    private BigDecimal vipPrice;


    /** 市场价 */
    //@Column(name = "ot_price")
    private BigDecimal otPrice;


    /** 邮费 */
    //@Column(name = "postage")
    private BigDecimal postage;


    /** 单位名 */
    //@Column(name = "unit_name")
    private String unitName;


    /** 排序 */
    //@Column(name = "sort")
    private Integer sort;


    /** 销量 */
    //@Column(name = "sales")
    private Integer sales;


    /** 库存 */
    //@Column(name = "stock")
    private Integer stock;


    /** 状态（0：未上架，1：上架） */
    //@Column(name = "is_show")
    private Integer isShow;


    /** 是否热卖 */
    //@Column(name = "is_hot")
    private Integer isHot;


    /** 是否优惠 */
    //@Column(name = "is_benefit")
    private Integer isBenefit;


    /** 是否精品 */
    //@Column(name = "is_best")
    private Integer isBest;


    /** 是否新品 */
    //@Column(name = "is_new")
    private Integer isNew;


    /** 产品描述 */
    //@Column(name = "description")
    private String description;


    /** 添加时间 */
    //@Column(name = "add_time")
    private Integer addTime;


    /** 是否包邮 */
    //@Column(name = "is_postage")
    private Integer isPostage;


    /** 是否删除 */
    //@Column(name = "is_del")
    private Integer isDel;


    /** 商户是否代理 0不可代理1可代理 */
    //@Column(name = "mer_use")
    private Integer merUse;


    /** 获得积分 */
    //@Column(name = "give_integral")
    private BigDecimal giveIntegral;


    /** 成本价 */
    //@Column(name = "cost")
    private BigDecimal cost;


    /** 秒杀状态 0 未开启 1已开启 */
    //@Column(name = "is_seckill")
    private Integer isSeckill;


    /** 砍价状态 0未开启 1开启 */
    //@Column(name = "is_bargain")
    private Integer isBargain;


    /** 是否优品推荐 */
    //@Column(name = "is_good")
    private Integer isGood;


    /** 虚拟销量 */
    //@Column(name = "ficti")
    private Integer ficti;


    /** 浏览量 */
    //@Column(name = "browse")
    private Integer browse;


    /** 产品二维码地址(用户小程序海报) */
    //@Column(name = "code_path",nullable = false)
    //@NotBlank
    private String codePath;


    /** 淘宝京东1688类型 */
    //@Column(name = "soure_link")
    private String soureLink;


    public void copy(YxStoreProduct source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
