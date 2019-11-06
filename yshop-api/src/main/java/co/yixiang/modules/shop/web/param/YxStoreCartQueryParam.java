package co.yixiang.modules.shop.web.param;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import co.yixiang.common.web.param.QueryParam;

/**
 * <p>
 * 购物车表 查询参数对象
 * </p>
 *
 * @author hupeng
 * @date 2019-10-25
 */
@Data
@ApiModel(value="YxStoreCartQueryParam对象", description="购物车表查询参数")
public class YxStoreCartQueryParam  {
    private static final long serialVersionUID = 1L;

}
