/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.activity.domain;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
@TableName("yx_store_coupon_issue")
public class YxStoreCouponIssue implements Serializable {

    @TableId
    private Integer id;


    private String cname;


    /** 优惠券ID */
    private Integer cid;


    /** 优惠券领取开启时间 */
    private Integer startTime;


    /** 优惠券领取结束时间 */
    private Integer endTime;


    /** 优惠券领取数量 */
    private Integer totalCount;


    /** 优惠券剩余领取数量 */
    private Integer remainCount;


    /** 是否无限张数 */
    private Integer isPermanent;


    /** 1 正常 0 未开启 -1 已无效 */
    private Integer status;


    private Integer isDel;


    /** 优惠券添加时间 */
    private Integer addTime;


    private Timestamp endTimeDate;


    private Timestamp startTimeDate;


    public void copy(YxStoreCouponIssue source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
