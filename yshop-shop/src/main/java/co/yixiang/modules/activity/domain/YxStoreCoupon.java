package co.yixiang.modules.activity.domain;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
@TableName("yx_store_coupon")
public class YxStoreCoupon implements Serializable {

    /** 优惠券表ID */
    @TableId
    private Integer id;


    /** 优惠券名称 */
    private String title;


    /** 兑换消耗积分值 */
    private Integer integral;


    /** 兑换的优惠券面值 */
    private BigDecimal couponPrice;


    /** 最低消费多少金额可用优惠券 */
    private BigDecimal useMinPrice;


    /** 优惠券有效期限（单位：天） */
    private Integer couponTime;


    /** 排序 */
    private Integer sort;


    /** 状态（0：关闭，1：开启） */
    private Integer status;


    /** 兑换项目添加时间 */
    private Integer addTime;


    /** 是否删除 */
    private Integer isDel;


    public void copy(YxStoreCoupon source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
