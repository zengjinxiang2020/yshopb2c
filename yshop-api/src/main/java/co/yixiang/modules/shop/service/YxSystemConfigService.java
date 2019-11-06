package co.yixiang.modules.shop.service;

import co.yixiang.modules.shop.entity.YxSystemConfig;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.shop.web.param.YxSystemConfigQueryParam;
import co.yixiang.modules.shop.web.vo.YxSystemConfigQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 配置表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-19
 */
public interface YxSystemConfigService extends BaseService<YxSystemConfig> {

    String getData(String name);
}
