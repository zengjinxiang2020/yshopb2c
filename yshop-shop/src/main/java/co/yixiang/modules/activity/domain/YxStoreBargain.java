package co.yixiang.modules.activity.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Timestamp;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Entity
@Data
@Table(name="yx_store_bargain")
public class YxStoreBargain implements Serializable {

    /** 砍价产品ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 关联产品ID */
    @Column(name = "product_id",nullable = false)
    @NotNull
    private Integer productId;


    /** 砍价活动名称 */
    @Column(name = "title",nullable = false)
    @NotBlank
    private String title;


    /** 砍价活动图片 */
    @Column(name = "image",nullable = false)
    @NotBlank
    private String image;


    /** 单位名称 */
    @Column(name = "unit_name")
    private String unitName;


    /** 库存 */
    @Column(name = "stock")
    private Integer stock;


    /** 销量 */
    @Column(name = "sales")
    private Integer sales;


    /** 砍价产品轮播图 */
    @Column(name = "images",nullable = false)
    @NotBlank
    private String images;


    /** 砍价开启时间 */
    @Column(name = "start_time",nullable = false)
    @NotNull
    private Integer startTime;


    /** 砍价结束时间 */
    @Column(name = "stop_time",nullable = false)
    @NotNull
    private Integer stopTime;


    /** 砍价产品名称 */
    @Column(name = "store_name")
    private String storeName;


    /** 砍价金额 */
    @Column(name = "price")
    private BigDecimal price;


    /** 砍价商品最低价 */
    @Column(name = "min_price")
    private BigDecimal minPrice;


    /** 每次购买的砍价产品数量 */
    @Column(name = "num")
    private Integer num;


    /** 用户每次砍价的最大金额 */
    @Column(name = "bargain_max_price")
    private BigDecimal bargainMaxPrice;


    /** 用户每次砍价的最小金额 */
    @Column(name = "bargain_min_price")
    private BigDecimal bargainMinPrice;


    /** 用户每次砍价的次数 */
    @Column(name = "bargain_num",nullable = false)
    @NotNull
    private Integer bargainNum;


    /** 砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间) */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    /** 砍价详情 */
    @Column(name = "description")
    private String description;


    /** 反多少积分 */
    @Column(name = "give_integral",nullable = false)
    @NotNull
    private BigDecimal giveIntegral;


    /** 砍价活动简介 */
    @Column(name = "info")
    private String info;


    /** 成本价 */
    @Column(name = "cost")
    private BigDecimal cost;


    /** 排序 */
    @Column(name = "sort",nullable = false)
    @NotNull
    private Integer sort;


    /** 是否推荐0不推荐1推荐 */
    @Column(name = "is_hot",nullable = false)
    @NotNull
    private Integer isHot;


    /** 是否删除 0未删除 1删除 */
    @Column(name = "is_del",nullable = false)
    @NotNull
    private Integer isDel;


    /** 添加时间 */
    @Column(name = "add_time")
    private Integer addTime;


    /** 是否包邮 0不包邮 1包邮 */
    @Column(name = "is_postage",nullable = false)
    @NotNull
    private Integer isPostage;


    /** 邮费 */
    @Column(name = "postage")
    private BigDecimal postage;


    /** 砍价规则 */
    @Column(name = "rule")
    private String rule;


    /** 砍价产品浏览量 */
    @Column(name = "look")
    private Integer look;


    /** 砍价产品分享量 */
    @Column(name = "share")
    private Integer share;


    @Column(name = "end_time_date",nullable = false)
    @NotNull
    private Timestamp endTimeDate;


    @Column(name = "start_time_date",nullable = false)
    @NotNull
    private Timestamp startTimeDate;


    public void copy(YxStoreBargain source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}