package co.yixiang.modules.shop.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.modules.shop.domain.YxUserBill;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
* @author hupeng
* @date 2020-05-12
*/
@Repository
@Mapper
public interface YxUserBillMapper extends CoreMapper<YxUserBill> {

}