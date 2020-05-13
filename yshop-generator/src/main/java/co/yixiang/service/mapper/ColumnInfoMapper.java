package co.yixiang.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.domain.ColumnConfig;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ColumnInfoMapper extends CoreMapper<ColumnConfig> {
}
