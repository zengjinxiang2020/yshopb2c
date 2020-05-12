package ${package}.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import ${package}.domain.${className};
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
* @author ${author}
* @date ${date}
*/
@Repository
@Mapper
public interface ${className}Mapper extends CoreMapper<${className}> {

}