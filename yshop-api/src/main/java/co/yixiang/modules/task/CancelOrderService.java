package co.yixiang.modules.task;

import cn.hutool.core.util.ObjectUtil;
import co.yixiang.modules.order.entity.YxStoreOrder;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.redisson.DelayJob;
import co.yixiang.redisson.ExecuteJob;
import co.yixiang.utils.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;


@Component
@Slf4j
public class CancelOrderService implements ExecuteJob {
    @Override
    public void execute(DelayJob job) {
        log.info("系统开始处理延时任务---订单超时未付款---" + job.getOderId());

        YxStoreOrderService yxorderService = BeanUtil.getBean(YxStoreOrderService.class);

        YxStoreOrder order = null;
        try {
            order = yxorderService.getOne(new QueryWrapper<YxStoreOrder>().eq("id", job.getOderId()).eq("is_del",0));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(ObjectUtil.isNull(order)) {
            return;
        }
        if(order.getPaid() != 0){
            return;
        }
        yxorderService.cancelOrderByTask(job.getOderId());
        log.info("系统结束处理延时任务---订单超时未付款取消---" + job.getOderId());
    }
}
