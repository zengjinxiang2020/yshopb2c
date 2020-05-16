/**
 * Copyright (C) 2018-2020
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
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_user_recharge")
public class YxUserRecharge implements Serializable {

    @TableId
    private Integer id;


    /** 充值用户UID */
    private Integer uid;


    /** 订单号 */
    private String orderId;


    /** 充值金额 */
    private BigDecimal price;


    /** 充值类型 */
    private String rechargeType;


    /** 是否充值 */
    private Integer paid;


    /** 充值支付时间 */
    private Integer payTime;


    /** 充值时间 */
    @TableField(fill= FieldFill.INSERT)
    private Integer addTime;


    /** 退款金额 */
    private BigDecimal refundPrice;


    /** 昵称 */
    private String nickname;


    public void copy(YxUserRecharge source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
