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
import java.sql.Timestamp;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-13
*/

@Data
@TableName("quartz_job")
public class QuartzJob implements Serializable {

    public static final String JOB_KEY = "JOB_KEY";

    /** 定时任务ID */
    @TableId
    private Long id;


    /** Spring Bean名称 */
    //@Column(name = "bean_name")
    private String beanName;


    /** cron 表达式 */
    //@Column(name = "cron_expression")
    private String cronExpression;


    /** 状态：1暂停、0启用 */
    //@Column(name = "is_pause")
    private Boolean isPause;


    /** 任务名称 */
    //@Column(name = "job_name")
    private String jobName;


    /** 方法名称 */
    //@Column(name = "method_name")
    private String methodName;


    /** 参数 */
    //@Column(name = "params")
    private String params;


    /** 备注 */
    //@Column(name = "remark")
    private String remark;


    /** 创建日期 */
    //@Column(name = "create_time")
    //@TableField(fill= FieldFill.INSERT)
    private Timestamp createTime;

    public void copy(QuartzJob source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
