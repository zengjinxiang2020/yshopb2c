package co.yixiang.modules.shop.domain;
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
@Table(name="yx_store_category")
public class YxStoreCategory implements Serializable {

    /** 商品分类表ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 父id */
    @Column(name = "pid",nullable = false)
    @NotNull
    private Integer pid;


    /** 分类名称 */
    @Column(name = "cate_name",nullable = false)
    @NotBlank
    private String cateName;


    /** 排序 */
    @Column(name = "sort")
    private Integer sort;


    /** 图标 */
    @Column(name = "pic")
    private String pic;


    /** 是否推荐 */
    @Column(name = "is_show")
    private Integer isShow;


    /** 添加时间 */
    @Column(name = "add_time")
    private Integer addTime;


    /** 删除状态 */
    @Column(name = "is_del")
    private Integer isDel;


    public void copy(YxStoreCategory source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}