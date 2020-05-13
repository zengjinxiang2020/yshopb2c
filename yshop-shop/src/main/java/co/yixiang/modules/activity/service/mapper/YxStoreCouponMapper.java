package co.yixiang.modules.activity.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.modules.activity.domain.YxStoreCoupon;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
* @author xuwenbo
* @date 2020-05-13
*/
@Repository
@Mapper
public interface YxStoreCouponMapper extends CoreMapper<YxStoreCoupon> {

}