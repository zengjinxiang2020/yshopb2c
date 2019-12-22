package co.yixiang.modules.activity.domain;

import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.io.Serializable;
import java.util.Date;

/**
* @author xuwenbo
* @date 2019-12-22
*/
@Entity
@Data
@Table(name="yx_store_bargain")
public class YxStoreBargain implements Serializable {

    // 砍价产品ID
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    // 关联产品ID
    @Column(name = "product_id",nullable = false)
    private Integer productId;

    // 砍价活动名称
    @Column(name = "title",nullable = false)
    private String title;

    // 砍价活动图片
    @Column(name = "image",nullable = false)
    private String image;

    // 单位名称
    @Column(name = "unit_name")
    private String unitName;

    // 库存
    @Column(name = "stock")
    private Integer stock;

    // 销量
    @Column(name = "sales")
    private Integer sales;

    // 砍价产品轮播图
    @Column(name = "images",nullable = false)
    private String images;

    // 砍价开启时间
    @Column(name = "start_time",nullable = false)
    private Integer startTime;

    // 砍价结束时间
    @Column(name = "stop_time",nullable = false)
    private Integer stopTime;

    @NotNull(message = "开始时间不能为空")
    private Date startTimeDate;

    @NotNull(message = "结束时间不能为空")
    private Date endTimeDate;

    // 砍价产品名称
    @Column(name = "store_name")
    private String storeName;

    // 砍价金额
    @Column(name = "price")
    private BigDecimal price;

    // 砍价商品最低价
    @Column(name = "min_price")
    private BigDecimal minPrice;

    // 每次购买的砍价产品数量
    @Column(name = "num")
    private Integer num;

    // 用户每次砍价的最大金额
    @Column(name = "bargain_max_price")
    private BigDecimal bargainMaxPrice;

    // 用户每次砍价的最小金额
    @Column(name = "bargain_min_price")
    private BigDecimal bargainMinPrice;

    // 用户每次砍价的次数
    @Column(name = "bargain_num",nullable = false)
    private Integer bargainNum;

    // 砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)
    @Column(name = "status",nullable = false)
    private Integer status;

    // 砍价详情
    @Column(name = "description")
    private String description;

    // 反多少积分
    @Column(name = "give_integral",nullable = false)
    private BigDecimal giveIntegral;

    // 砍价活动简介
    @Column(name = "info")
    private String info;

    // 成本价
    @Column(name = "cost")
    private BigDecimal cost;

    // 排序
    @Column(name = "sort",nullable = false)
    private Integer sort;

    // 是否推荐0不推荐1推荐
    @Column(name = "is_hot",nullable = false)
    private Integer isHot;

    // 是否删除 0未删除 1删除
    @Column(name = "is_del",nullable = false)
    private Integer isDel;

    // 添加时间
    @Column(name = "add_time")
    private Integer addTime;

    // 是否包邮 0不包邮 1包邮
    @Column(name = "is_postage",nullable = false)
    private Integer isPostage;

    // 邮费
    @Column(name = "postage")
    private BigDecimal postage;

    // 砍价规则
    @Column(name = "rule")
    private String rule;

    // 砍价产品浏览量
    @Column(name = "look")
    private Integer look;

    // 砍价产品分享量
    @Column(name = "share")
    private Integer share;

    public void copy(YxStoreBargain source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}