package co.yixiang.modules.activity.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
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
@Entity
@Data
@Table(name="yx_store_pink")
public class YxStorePink implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 用户id */
    @Column(name = "uid",nullable = false)
    @NotNull
    private Integer uid;


    /** 订单id 生成 */
    @Column(name = "order_id",nullable = false)
    @NotBlank
    private String orderId;


    /** 订单id  数据库 */
    @Column(name = "order_id_key",nullable = false)
    @NotNull
    private Integer orderIdKey;


    /** 购买商品个数 */
    @Column(name = "total_num",nullable = false)
    @NotNull
    private Integer totalNum;


    /** 购买总金额 */
    @Column(name = "total_price",nullable = false)
    @NotNull
    private BigDecimal totalPrice;


    /** 拼团产品id */
    @Column(name = "cid",nullable = false)
    @NotNull
    private Integer cid;


    /** 产品id */
    @Column(name = "pid",nullable = false)
    @NotNull
    private Integer pid;


    /** 拼图总人数 */
    @Column(name = "people",nullable = false)
    @NotNull
    private Integer people;


    /** 拼团产品单价 */
    @Column(name = "price",nullable = false)
    @NotNull
    private BigDecimal price;


    /** 开始时间 */
    @Column(name = "add_time",nullable = false)
    @NotBlank
    private String addTime;


    @Column(name = "stop_time",nullable = false)
    @NotBlank
    private String stopTime;


    /** 团长id 0为团长 */
    @Column(name = "k_id",nullable = false)
    @NotNull
    private Integer kId;


    /** 是否发送模板消息0未发送1已发送 */
    @Column(name = "is_tpl",nullable = false)
    @NotNull
    private Integer isTpl;


    /** 是否退款 0未退款 1已退款 */
    @Column(name = "is_refund",nullable = false)
    @NotNull
    private Integer isRefund;


    /** 状态1进行中2已完成3未完成 */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    public void copy(YxStorePink source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}