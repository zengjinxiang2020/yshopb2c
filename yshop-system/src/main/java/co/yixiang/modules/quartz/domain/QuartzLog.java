/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
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
