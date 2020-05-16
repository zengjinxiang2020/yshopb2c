/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.TableId;
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
public class YxWechatUser implements Serializable {

    /** 微信用户id */
    @TableId
    private Integer uid;


    /** 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段 */
    //@Column(name = "unionid")
    private String unionid;


    /** 用户的标识，对当前公众号唯一 */
    //@Column(name = "openid",unique = true)
    private String openid;


    /** 小程序唯一身份ID */
    //@Column(name = "routine_openid")
    private String routineOpenid;


    /** 用户的昵称 */
    //@Column(name = "nickname",nullable = false)
    //@NotBlank
    private String nickname;


    /** 用户头像 */
    //@Column(name = "headimgurl",nullable = false)
    //@NotBlank
    private String headimgurl;


    /** 用户的性别，值为1时是男性，值为2时是女性，值为0时是未知 */
    //@Column(name = "sex",nullable = false)
   //@NotNull
    private Integer sex;


    /** 用户所在城市 */
    //@Column(name = "city",nullable = false)
    //@NotBlank
    private String city;


    /** 用户的语言，简体中文为zh_CN */
    //@Column(name = "language",nullable = false)
    //@NotBlank
    private String language;


    /** 用户所在省份 */
    //@Column(name = "province",nullable = false)
    //@NotBlank
    private String province;


    /** 用户所在国家 */
    //@Column(name = "country",nullable = false)
    //@NotBlank
    private String country;


    /** 公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注 */
    //@Column(name = "remark")
    private String remark;


    /** 用户所在的分组ID（兼容旧的用户分组接口） */
    //@Column(name = "groupid")
    private Integer groupid;


    /** 用户被打上的标签ID列表 */
    //@Column(name = "tagid_list")
    private String tagidList;


    /** 用户是否订阅该公众号标识 */
    //@Column(name = "subscribe")
    private Integer subscribe;


    /** 关注公众号时间 */
    //@Column(name = "subscribe_time")
    private Integer subscribeTime;


    /** 添加时间 */
    //@Column(name = "add_time")
    private Integer addTime;


    /** 一级推荐人 */
    //@Column(name = "stair")
    private Integer stair;


    /** 二级推荐人 */
    //@Column(name = "second")
    private Integer second;


    /** 一级推荐人订单 */
    //@Column(name = "order_stair")
    private Integer orderStair;


    /** 二级推荐人订单 */
    //@Column(name = "order_second")
    private Integer orderSecond;


    /** 佣金 */
    //@Column(name = "now_money")
    private BigDecimal nowMoney;


    /** 小程序用户会话密匙 */
    //@Column(name = "session_key")
    private String sessionKey;


    /** 用户类型 */
    //@Column(name = "user_type")
    private String userType;


    public void copy(YxWechatUser source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
