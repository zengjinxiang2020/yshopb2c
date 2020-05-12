package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import javax.persistence.*;
import javax.validation.constraints.*;
import java.math.BigDecimal;
import java.io.Serializable;

/**
* @author hupeng
* @date 2020-05-12
*/
@Entity
@Data
@Table(name="yx_store_product_attr_value")
public class YxStoreProductAttrValue implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 商品ID */
    @Column(name = "product_id",nullable = false)
    @NotNull
    private Integer productId;


    /** 商品属性索引值 (attr_value|attr_value[|....]) */
    @Column(name = "suk",nullable = false)
    @NotBlank
    private String suk;


    /** 属性对应的库存 */
    @Column(name = "stock",nullable = false)
    @NotNull
    private Integer stock;


    /** 销量 */
    @Column(name = "sales")
    private Integer sales;


    /** 属性金额 */
    @Column(name = "price",nullable = false)
    @NotNull
    private BigDecimal price;


    /** 图片 */
    @Column(name = "image")
    private String image;


    /** 唯一值 */
     @TableField(value = "`unique`")
    @NotBlank
    private String unique;


    /** 成本价 */
    @Column(name = "cost",nullable = false)
    @NotNull
    private BigDecimal cost;


    public void copy(YxStoreProductAttrValue source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
