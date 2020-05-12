package co.yixiang.mp.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.mp.domain.YxWechatReply;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
* @author xuwenbo
* @date 2020-05-12
*/
@Repository
@Mapper
public interface YxWechatReplyMapper extends CoreMapper<YxWechatReply> {

}