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
@Table(name="yx_system_config")
public class YxSystemConfig implements Serializable {

    /** 配置id */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 字段名称 */
    @Column(name = "menu_name",nullable = false)
    @NotBlank
    private String menuName;


    /** 默认值 */
    @Column(name = "value")
    private String value;


    /** 排序 */
    @Column(name = "sort")
    private Integer sort;


    /** 是否隐藏 */
    @Column(name = "status")
    private Integer status;


    public void copy(YxSystemConfig source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}