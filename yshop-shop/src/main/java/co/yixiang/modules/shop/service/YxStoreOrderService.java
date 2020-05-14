/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.shop.domain.YxStoreOrder;
import co.yixiang.modules.shop.service.dto.OrderCountDto;
import co.yixiang.modules.shop.service.dto.OrderTimeDataDTO;
import co.yixiang.modules.shop.service.dto.YxStoreOrderDto;
import co.yixiang.modules.shop.service.dto.YxStoreOrderQueryCriteria;
import org.springframework.data.domain.Pageable;
import java.util.Map;
import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

/**
* @author hupeng
* @date 2020-05-12
*/
public interface YxStoreOrderService  extends BaseService<YxStoreOrder>{

/**
    * 查询数据分页
    * @param criteria 条件
    * @param pageable 分页参数
    * @return Map<String,Object>
    */
    Map<String,Object> queryAll(YxStoreOrderQueryCriteria criteria, Pageable pageable);

    /**
    * 查询所有数据不分页
    * @param criteria 条件参数
    * @return List<YxStoreOrderDto>
    */
    List<YxStoreOrder> queryAll(YxStoreOrderQueryCriteria criteria);


    YxStoreOrderDto create(YxStoreOrder resources);

    void update(YxStoreOrder resources);
    /**
    * 导出数据
    * @param all 待导出的数据
    * @param response /
    * @throws IOException /
    */
    void download(List<YxStoreOrderDto> all, HttpServletResponse response) throws IOException;


    Map<String,Object> queryAll(List<String> ids);


    String orderType(int id,int pinkId, int combinationId,int seckillId,
                     int bargainId,int shippingType);

    void refund(YxStoreOrder resources);

    OrderCountDto getOrderCount();

    OrderTimeDataDTO getOrderTimeData();

    Map<String,Object> chartCount();
}
