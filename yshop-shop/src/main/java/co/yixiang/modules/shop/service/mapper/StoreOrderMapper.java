/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.modules.shop.domain.YxStoreOrder;
import co.yixiang.modules.shop.service.dto.ChartDataDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* @author hupeng
* @date 2020-05-12
*/
@Repository
@Mapper
public interface StoreOrderMapper extends CoreMapper<YxStoreOrder> {

// todo   Integer countByPayTimeGreaterThanEqual(int today);
//
//   todo  Integer countByPayTimeLessThanAndPayTimeGreaterThanEqual(int today, int yesterday);
    @Select( "select IFNULL(sum(pay_price),0)  from yx_store_order " +
            "where refund_status=0 and is_del=0 and paid=1")
    Double sumTotalPrice();

    @Select("SELECT IFNULL(sum(pay_price),0) as num," +
            "FROM_UNIXTIME(add_time, '%m-%d') as time " +
            " FROM yx_store_order where refund_status=0 and is_del=0 and paid=1 and pay_time >= ${time}" +
            " GROUP BY FROM_UNIXTIME(add_time,'%Y-%m-%d') " +
            " ORDER BY add_time ASC")
    List<ChartDataDTO> chartList(@Param("time") int time);
    @Select("SELECT count(id) as num," +
            "FROM_UNIXTIME(add_time, '%m-%d') as time " +
            " FROM yx_store_order where refund_status=0 and is_del=0 and paid=1 and pay_time >= ${time}" +
            " GROUP BY FROM_UNIXTIME(add_time,'%Y-%m-%d') " +
            " ORDER BY add_time ASC")
    List<ChartDataDTO> chartListT(@Param("time")int time);
}
