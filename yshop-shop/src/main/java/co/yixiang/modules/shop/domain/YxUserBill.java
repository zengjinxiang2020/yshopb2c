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
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_user_bill")
public class YxUserBill implements Serializable {

    /** 用户账单id */
    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 用户uid */
    //@Column(name = "uid",nullable = false)
   //@NotNull
    private Integer uid;


    /** 关联id */
    //@Column(name = "link_id",nullable = false)
    //@NotBlank
    private String linkId;


    /** 0 = 支出 1 = 获得 */
    //@Column(name = "pm",nullable = false)
   //@NotNull
    private Integer pm;


    /** 账单标题 */
    //@Column(name = "title",nullable = false)
    //@NotBlank
    private String title;


    /** 明细种类 */
    //@Column(name = "category",nullable = false)
    //@NotBlank
    private String category;


    /** 明细类型 */
    //@Column(name = "type",nullable = false)
    //@NotBlank
    private String type;


    /** 明细数字 */
    //@Column(name = "number",nullable = false)
   //@NotNull
    private BigDecimal number;


    /** 剩余 */
    //@Column(name = "balance",nullable = false)
   //@NotNull
    private BigDecimal balance;


    /** 备注 */
    //@Column(name = "mark",nullable = false)
    //@NotBlank
    private String mark;


    /** 添加时间 */
    //@Column(name = "add_time",nullable = false)
   //@NotNull
    private Integer addTime;


    /** 0 = 带确定 1 = 有效 -1 = 无效 */
    //@Column(name = "status",nullable = false)
   //@NotNull
    private Integer status;


    public void copy(YxUserBill source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
