/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.system.service;

import co.yixiang.modules.system.domain.DictDetail;
import co.yixiang.modules.system.service.dto.DictDetailDTO;
import co.yixiang.modules.system.service.dto.DictDetailQueryCriteria;
import org.springframework.data.domain.Pageable;
import java.util.Map;

/**
* @author hupeng
* @date 2019-04-10
*/
public interface DictDetailService {

    /**
     * 根据ID查询
     * @param id /
     * @return /
     */
    DictDetailDTO findById(Long id);

    /**
     * 创建
     * @param resources /
     * @return /
     */
    DictDetailDTO create(DictDetail resources);

    /**
     * 编辑
     * @param resources /
     */
    void update(DictDetail resources);

    /**
     * 删除
     * @param id /
     */
    void delete(Long id);

    /**
     * 分页查询
     * @param criteria 条件
     * @param pageable 分页参数
     * @return /
     */
    Map<String,Object> queryAll(DictDetailQueryCriteria criteria, Pageable pageable);
}
