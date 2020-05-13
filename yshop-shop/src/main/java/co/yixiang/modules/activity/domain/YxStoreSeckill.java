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
@Table(name="yx_store_seckill")
public class YxStoreSeckill implements Serializable {

    /** 商品秒杀产品表id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 商品id */
    @Column(name = "product_id",nullable = false)
    @NotNull
    private Integer productId;


    /** 推荐图 */
    @Column(name = "image",nullable = false)
    @NotBlank
    private String image;


    /** 轮播图 */
    @Column(name = "images",nullable = false)
    @NotBlank
    private String images;


    /** 活动标题 */
    @Column(name = "title",nullable = false)
    @NotBlank
    private String title;


    /** 简介 */
    @Column(name = "info",nullable = false)
    @NotBlank
    private String info;


    /** 价格 */
    @Column(name = "price",nullable = false)
    @NotNull
    private BigDecimal price;


    /** 成本 */
    @Column(name = "cost",nullable = false)
    @NotNull
    private BigDecimal cost;


    /** 原价 */
    @Column(name = "ot_price",nullable = false)
    @NotNull
    private BigDecimal otPrice;


    /** 返多少积分 */
    @Column(name = "give_integral",nullable = false)
    @NotNull
    private BigDecimal giveIntegral;


    /** 排序 */
    @Column(name = "sort",nullable = false)
    @NotNull
    private Integer sort;


    /** 库存 */
    @Column(name = "stock",nullable = false)
    @NotNull
    private Integer stock;


    /** 销量 */
    @Column(name = "sales",nullable = false)
    @NotNull
    private Integer sales;


    /** 单位名 */
    @Column(name = "unit_name",nullable = false)
    @NotBlank
    private String unitName;


    /** 邮费 */
    @Column(name = "postage",nullable = false)
    @NotNull
    private BigDecimal postage;


    /** 内容 */
    @Column(name = "description")
    private String description;


    /** 开始时间 */
    @Column(name = "start_time",nullable = false)
    @NotNull
    private Integer startTime;


    /** 结束时间 */
    @Column(name = "stop_time",nullable = false)
    @NotNull
    private Integer stopTime;


    /** 添加时间 */
    @Column(name = "add_time",nullable = false)
    @NotBlank
    private String addTime;


    /** 产品状态 */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    /** 是否包邮 */
    @Column(name = "is_postage",nullable = false)
    @NotNull
    private Integer isPostage;


    /** 热门推荐 */
    @Column(name = "is_hot",nullable = false)
    @NotNull
    private Integer isHot;


    /** 删除 0未删除1已删除 */
    @Column(name = "is_del",nullable = false)
    @NotNull
    private Integer isDel;


    /** 最多秒杀几个 */
    @Column(name = "num",nullable = false)
    @NotNull
    private Integer num;


    /** 显示 */
    @Column(name = "is_show",nullable = false)
    @NotNull
    private Integer isShow;


    @Column(name = "end_time_date",nullable = false)
    @NotNull
    private Timestamp endTimeDate;


    @Column(name = "start_time_date",nullable = false)
    @NotNull
    private Timestamp startTimeDate;


    /** 时间段id */
    @Column(name = "time_id")
    private Integer timeId;


    public void copy(YxStoreSeckill source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}