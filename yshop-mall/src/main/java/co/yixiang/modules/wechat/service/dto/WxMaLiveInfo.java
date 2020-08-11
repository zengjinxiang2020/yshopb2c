package co.yixiang.modules.wechat.service.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
/**
 * 直播接口入参
 */
@Data
public class WxMaLiveInfo implements Serializable {
    private static final long serialVersionUID = 7285263767524755887L;

    /**
     * 直播列表
     */
    @Data
    public static class RoomInfo implements Serializable {
        private static final long serialVersionUID = 7745775280267417154L;
        /**
         * 直播间名字，最短3个汉字，最长17个汉字，1个汉字相当于2个字符
         */
        private String name;
        /**
         * 直播房间id
         */
        private Integer roomid;
        /**
         * 背景图，填入mediaID（mediaID获取后，三天内有效）；图片mediaID的获取，
         * 请参考以下文档： https://developers.weixin.qq.com/doc/offiaccount/Asset_Management/New_temporary_materials.html；
         * 直播间背景图，图片规则：建议像素1080*1920，大小不超过2M
         */
        private String coverImg;

        /**
         * 分享图，填入mediaID（mediaID获取后，三天内有效）；图片mediaID的获取，请参考以下文档： https://developers.weixin.qq.com/doc/offiaccount/Asset_Management/New_temporary_materials.html；直播间分享图，图片规则：建议像素800*640，大小不超过1M；
         */
        private String shareImg;

        /**
         * 101：直播中，102：未开始，103已结束，104禁播，105：暂停，106：异常，107：已过期
         */
        private Integer liveStatus;
        /**
         * 直播计划开始时间（开播时间需要在当前时间的10分钟后 并且 开始时间不能在 6 个月后）
         */
        private Long startTime;
        /**
         * 直播计划结束时间（开播时间和结束时间间隔不得短于30分钟，不得超过24小时）
         */
        private Long endTime;
        /**
         * 主播昵称，最短2个汉字，最长15个汉字，1个汉字相当于2个字符
         */
        private String anchorName;
        /**
         * 主播微信号，如果未实名认证，需要先前往“小程序直播”小程序进行实名验证, 小程序二维码链接：https://res.wx.qq.com/op_res/BbVNeczA1XudfjVqCVoKgfuWe7e3aUhokktRVOqf_F0IqS6kYR--atCpVNUUC3zr
         */
        private String anchorWechat;

        /**
         * 主播头像
         */
        private String anchorImg;
        /**
         * 直播间类型 【1: 推流，0：手机直播】
         */
        private Integer type;

        /**
         * 横屏、竖屏 【1：横屏，0：竖屏】（横屏：视频宽高比为16:9、4:3、1.85:1 ；竖屏：视频宽高比为9:16、2:3）
         */
        private Integer screenType;
        /**
         * 是否关闭点赞 【0：开启，1：关闭】（若关闭，直播开始后不允许开启）
         */
        private Integer closeLike;
        /**
         * 是否关闭货架 【0：开启，1：关闭】（若关闭，直播开始后不允许开启）
         */
        private Integer closeGoods;
        /**
         * 是否关闭评论 【0：开启，1：关闭】（若关闭，直播开始后不允许开启）
         */
        private Integer closeComment;
        /**
         *
         */
        private List<Goods> goods;
    }

    /**
     * 商品列表
     */
    @Data
    public static class Goods implements Serializable {
        private static final long serialVersionUID = 5769245932149287574L;
        /**
         * 商品id
         */
        private Integer goodsId;
        /**
         * 填入mediaID（mediaID获取后，三天内有效）；图片mediaID的获取，请参考以下文档： https://developers.weixin.qq.com/doc/offiaccount/Asset_Management/New_temporary_materials.html；图片规则：图片尺寸最大300像素*300像素；
         */
        private String coverImgUrl;
        /**
         * 商品详情页的小程序路径，路径参数存在 url 的，该参数的值需要进行 encode 处理再填入
         */
        private String url;
        /**
         * 价格类型，1：一口价（只需要传入price，price2不传） 2：价格区间（price字段为左边界，price2字段为右边界，price和price2必传） 3：显示折扣价（price字段为原价，price2字段为现价， price和price2必传）
         */
        private Integer priceType;
        /**
         * 数字，最多保留两位小数，单位元
         */
        private String price;
        /**
         * 数字，最多保留两位小数，单位元
         */
        private String price2;
        /**
         * 商品名称，最长14个汉字，1个汉字相当于2个字符
         */
        private String name;
        /**
         * 1, 2：表示是为api添加商品，否则是在MP添加商品
         */
        private String thirdPartyTag;
    }
}
