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
@Table(name="yx_system_group_data")
public class YxSystemGroupData implements Serializable {

    /** 组合数据详情ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 对应的数据名称 */
    @Column(name = "group_name",nullable = false)
    @NotBlank
    private String groupName;


    /** 数据组对应的数据值（json数据） */
    @Column(name = "value",nullable = false)
    @NotBlank
    private String value;


    /** 添加数据时间 */
    @Column(name = "add_time",nullable = false)
    @NotNull
    private Integer addTime;


    /** 数据排序 */
    @Column(name = "sort")
    private Integer sort;


    /** 状态（1：开启；2：关闭；） */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    public void copy(YxSystemGroupData source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}