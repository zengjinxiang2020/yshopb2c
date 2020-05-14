/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.mp.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/
@Entity
@Data
@Table(name="yx_wechat_reply")
public class YxWechatReply implements Serializable {

    /** 微信关键字回复id */
    @Id

    @Column(name = "id")
    private Integer id;


    /** 关键字 */
    @TableField(value = "`key`")
    @NotBlank
    private String key;


    /** 回复类型 */
    @Column(name = "type",nullable = false)
    @NotBlank
    private String type;


    /** 回复数据 */
    @Column(name = "data",nullable = false)
    @NotBlank
    private String data;


    /** 0=不可用  1 =可用 */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    /** 是否隐藏 */
    @Column(name = "hide")
    private Integer hide;


    public void copy(YxWechatReply source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
