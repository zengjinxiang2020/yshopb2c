package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.entity.YxStoreCategory;
import co.yixiang.modules.shop.mapper.YxStoreCategoryMapper;
import co.yixiang.modules.shop.mapping.CategoryMap;
import co.yixiang.modules.shop.service.YxStoreCategoryService;
import co.yixiang.modules.shop.web.param.YxStoreCategoryQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCategoryQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.utils.CateDTO;
import co.yixiang.utils.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;
import java.util.List;


/**
 * <p>
 * 商品分类表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-22
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreCategoryServiceImpl extends BaseServiceImpl<YxStoreCategoryMapper, YxStoreCategory> implements YxStoreCategoryService {

    @Autowired
    private YxStoreCategoryMapper yxStoreCategoryMapper;

    @Autowired
    private CategoryMap categoryMap;

    @Override
    public YxStoreCategoryQueryVo getYxStoreCategoryById(Serializable id) throws Exception{
        return yxStoreCategoryMapper.getYxStoreCategoryById(id);
    }

    @Override
    public List<CateDTO> getList() {
        QueryWrapper<YxStoreCategory> wrapper = new QueryWrapper<>();
        wrapper.eq("is_show",1).orderByAsc("sort");
        List<CateDTO> list = categoryMap.toDto(baseMapper.selectList(wrapper));
        return TreeUtil.list2TreeConverter(list,0);
    }

    @Override
    public List<String> getAllChilds(int catid) {
        QueryWrapper<YxStoreCategory> wrapper = new QueryWrapper<>();
        wrapper.eq("is_show",1).eq("id",catid);

        List<CateDTO> list = categoryMap.toDto(baseMapper.selectList(wrapper));

        System.out.println(TreeUtil.getChildList(list,new CateDTO()));
        return null;
    }
}
