/**
 * Copyright (C) 2018-2019
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
import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_store_order_status")
public class YxStoreOrderStatus implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 订单id */
    //@Column(name = "oid",nullable = false)
   //@NotNull
    private Integer oid;


    /** 操作类型 */
    //@Column(name = "change_type",nullable = false)
    //@NotBlank
    private String changeType;


    /** 操作备注 */
    //@Column(name = "change_message",nullable = false)
    //@NotBlank
    private String changeMessage;


    /** 操作时间 */
    //@Column(name = "change_time",nullable = false)
   //@NotNull
    private Integer changeTime;


    public void copy(YxStoreOrderStatus source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
