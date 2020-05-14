package co.yixiang.modules.activity.domain;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
@TableName("yx_store_coupon_issue_user")
public class YxStoreCouponIssueUser implements Serializable {

    @TableId
    private Integer id;


    /** 领取优惠券用户ID */
    private Integer uid;


    /** 优惠券前台领取ID */
    private Integer issueCouponId;


    /** 领取时间 */
    private Integer addTime;


    public void copy(YxStoreCouponIssueUser source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
