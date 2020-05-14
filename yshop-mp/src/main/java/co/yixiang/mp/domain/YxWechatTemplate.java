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
@Table(name="yx_wechat_template")
public class YxWechatTemplate implements Serializable {

    /** 模板id */
    @Id

    @Column(name = "id")
    private Integer id;


    /** 模板编号 */
    @Column(name = "tempkey",nullable = false)
    @NotBlank
    private String tempkey;


    /** 模板名 */
    @Column(name = "name",nullable = false)
    @NotBlank
    private String name;


    /** 回复内容 */
    @Column(name = "content",nullable = false)
    @NotBlank
    private String content;


    /** 模板ID */
    @Column(name = "tempid")
    private String tempid;


    /** 添加时间 */
    @Column(name = "add_time",nullable = false)
    @NotBlank
    private String addTime;


    /** 状态 */
    @Column(name = "status",nullable = false)
    @NotNull
    private Integer status;


    public void copy(YxWechatTemplate source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
