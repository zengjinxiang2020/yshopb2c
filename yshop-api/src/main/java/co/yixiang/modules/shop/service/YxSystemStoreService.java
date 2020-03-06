package co.yixiang.modules.shop.service;

import co.yixiang.modules.shop.entity.YxSystemStore;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.shop.web.param.YxSystemStoreQueryParam;
import co.yixiang.modules.shop.web.vo.YxSystemStoreQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 门店自提 服务类
 * </p>
 *
 * @author hupeng
 * @since 2020-03-04
 */
public interface YxSystemStoreService extends BaseService<YxSystemStore> {

    YxSystemStoreQueryVo getStoreInfo();

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxSystemStoreQueryVo getYxSystemStoreById(Serializable id) throws Exception;

    /**
     * 获取分页对象
     * @param yxSystemStoreQueryParam
     * @return
     */
    Paging<YxSystemStoreQueryVo> getYxSystemStorePageList(YxSystemStoreQueryParam yxSystemStoreQueryParam) throws Exception;

}
