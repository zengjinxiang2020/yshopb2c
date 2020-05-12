package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.domain.YxStoreProductAttrResult;
import co.yixiang.common.service.impl.BaseServiceImpl;
import lombok.AllArgsConstructor;
import co.yixiang.dozer.service.IGenerator;
import com.github.pagehelper.PageInfo;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.utils.FileUtil;
import co.yixiang.modules.shop.service.YxStoreProductAttrResultService;
import co.yixiang.modules.shop.service.mapper.YxStoreProductAttrResultMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
* @author hupeng
* @date 2020-05-12
*/
@Service
@AllArgsConstructor
//@CacheConfig(cacheNames = "yxStoreProductAttrResult")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxStoreProductAttrResultServiceImpl extends BaseServiceImpl<YxStoreProductAttrResultMapper, YxStoreProductAttrResult> implements YxStoreProductAttrResultService {



}
