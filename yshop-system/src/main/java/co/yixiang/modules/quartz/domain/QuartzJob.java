package co.yixiang.modules.quartz.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/
@Entity
@Data
@Table(name="quartz_job")
public class QuartzJob implements Serializable {

    public static final String JOB_KEY = "JOB_KEY";

    /** 定时任务ID */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;


    /** Spring Bean名称 */
    @Column(name = "bean_name")
    private String beanName;


    /** cron 表达式 */
    @Column(name = "cron_expression")
    private String cronExpression;


    /** 状态：1暂停、0启用 */
    @Column(name = "is_pause")
    private Boolean isPause;


    /** 任务名称 */
    @Column(name = "job_name")
    private String jobName;


    /** 方法名称 */
    @Column(name = "method_name")
    private String methodName;


    /** 参数 */
    @Column(name = "params")
    private String params;


    /** 备注 */
    @Column(name = "remark")
    private String remark;


    /** 创建日期 */
    @Column(name = "create_time")
    @TableField(fill= FieldFill.INSERT)
    private Timestamp createTime;

    public void copy(QuartzJob source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
