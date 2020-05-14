/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.logging.service.mapper;

import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.logging.domain.Log;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * @author hupeng
 * @date 2019-5-22
 */
@Repository
@Mapper
public interface LogMapper extends CoreMapper<Log> {

    @Delete("delete from log where log_type = #{logType}")
    void deleteByLogType(@Param("logType") String logType);
    @Select("\"select l.id,l.create_time as createTime,l.description,\" +\n" +
            "                    \"l.request_ip as requestIp,l.address,\" +\n" +
            "                    \"u.nickname from log l left join yx_user u on u.uid=l.uid \" +\n" +
            "                    \" where l.type=1\" +\n" +
            "                    \" and if(#{nickname} !='',u.nickname LIKE CONCAT('%',#{nickname},'%'),1=1) order by l.id desc\"")
    List<Log> findAllByPageable(@Param("nickname") String nickname);
    @Select( "select count(*) FROM (select request_ip FROM log where create_time between #{date1} and #{date2} GROUP BY request_ip) as s")
    long findIp(@Param("date1") String date1, @Param("date2")String date2);
}
