/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
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
