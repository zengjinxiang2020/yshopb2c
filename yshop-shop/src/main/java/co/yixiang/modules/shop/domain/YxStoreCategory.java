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
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/

@Data
@TableName("yx_store_category")
public class YxStoreCategory implements Serializable {

    /** 商品分类表ID */
    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 父id */
    //@Column(name = "pid",nullable = false)
   //@NotNull
    private Integer pid;


    /** 分类名称 */
    //@Column(name = "cate_name",nullable = false)
    //@NotBlank
    private String cateName;


    /** 排序 */
    //@Column(name = "sort")
    private Integer sort;


    /** 图标 */
    //@Column(name = "pic")
    private String pic;


    /** 是否推荐 */
    //@Column(name = "is_show")
    private Integer isShow;


    /** 添加时间 */
    //@Column(name = "add_time")
    private Integer addTime;


    /** 删除状态 */
    //@Column(name = "is_del")
    private Integer isDel;


    public void copy(YxStoreCategory source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
