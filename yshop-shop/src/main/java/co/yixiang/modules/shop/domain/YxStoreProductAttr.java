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
@TableName("yx_store_product_attr")
public class YxStoreProductAttr implements Serializable {

    @TableId
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@Column(name = "id")
    private Integer id;


    /** 商品ID */
    //@Column(name = "product_id",nullable = false)
   //@NotNull
    private Integer productId;


    /** 属性名 */
    //@Column(name = "attr_name",nullable = false)
    //@NotBlank
    private String attrName;


    /** 属性值 */
    //@Column(name = "attr_values",nullable = false)
    //@NotBlank
    private String attrValues;


    public void copy(YxStoreProductAttr source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
