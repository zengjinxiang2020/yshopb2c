/**
 * Copyright (C) 2018-2019
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
@TableName("yx_system_group_data")
public class YxSystemGroupData implements Serializable {

    /** 组合数据详情ID */
    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 对应的数据名称 */
    //@Column(name = "group_name",nullable = false)
    //@NotBlank
    private String groupName;


    /** 数据组对应的数据值（json数据） */
    //@Column(name = "value",nullable = false)
    //@NotBlank
    private String value;


    /** 添加数据时间 */
    //@Column(name = "add_time",nullable = false)
   //@NotNull
    private Integer addTime;


    /** 数据排序 */
    //@Column(name = "sort")
    private Integer sort;


    /** 状态（1：开启；2：关闭；） */
    //@Column(name = "status",nullable = false)
   //@NotNull
    private Integer status;


    public void copy(YxSystemGroupData source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
