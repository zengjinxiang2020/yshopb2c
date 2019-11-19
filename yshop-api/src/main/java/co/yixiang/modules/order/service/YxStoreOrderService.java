package co.yixiang.modules.order.service;

import co.yixiang.modules.order.entity.YxStoreOrder;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.order.web.dto.*;
import co.yixiang.modules.order.web.param.OrderParam;
import co.yixiang.modules.order.web.param.RefundParam;
import co.yixiang.modules.order.web.param.YxStoreOrderQueryParam;
import co.yixiang.modules.order.web.vo.YxStoreOrderQueryVo;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;
import com.github.binarywang.wxpay.bean.order.WxPayMpOrderResult;
import com.github.binarywang.wxpay.exception.WxPayException;


import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
public interface YxStoreOrderService extends BaseService<YxStoreOrder> {

    void regressionCoupon(YxStoreOrderQueryVo order);

    void regressionStock(YxStoreOrderQueryVo order);

    void regressionIntegral(YxStoreOrderQueryVo order);

    void cancelOrder(String orderId,int uid);

    void cancelOrderByTask(int id);

    void orderApplyRefund(RefundParam param,int uid);

    void removeOrder(String orderId,int uid);

    void gainUserIntegral(YxStoreOrderQueryVo order);

    void takeOrder(String orderId,int uid);

    List<YxStoreOrderQueryVo> orderList(int uid,int type,int page,int limit);

    OrderCountDTO orderData(int uid);

    YxStoreOrderQueryVo handleOrder(YxStoreOrderQueryVo order);

    void paySuccess(String orderId,String payType);

    void yuePay(String orderId,int uid);

    WxPayMpOrderResult wxPay(String orderId) throws WxPayException;

    void delCacheOrderInfo(int uid, String key);

    YxStoreOrder createOrder(int uid, String key, OrderParam param);

    ComputeDTO computedOrder(int uid, String key, int couponId,
                             int useIntegral, int shippingType);

    YxStoreOrderQueryVo getOrderInfo(String unique,int uid);

    String cacheOrderInfo(int uid,List<YxStoreCartQueryVo> cartInfo,
                          PriceGroupDTO priceGroup,OtherDTO other);

    CacheDTO getCacheOrderInfo(int uid, String key);

    PriceGroupDTO getOrderPriceGroup(List<YxStoreCartQueryVo> cartInfo);

    Double getOrderSumPrice(List<YxStoreCartQueryVo> cartInfo,String key);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxStoreOrderQueryVo getYxStoreOrderById(Serializable id) throws Exception;

    /**
     * 获取分页对象
     * @param yxStoreOrderQueryParam
     * @return
     */
    Paging<YxStoreOrderQueryVo> getYxStoreOrderPageList(YxStoreOrderQueryParam yxStoreOrderQueryParam) throws Exception;

}
