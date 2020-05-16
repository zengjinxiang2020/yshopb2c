/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.gen.service.impl;

import co.yixiang.gen.service.mapper.GenConfigMapper;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.gen.domain.GenConfig;
import co.yixiang.gen.service.GenConfigService;
import co.yixiang.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.stereotype.Service;
import java.io.File;

/**
 * @author Zheng Jie
 * @date 2019-01-14
 */
@Service
//@CacheConfig(cacheNames = "genConfig")
public class GenConfigServiceImpl extends BaseServiceImpl<GenConfigMapper, GenConfig> implements GenConfigService {

    @Override
//    @Cacheable(key = "#p0")
    public GenConfig find(String tableName) {
        GenConfig genConfig = this.getOne(new QueryWrapper<GenConfig>().eq("table_name",tableName));
        if(genConfig == null){
            return new GenConfig(tableName);
        }
        return genConfig;
    }

    @Override
//    @CachePut(key = "#p0")
    public GenConfig update(String tableName, GenConfig genConfig) {
        // 如果 api 路径为空，则自动生成路径
        if(StringUtils.isBlank(genConfig.getApiPath())){
            String separator = File.separator;
            String[] paths;
            String symbol = "\\";
            if (symbol.equals(separator)) {
                paths = genConfig.getPath().split("\\\\");
            } else {
                paths = genConfig.getPath().split(File.separator);
            }
            StringBuilder api = new StringBuilder();
            for (String path : paths) {
                api.append(path);
                api.append(separator);
                if ("src".equals(path)) {
                    api.append("api");
                    break;
                }
            }
            genConfig.setApiPath(api.toString());
        }
        this.saveOrUpdate(genConfig);
        return genConfig;
    }
}
