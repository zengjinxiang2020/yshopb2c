package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
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
@Entity
@Data
@Table(name="yx_user")
public class YxUser implements Serializable {

    /** 用户id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "uid")
    private Integer uid;


    /** 用户账户(跟accout一样) */
    @Column(name = "username")
    private String username;


    /** 用户账号 */
    @Column(name = "account",nullable = false)
    @NotBlank
    private String account;


    /** 用户密码（跟pwd） */
    @Column(name = "password")
    private String password;


    /** 用户密码 */
    @Column(name = "pwd",nullable = false)
    @NotBlank
    private String pwd;


    /** 真实姓名 */
    @Column(name = "real_name")
    private String realName;


    /** 生日 */
    @Column(name = "birthday")
    private Integer birthday;


    /** 身份证号码 */
    @Column(name = "card_id")
    private String cardId;


    /** 用户备注 */
    @Column(name = "mark")
    private String mark;


    /** 合伙人id */
    @Column(name = "partner_id")
    private Integer partnerId;


    /** 用户分组id */
    @Column(name = "group_id")
    private Integer groupId;


    /** 用户昵称 */
    @Column(name = "nickname")
    private String nickname;


    /** 用户头像 */
    @Column(name = "avatar")
    private String avatar;


    /** 手机号码 */
    @Column(name = "phone")
    private String phone;


    /** 添加时间 */
    @Column(name = "add_time",nullable = false)
    @NotNull
    private Integer addTime;


    /** 添加ip */
    @Column(name = "add_ip")
    private String addIp;


    /** 最后一次登录时间 */
    @Column(name = "last_time",nullable = false)
    @NotNull
    private Integer lastTime;


    /** 最后一次登录ip */
    @Column(name = "last_ip")
    private String lastIp;


    /** 用户余额 */
    @Column(name = "now_money",nullable = false)
    @NotNull
    private BigDecimal nowMoney;


    /** 佣金金额 */
    @Column(name = "brokerage_price",nullable = false)
    @NotNull
    private BigDecimal brokeragePrice;


    /** 用户剩余积分 */
    @Column(name = "integral",nullable = false)
    @NotNull
    private BigDecimal integral;


    /** 连续签到天数 */
    @Column(name = "sign_num",nullable = false)
    @NotNull
    private Integer signNum;


    /** 1为正常，0为禁止 */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    /** 等级 */
    @Column(name = "level",nullable = false)
    @NotNull
    private Integer level;


    /** 推广元id */
    @Column(name = "spread_uid",nullable = false)
    @NotNull
    private Integer spreadUid;


    /** 推广员关联时间 */
    @Column(name = "spread_time",nullable = false)
    @NotNull
    private Integer spreadTime;


    /** 用户类型 */
    @Column(name = "user_type",nullable = false)
    @NotBlank
    private String userType;


    /** 是否为推广员 */
    @Column(name = "is_promoter",nullable = false)
    @NotNull
    private Integer isPromoter;


    /** 用户购买次数 */
    @Column(name = "pay_count")
    private Integer payCount;


    /** 下级人数 */
    @Column(name = "spread_count")
    private Integer spreadCount;


    /** 清理会员时间 */
    @Column(name = "clean_time")
    private Integer cleanTime;


    /** 详细地址 */
    @Column(name = "addres",nullable = false)
    @NotBlank
    private String addres;


    /** 管理员编号  */
    @Column(name = "adminid")
    private Integer adminid;


    /** 用户登陆类型，h5,wechat,routine */
    @Column(name = "login_type",nullable = false)
    @NotBlank
    private String loginType;


    public void copy(YxUser source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}