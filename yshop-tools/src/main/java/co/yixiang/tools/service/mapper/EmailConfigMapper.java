package co.yixiang.tools.service.mapper;

import co.yixiang.tools.domain.EmailConfig;
import co.yixiang.common.mapper.CoreMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
* @author hupeng
* @date 2020-05-13
*/
@Repository
@Mapper
public interface EmailConfigMapper extends CoreMapper<EmailConfig> {

}
