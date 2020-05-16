/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_system_user_task")
public class YxSystemUserTask implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 任务名称 */
    //@Column(name = "name",nullable = false)
    //@NotBlank
    private String name;


    /** 配置原名 */
    //@Column(name = "real_name",nullable = false)
    //@NotBlank
    private String realName;


    /** 任务类型 */
    //@Column(name = "task_type",nullable = false)
    //@NotBlank
    private String taskType;


    /** 限定数 */
    //@Column(name = "number",nullable = false)
   //@NotNull
    private Integer number;


    /** 等级id */
    //@Column(name = "level_id",nullable = false)
   //@NotNull
    private Integer levelId;


    /** 排序 */
    //@Column(name = "sort",nullable = false)
   //@NotNull
    private Integer sort;


    /** 是否显示 */
    //@Column(name = "is_show",nullable = false)
   //@NotNull
    private Integer isShow;


    /** 是否务必达成任务,1务必达成,0=满足其一 */
    //@Column(name = "is_must",nullable = false)
   //@NotNull
    private Integer isMust;


    /** 任务说明 */
    //@Column(name = "illustrate",nullable = false)
    //@NotBlank
    private String illustrate;


    /** 新增时间 */
    //@Column(name = "add_time",nullable = false)
   //@NotNull
    private Integer addTime;


    public void copy(YxSystemUserTask source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
