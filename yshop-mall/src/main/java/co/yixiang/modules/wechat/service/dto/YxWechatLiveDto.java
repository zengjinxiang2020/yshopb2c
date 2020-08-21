/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.wechat.service.dto;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
* @author hupeng
* @date 2020-08-10
*/
@Data
public class YxWechatLiveDto implements Serializable {



    /** 直播间id */
    /** 防止精度丢失 */
    @JsonSerialize(using= ToStringSerializer.class)
    private Long roomid;

    private Long id;

    /** 直播间标题 */
    private String name;

    /** 背景图 */
    private String coverImge;

    /** 分享图片 */
    private String shareImge;

    /** 直播间状态 */
    private Integer liveStatus;

    /** 开始时间 */
    private Long startTime;

    /** 预计结束时间 */
    private Long endTime;

    /** 主播昵称 */
    private String anchorName;

    /** 主播微信号 */
    private String anchorWechat;

    /** 主播头像 */
    private String anchorImge;

    /** 直播间类型 1：推流 0：手机直播 */
    private Integer type;

    /** 横屏、竖屏 【1：横屏，0：竖屏】 */
    private Integer screenType;

    /** 是否关闭点赞 【0：开启，1：关闭】 */
    private Integer closeLike;

    /** 是否关闭评论 【0：开启，1：关闭】 */
    private Integer closeComment;

    /** 是否关闭货架 【0：开启，1：关闭】 */
    private Integer closeGoods;
    /**
     * 关联商品id多个，隔开
     */
    private String productId;
    private List<YxWechatLiveGoodsDto> product;
}
