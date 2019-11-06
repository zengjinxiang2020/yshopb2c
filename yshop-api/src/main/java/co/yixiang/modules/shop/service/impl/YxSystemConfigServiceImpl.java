package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.entity.YxSystemConfig;
import co.yixiang.modules.shop.mapper.YxSystemConfigMapper;
import co.yixiang.modules.shop.service.YxSystemConfigService;
import co.yixiang.modules.shop.web.param.YxSystemConfigQueryParam;
import co.yixiang.modules.shop.web.vo.YxSystemConfigQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
 * 配置表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-19
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxSystemConfigServiceImpl extends BaseServiceImpl<YxSystemConfigMapper, YxSystemConfig> implements YxSystemConfigService {

    @Autowired
    private YxSystemConfigMapper yxSystemConfigMapper;

    @Override
    public String getData(String name) {
        QueryWrapper<YxSystemConfig> wrapper = new QueryWrapper<>();
        wrapper.eq("menu_name",name);
        return yxSystemConfigMapper.selectOne(wrapper).getValue();
    }
}
