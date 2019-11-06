package co.yixiang.modules.order.service.impl;

import co.yixiang.modules.order.entity.YxStoreOrderStatus;
import co.yixiang.modules.order.mapper.YxStoreOrderStatusMapper;
import co.yixiang.modules.order.service.YxStoreOrderStatusService;
import co.yixiang.modules.order.web.param.YxStoreOrderStatusQueryParam;
import co.yixiang.modules.order.web.vo.YxStoreOrderStatusQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.utils.OrderUtil;
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
 * 订单操作记录表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreOrderStatusServiceImpl extends BaseServiceImpl<YxStoreOrderStatusMapper, YxStoreOrderStatus> implements YxStoreOrderStatusService {

    @Autowired
    private YxStoreOrderStatusMapper yxStoreOrderStatusMapper;

    @Override
    public void create(int oid, String changetype, String changeMessage) {
        YxStoreOrderStatus storeOrderStatus = new YxStoreOrderStatus();
        storeOrderStatus.setOid(oid);
        storeOrderStatus.setChangeType(changetype);
        storeOrderStatus.setChangeMessage(changeMessage);
        storeOrderStatus.setChangeTime(OrderUtil.getSecondTimestampTwo());

        yxStoreOrderStatusMapper.insert(storeOrderStatus);
    }
}
