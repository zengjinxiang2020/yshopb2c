package co.yixiang.modules.shop.service.impl;

import co.yixiang.enums.CommonEnum;
import co.yixiang.modules.shop.entity.YxSystemStore;
import co.yixiang.modules.shop.mapper.YxSystemStoreMapper;
import co.yixiang.modules.shop.mapping.SystemStoreMap;
import co.yixiang.modules.shop.service.YxSystemStoreService;
import co.yixiang.modules.shop.web.param.YxSystemStoreQueryParam;
import co.yixiang.modules.shop.web.vo.YxSystemStoreQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.utils.RedisUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;


/**
 * <p>
 * 门店自提 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2020-03-04
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxSystemStoreServiceImpl extends BaseServiceImpl<YxSystemStoreMapper, YxSystemStore> implements YxSystemStoreService {

    @Autowired
    private YxSystemStoreMapper yxSystemStoreMapper;

    @Autowired
    private SystemStoreMap storeMap;

    @Override
    public YxSystemStoreQueryVo getStoreInfo() {
        YxSystemStore systemStore = new YxSystemStore();
        systemStore.setIsDel(CommonEnum.DEL_STATUS_0.getValue());
        systemStore.setIsShow(CommonEnum.SHOW_STATUS_1.getValue());
        YxSystemStore yxSystemStore = yxSystemStoreMapper.selectOne(
                Wrappers
                .query(systemStore)
                .orderByDesc("id")
                .last("limit 1"));
        if(yxSystemStore == null) return null;
        String mention = RedisUtil.get("store_self_mention");
        if(mention == null || Integer.valueOf(mention) == 2) return null;
        return storeMap.toDto(yxSystemStore);
    }

    @Override
    public YxSystemStoreQueryVo getYxSystemStoreById(Serializable id) throws Exception{
        return yxSystemStoreMapper.getYxSystemStoreById(id);
    }

    @Override
    public Paging<YxSystemStoreQueryVo> getYxSystemStorePageList(YxSystemStoreQueryParam yxSystemStoreQueryParam) throws Exception{
        Page page = setPageParam(yxSystemStoreQueryParam,OrderItem.desc("create_time"));
        IPage<YxSystemStoreQueryVo> iPage = yxSystemStoreMapper.getYxSystemStorePageList(page,yxSystemStoreQueryParam);
        return new Paging(iPage);
    }

}
