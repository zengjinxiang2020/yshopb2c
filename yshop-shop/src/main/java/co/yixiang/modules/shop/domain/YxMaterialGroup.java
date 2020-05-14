package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_material_group")
public class YxMaterialGroup implements Serializable {

    /** PK */
    @TableId
    //@Column(name = "id")
    private String id;


    /** 所属租户 */
    //@Column(name = "user_id",nullable = false)
    //@NotBlank
    private String userId;


    /** 逻辑删除标记（0：显示；1：隐藏） */
    //@Column(name = "del_flag",nullable = false)
    //@NotBlank
    @TableLogic
    @TableField(fill=FieldFill.INSERT_UPDATE)
    private Boolean delFlag;


    /** 创建时间 */
    //@Column(name = "create_time",nullable = false)
   //@NotNull
    @TableField(fill= FieldFill.INSERT)
    private Timestamp createTime;


    /** 最后更新时间 */
    //@Column(name = "update_time",nullable = false)
   //@NotNull
    @TableField(fill= FieldFill.INSERT_UPDATE)
    private Timestamp updateTime;


    /** 创建者ID */
    //@Column(name = "create_id")
    private String createId;


    /** 分组名 */
    //@Column(name = "name",nullable = false)
    //@NotBlank
    private String name;


    public void copy(YxMaterialGroup source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
