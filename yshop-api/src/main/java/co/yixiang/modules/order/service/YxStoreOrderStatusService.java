package co.yixiang.modules.order.service;

import co.yixiang.modules.order.entity.YxStoreOrderStatus;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.order.web.param.YxStoreOrderStatusQueryParam;
import co.yixiang.modules.order.web.vo.YxStoreOrderStatusQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 订单操作记录表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
public interface YxStoreOrderStatusService extends BaseService<YxStoreOrderStatus> {

   void create(int oid,String changetype,String changeMessage);
}
