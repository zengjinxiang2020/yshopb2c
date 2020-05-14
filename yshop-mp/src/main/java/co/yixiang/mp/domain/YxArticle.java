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
@Table(name="yx_article")
public class YxArticle implements Serializable {

    /** 文章管理ID */
    @Id

    @Column(name = "id")
    private Integer id;


    /** 分类id */
    @Column(name = "cid")
    private String cid;


    /** 文章标题 */
    @Column(name = "title",nullable = false)
    @NotBlank
    private String title;


    /** 文章作者 */
    @Column(name = "author")
    private String author;


    /** 文章图片 */
    @Column(name = "image_input",nullable = false)
    @NotBlank
    private String imageInput;


    /** 文章简介 */
    @Column(name = "synopsis")
    private String synopsis;


    @Column(name = "content")
    private String content;


    /** 文章分享标题 */
    @Column(name = "share_title")
    private String shareTitle;


    /** 文章分享简介 */
    @Column(name = "share_synopsis")
    private String shareSynopsis;


    /** 浏览次数 */
    @Column(name = "visit")
    private String visit;


    /** 排序 */
    @Column(name = "sort")
    private Integer sort;


    /** 原文链接 */
    @Column(name = "url")
    private String url;


    /** 状态 */
    @Column(name = "status")
    private Integer status;


    /** 添加时间 */
    @Column(name = "add_time")
    private String addTime;


    /** 是否隐藏 */
    @Column(name = "hide")
    private Integer hide;


    /** 管理员id */
    @Column(name = "admin_id")
    private Integer adminId;


    /** 商户id */
    @Column(name = "mer_id")
    private Integer merId;


    /** 产品关联id */
    @Column(name = "product_id")
    private Integer productId;


    /** 是否热门(小程序) */
    @Column(name = "is_hot")
    private Integer isHot;


    /** 是否轮播图(小程序) */
    @Column(name = "is_banner")
    private Integer isBanner;


    public void copy(YxArticle source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
