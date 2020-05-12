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
@Table(name="yx_store_order_status")
public class YxStoreOrderStatus implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 订单id */
    @Column(name = "oid",nullable = false)
    @NotNull
    private Integer oid;


    /** 操作类型 */
    @Column(name = "change_type",nullable = false)
    @NotBlank
    private String changeType;


    /** 操作备注 */
    @Column(name = "change_message",nullable = false)
    @NotBlank
    private String changeMessage;


    /** 操作时间 */
    @Column(name = "change_time",nullable = false)
    @NotNull
    private Integer changeTime;


    public void copy(YxStoreOrderStatus source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}