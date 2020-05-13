package co.yixiang.service.mapper;


import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.domain.AlipayConfig;
import co.yixiang.domain.VerificationCode;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface VerificationCodeMapper extends CoreMapper<VerificationCode> {

}
