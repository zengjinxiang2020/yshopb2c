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
@Table(name="yx_express")
public class YxExpress implements Serializable {

    /** 快递公司id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 快递公司简称 */
    @Column(name = "code",unique = true,nullable = false)
    @NotBlank
    private String code;


    /** 快递公司全称 */
    @Column(name = "name",nullable = false)
    @NotBlank
    private String name;


    /** 排序 */
    @Column(name = "sort",nullable = false)
    @NotNull
    private Integer sort;


    /** 是否显示 */
    @Column(name = "is_show",nullable = false)
    @NotNull
    private Integer isShow;


    public void copy(YxExpress source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}