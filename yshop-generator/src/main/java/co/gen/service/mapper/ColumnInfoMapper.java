package co.gen.service.mapper;

import co.gen.domain.ColumnConfig;
import co.yixiang.common.mapper.CoreMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ColumnInfoMapper extends CoreMapper<ColumnConfig> {
}
