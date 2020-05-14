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
@TableName("yx_store_product_attr_result")
public class YxStoreProductAttrResult implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 商品ID */
    //@Column(name = "product_id",nullable = false)
   //@NotNull
    private Integer productId;


    /** 商品属性参数 */
    //@Column(name = "result",nullable = false)
    //@NotBlank
    private String result;


    /** 上次修改时间 */
    //@Column(name = "change_time",nullable = false)
   //@NotNull
    private Integer changeTime;


    public void copy(YxStoreProductAttrResult source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
