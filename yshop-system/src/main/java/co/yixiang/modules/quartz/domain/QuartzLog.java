package co.yixiang.modules.quartz.domain;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/

@Data
@TableName("quartz_log")
public class QuartzLog implements Serializable {

    /** 任务日志ID */
    @TableId
    private Long id;


    /** 任务名称 */
    //@Column(name = "baen_name")
    private String baenName;


    /** Bean名称  */
    @Column(name = "create_time")
    //@TableField(fill= FieldFill.INSERT)
    private Timestamp createTime;


    /** cron表达式 */
    //@Column(name = "cron_expression")
    private String cronExpression;


    /** 异常详细  */
    //@Column(name = "exception_detail")
    private String exceptionDetail;


    /** 状态 */
    //@Column(name = "is_success")
    private Boolean isSuccess;


    /** 任务名称 */
    //@Column(name = "job_name")
    private String jobName;


    /** 方法名称 */
    //@Column(name = "method_name")
    private String methodName;


    /** 参数 */
    //@Column(name = "params")
    private String params;


    /** 耗时（毫秒） */
    //@Column(name = "time")
    private Long time;


    public void copy(QuartzLog source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
