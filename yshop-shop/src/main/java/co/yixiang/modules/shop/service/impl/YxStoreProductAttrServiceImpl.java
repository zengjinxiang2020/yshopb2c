/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.domain.YxStoreProductAttr;
import co.yixiang.common.service.impl.BaseServiceImpl;
import lombok.AllArgsConstructor;
import co.yixiang.modules.shop.service.YxStoreProductAttrService;
import co.yixiang.modules.shop.service.mapper.StoreProductAttrMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;


/**
* @author hupeng
* @date 2020-05-12
*/
@Service
@AllArgsConstructor
//@CacheConfig(cacheNames = "yxStoreProductAttr")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxStoreProductAttrServiceImpl extends BaseServiceImpl<StoreProductAttrMapper, YxStoreProductAttr> implements YxStoreProductAttrService {


}
