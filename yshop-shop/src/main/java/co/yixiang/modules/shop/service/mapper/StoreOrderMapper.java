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
