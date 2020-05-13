package co.yixiang.modules.shop.service.dto;

import lombok.Data;
import java.util.List;
import co.yixiang.annotation.Query;

/**
* @author hupeng
* @date 2020-05-12
*/
@Data
public class YxStoreOrderQueryCriteria{

    // 模糊
    @Query(type = Query.Type.UNIX_TIMESTAMP)
    private List<String> addTime;


    // 模糊
    @Query(type = Query.Type.INNER_LIKE)
    private String orderId;

    // 模糊
    @Query(type = Query.Type.INNER_LIKE)
    private String realName;

    // 模糊
    @Query(type = Query.Type.INNER_LIKE)
    private String userPhone;

    @Query
    private Integer paid;

    @Query
    private Integer status;

    @Query
    private Integer refundStatus;

    @Query
    private Integer isDel;

    @Query
    private Integer combinationId;

    @Query
    private Integer seckillId;

    @Query
    private Integer bargainId;

    @Query(propName="combination_id",type = Query.Type.NOT_EQUAL)
    private Integer newCombinationId;

    @Query(propName="seckill_id",type = Query.Type.NOT_EQUAL)
    private Integer newSeckillId;

    @Query(propName="bargain_id",type = Query.Type.NOT_EQUAL)
    private Integer newBargainId;

    @Query
    private Integer shippingType;

    @Query
    private Integer storeId;
}
