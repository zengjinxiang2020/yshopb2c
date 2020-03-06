package co.yixiang.modules.shop.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import co.yixiang.modules.shop.entity.YxSystemStore;
import co.yixiang.modules.shop.web.param.YxSystemStoreQueryParam;
import co.yixiang.modules.shop.web.vo.YxSystemStoreQueryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

/**
 * <p>
 * 门店自提 Mapper 接口
 * </p>
 *
 * @author hupeng
 * @since 2020-03-04
 */
@Repository
public interface YxSystemStoreMapper extends BaseMapper<YxSystemStore> {

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxSystemStoreQueryVo getYxSystemStoreById(Serializable id);

    /**
     * 获取分页对象
     * @param page
     * @param yxSystemStoreQueryParam
     * @return
     */
    IPage<YxSystemStoreQueryVo> getYxSystemStorePageList(@Param("page") Page page, @Param("param") YxSystemStoreQueryParam yxSystemStoreQueryParam);

}
