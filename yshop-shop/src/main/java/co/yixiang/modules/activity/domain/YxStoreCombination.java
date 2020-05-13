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
@Table(name="yx_store_combination")
public class YxStoreCombination implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 商品id */
    @Column(name = "product_id",nullable = false)
    @NotNull
    private Integer productId;


    /** 商户id */
    @Column(name = "mer_id")
    private Integer merId;


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


    /** 活动属性 */
    @Column(name = "attr")
    private String attr;


    /** 参团人数 */
    @Column(name = "people",nullable = false)
    @NotNull
    private Integer people;


    /** 简介 */
    @Column(name = "info",nullable = false)
    @NotBlank
    private String info;


    /** 价格 */
    @Column(name = "price",nullable = false)
    @NotNull
    private BigDecimal price;


    /** 排序 */
    @Column(name = "sort",nullable = false)
    @NotNull
    private Integer sort;


    /** 销量 */
    @Column(name = "sales",nullable = false)
    @NotNull
    private Integer sales;


    /** 库存 */
    @Column(name = "stock",nullable = false)
    @NotNull
    private Integer stock;


    /** 添加时间 */
    @Column(name = "add_time",nullable = false)
    @NotBlank
    private String addTime;


    /** 推荐 */
    @Column(name = "is_host",nullable = false)
    @NotNull
    private Integer isHost;


    /** 产品状态 */
    @Column(name = "is_show",nullable = false)
    @NotNull
    private Integer isShow;


    @Column(name = "is_del",nullable = false)
    @NotNull
    private Integer isDel;


    @Column(name = "combination",nullable = false)
    @NotNull
    private Integer combination;


    /** 商户是否可用1可用0不可用 */
    @Column(name = "mer_use")
    private Integer merUse;


    /** 是否包邮1是0否 */
    @Column(name = "is_postage",nullable = false)
    @NotNull
    private Integer isPostage;


    /** 邮费 */
    @Column(name = "postage",nullable = false)
    @NotNull
    private BigDecimal postage;


    /** 拼团内容 */
    @Column(name = "description",nullable = false)
    @NotBlank
    private String description;


    /** 拼团开始时间 */
    @Column(name = "start_time",nullable = false)
    @NotNull
    private Integer startTime;


    /** 拼团结束时间 */
    @Column(name = "stop_time",nullable = false)
    @NotNull
    private Integer stopTime;


    /** 拼团订单有效时间 */
    @Column(name = "effective_time",nullable = false)
    @NotNull
    private Integer effectiveTime;


    /** 拼图产品成本 */
    @Column(name = "cost",nullable = false)
    @NotNull
    private Integer cost;


    /** 浏览量 */
    @Column(name = "browse")
    private Integer browse;


    /** 单位名 */
    @Column(name = "unit_name",nullable = false)
    @NotBlank
    private String unitName;


    @Column(name = "end_time_date",nullable = false)
    @NotNull
    private Timestamp endTimeDate;


    @Column(name = "start_time_date",nullable = false)
    @NotNull
    private Timestamp startTimeDate;


    public void copy(YxStoreCombination source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}