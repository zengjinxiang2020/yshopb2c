package co.yixiang.modules.order.web.dto;

import co.yixiang.modules.shop.web.vo.YxStoreProductQueryVo;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 订单商品对象
 * </p>
 *
 * @author hupeng
 * @date 2019-11-03
 */
@Data
public class OrderCartInfoDTO implements Serializable {
    private static final long serialVersionUID = 1L;


    private String orderId;


    private Integer productId;


    private Integer cartNum;


    private Integer combinationId;

    private Integer seckillId;

    private Integer bargainId;

    private ProductDTO productInfo;




}