package co.yixiang.modules.shop.web.dto;

import co.yixiang.common.web.param.QueryParam;
import co.yixiang.modules.shop.entity.YxStoreProductAttrValue;
import co.yixiang.modules.shop.web.vo.YxStoreProductAttrQueryVo;
import co.yixiang.modules.shop.web.vo.YxStoreProductQueryVo;
import co.yixiang.modules.shop.web.vo.YxStoreProductReplyQueryVo;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.*;

/**
 * <p>
 * 商品dto
 * </p>
 *
 * @author hupeng
 * @date 2019-10-23
 */
@Data
@EqualsAndHashCode(callSuper = true)

public class ProductDTO extends QueryParam {
    private static final long serialVersionUID = 1L;

    //todo
    private List<YxStoreProductQueryVo> goodList = new ArrayList();

    //todo
    private String mapKay = "";

    //todo
    private Integer merId = 0;

    private String priceName = "";

    private List<YxStoreProductAttrQueryVo> productAttr = new ArrayList();

    private Map<String, YxStoreProductAttrValue>  productValue = new LinkedHashMap<>();

    private YxStoreProductReplyQueryVo reply;

    private String replyChance;

    private Integer replyCount = 0;

    //todo
    private List similarity = new ArrayList();

    private YxStoreProductQueryVo storeInfo;

    //todo
    private Map system_store = new LinkedHashMap<>();

    private Integer uid = 0;

}
