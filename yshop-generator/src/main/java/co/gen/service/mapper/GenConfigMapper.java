package co.gen.service.mapper;

import co.gen.domain.GenConfig;
import co.yixiang.common.mapper.CoreMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface GenConfigMapper extends CoreMapper<GenConfig> {
}
