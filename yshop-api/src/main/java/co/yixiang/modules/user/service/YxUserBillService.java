package co.yixiang.modules.user.service;

import co.yixiang.modules.user.entity.YxUserBill;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.user.web.param.YxUserBillQueryParam;
import co.yixiang.modules.user.web.vo.YxUserBillQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 用户账单表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
public interface YxUserBillService extends BaseService<YxUserBill> {

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxUserBillQueryVo getYxUserBillById(Serializable id) throws Exception;

    /**
     * 获取分页对象
     * @param yxUserBillQueryParam
     * @return
     */
    Paging<YxUserBillQueryVo> getYxUserBillPageList(YxUserBillQueryParam yxUserBillQueryParam) throws Exception;

}
