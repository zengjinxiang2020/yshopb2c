/**
 * Copyright (C) 2018-2020
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
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Data
@TableName("yx_store_combination")
public class YxStoreCombination implements Serializable {

    @TableId
    private Integer id;


    /** 商品id */
    private Integer productId;


    /** 商户id */
    private Integer merId;


    /** 推荐图 */
    private String image;


    /** 轮播图 */
    private String images;


    /** 活动标题 */
    private String title;


    /** 活动属性 */
    private String attr;


    /** 参团人数 */
    private Integer people;


    /** 简介 */
    private String info;


    /** 价格 */
    private BigDecimal price;


    /** 排序 */
    private Integer sort;


    /** 销量 */
    private Integer sales;


    /** 库存 */
    private Integer stock;


    /** 添加时间 */
    private String addTime;


    /** 推荐 */
    private Integer isHost;


    /** 产品状态 */
    private Integer isShow;


    private Integer isDel;


    private Integer combination;


    /** 商户是否可用1可用0不可用 */
    private Integer merUse;


    /** 是否包邮1是0否 */
    private Integer isPostage;


    /** 邮费 */
    private BigDecimal postage;


    /** 拼团内容 */
    private String description;


    /** 拼团开始时间 */
    private Integer startTime;


    /** 拼团结束时间 */
    private Integer stopTime;


    /** 拼团订单有效时间 */
    private Integer effectiveTime;


    /** 拼图产品成本 */
    private Integer cost;


    /** 浏览量 */
    private Integer browse;


    /** 单位名 */
    private String unitName;


    private Timestamp endTimeDate;


    private Timestamp startTimeDate;


    public void copy(YxStoreCombination source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
