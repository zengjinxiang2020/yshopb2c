/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.product.service;

import co.yixiang.common.service.BaseService;
import co.yixiang.modules.product.domain.YxStoreProductAttr;
import co.yixiang.modules.product.domain.YxStoreProductAttrValue;

import java.util.Map;


/**
* @author hupeng
* @date 2020-05-12
*/
public interface YxStoreProductAttrService  extends BaseService<YxStoreProductAttr>{

    /**
     * 增加库存减去销量
     * @param num 数量
     * @param productId 商品id
     * @param unique sku唯一值
     */
    void incProductAttrStock(Integer num, Long productId, String unique);

    /**
     * 减少库存增加销量
     * @param num 数量
     * @param productId 商品id
     * @param unique sku唯一值
     */
    void decProductAttrStock(int num, Long productId, String unique);

    int uniqueByStock(String unique);

    YxStoreProductAttrValue uniqueByAttrInfo(String unique);

    Map<String, Object> getProductAttrDetail(long productId, long uid, int type);
}
