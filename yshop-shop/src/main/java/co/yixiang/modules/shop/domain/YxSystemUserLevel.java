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
@TableName("yx_system_user_level")
public class YxSystemUserLevel implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 商户id */
    //@Column(name = "mer_id",nullable = false)
   //@NotNull
    private Integer merId;


    /** 会员名称 */
    //@Column(name = "name",nullable = false)
    //@NotBlank
    private String name;


    /** 购买金额 */
    //@Column(name = "money",nullable = false)
   //@NotNull
    private BigDecimal money;


    /** 有效时间 */
    //@Column(name = "valid_date",nullable = false)
   //@NotNull
    private Integer validDate;


    /** 是否为永久会员 */
    //@Column(name = "is_forever",nullable = false)
   //@NotNull
    private Integer isForever;


    /** 是否购买,1=购买,0=不购买 */
    //@Column(name = "is_pay",nullable = false)
   //@NotNull
    private Integer isPay;


    /** 是否显示 1=显示,0=隐藏 */
    //@Column(name = "is_show",nullable = false)
   //@NotNull
    private Integer isShow;


    /** 会员等级 */
    //@Column(name = "grade",nullable = false)
   //@NotNull
    private Integer grade;


    /** 享受折扣 */
    //@Column(name = "discount",nullable = false)
   //@NotNull
    private BigDecimal discount;

    /** 会员卡背景 */
    //@Column(name = "image",nullable = false)
    //@NotBlank
    private String image;


    /** 会员图标 */
    //@Column(name = "icon",nullable = false)
    //@NotBlank
    private String icon;


    /** 说明 */
     @TableField(value = "`explain`")
    //@NotBlank
    private String explain;


    /** 添加时间 */
    //@Column(name = "add_time",nullable = false)
   //@NotNull
    private Integer addTime;


    /** 是否删除.1=删除,0=未删除 */
    //@Column(name = "is_del",nullable = false)
   //@NotNull
    private Integer isDel;


    public void copy(YxSystemUserLevel source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
