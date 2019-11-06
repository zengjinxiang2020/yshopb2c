package co.yixiang.modules.shop.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import co.yixiang.modules.shop.entity.YxStoreCouponIssue;
import co.yixiang.modules.shop.web.param.YxStoreCouponIssueQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCouponIssueQueryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * <p>
 * 优惠券前台领取表 Mapper 接口
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Repository
public interface YxStoreCouponIssueMapper extends BaseMapper<YxStoreCouponIssue> {

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxStoreCouponIssueQueryVo getYxStoreCouponIssueById(Serializable id);

    /**
     * 获取分页对象
     * @param page
     * @param yxStoreCouponIssueQueryParam
     * @return
     */
    IPage<YxStoreCouponIssueQueryVo> getYxStoreCouponIssuePageList(@Param("page") Page page, @Param("param") YxStoreCouponIssueQueryParam yxStoreCouponIssueQueryParam);

}
