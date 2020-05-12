package co.yixiang.modules.shop.domain;
import com.baomidou.mybatisplus.annotation.TableField;
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
@Entity
@Data
@Table(name="yx_store_order_cart_info")
public class YxStoreOrderCartInfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;


    /** 订单id */
    @Column(name = "oid",nullable = false)
    @NotNull
    private Integer oid;


    /** 购物车id */
    @Column(name = "cart_id",nullable = false)
    @NotNull
    private Integer cartId;


    /** 商品ID */
    @Column(name = "product_id",nullable = false)
    @NotNull
    private Integer productId;


    /** 购买东西的详细信息 */
    @Column(name = "cart_info",nullable = false)
    @NotBlank
    private String cartInfo;


    /** 唯一id */
        @TableField(value = "`unique`")
    @NotBlank
    private String unique;


    public void copy(YxStoreOrderCartInfo source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
