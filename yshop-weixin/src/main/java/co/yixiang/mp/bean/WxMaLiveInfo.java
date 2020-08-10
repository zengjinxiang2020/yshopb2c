package co.yixiang.mp.bean;

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
        private String shareImg;
        private Integer liveStatus;
        private Long startTime;
        private Long endTime;
        private String anchorName;
        private String anchorWechat;
        private String anchorImg;
        private Integer type;
        private Integer screenType;
        private Integer closeLike;
        private Integer closeGoods;
        private Integer closeComment;
        private List<Goods> goods;
    }

    /**
     * 商品列表
     */
    @Data
    public static class Goods implements Serializable {
        private static final long serialVersionUID = 5769245932149287574L;
        private Integer goodsId;
        private String coverImgUrl;
        private String url;
        private Integer priceType;
        private String price;
        private String price2;
        private String name;
        /**
         * 1, 2：表示是为api添加商品，否则是在MP添加商品
         */
        private String thirdPartyTag;
    }
}
