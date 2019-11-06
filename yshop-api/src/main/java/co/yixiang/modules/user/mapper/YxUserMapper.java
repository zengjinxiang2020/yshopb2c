package co.yixiang.modules.user.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.web.param.YxUserQueryParam;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author hupeng
 * @since 2019-10-16
 */
@Repository
public interface YxUserMapper extends BaseMapper<YxUser> {

    @Update("update yx_user set now_money=now_money-#{payPrice}" +
            " where uid=#{uid}")
    int decPrice(@Param("payPrice") double payPrice,@Param("uid") int uid);

    @Update("update yx_user set pay_count=pay_count+1" +
            " where uid=#{uid}")
    int incPayCount(@Param("uid") int uid);


    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxUserQueryVo getYxUserById(Serializable id);

    /**
     * 获取分页对象
     * @param page
     * @param yxUserQueryParam
     * @return
     */
    IPage<YxUserQueryVo> getYxUserPageList(@Param("page") Page page, @Param("param") YxUserQueryParam yxUserQueryParam);

}
