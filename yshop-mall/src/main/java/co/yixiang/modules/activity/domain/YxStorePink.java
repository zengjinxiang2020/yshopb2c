/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co

 */
package co.yixiang.modules.activity.domain;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import co.yixiang.domain.BaseDomain;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

/**
* @author hupeng
* @date 2020-05-12
*/
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Builder
@TableName("yx_store_pink")
public class YxStorePink extends BaseDomain {

    @TableId
    private Long id;


    /** 用户id */
    private Long uid;


    /** 订单id 生成 */
    private String orderId;


    /** 订单id  数据库 */
    private Long orderIdKey;


    /** 购买商品个数 */
    private Integer totalNum;


    /** 购买总金额 */
    private BigDecimal totalPrice;


    /** 拼团产品id */
    private Long cid;


    /** 产品id */
    private Long pid;


    /** 拼图总人数 */
    private Integer people;


    /** 拼团产品单价 */
    private BigDecimal price;


    private Date stopTime;


    /** 团长id 0为团长 */
    private Long kId;


    /** 是否发送模板消息0未发送1已发送 */
    private Integer isTpl;


    /** 是否退款 0未退款 1已退款 */
    private Integer isRefund;


    /** 状态1进行中2已完成3未完成 */
    private Integer status;


    public void copy(YxStorePink source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
