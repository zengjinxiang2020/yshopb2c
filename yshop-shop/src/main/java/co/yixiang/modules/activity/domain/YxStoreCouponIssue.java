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
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Entity
@Data
@Table(name="yx_store_coupon_issue")
public class YxStoreCouponIssue implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    @Column(name = "cname")
    private String cname;


    /** 优惠券ID */
    @Column(name = "cid")
    private Integer cid;


    /** 优惠券领取开启时间 */
    @Column(name = "start_time")
    private Integer startTime;


    /** 优惠券领取结束时间 */
    @Column(name = "end_time")
    private Integer endTime;


    /** 优惠券领取数量 */
    @Column(name = "total_count")
    private Integer totalCount;


    /** 优惠券剩余领取数量 */
    @Column(name = "remain_count")
    private Integer remainCount;


    /** 是否无限张数 */
    @Column(name = "is_permanent",nullable = false)
    @NotNull
    private Integer isPermanent;


    /** 1 正常 0 未开启 -1 已无效 */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    @Column(name = "is_del",nullable = false)
    @NotNull
    private Integer isDel;


    /** 优惠券添加时间 */
    @Column(name = "add_time")
    private Integer addTime;


    @Column(name = "end_time_date",nullable = false)
    @NotNull
    private Timestamp endTimeDate;


    @Column(name = "start_time_date",nullable = false)
    @NotNull
    private Timestamp startTimeDate;


    public void copy(YxStoreCouponIssue source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}