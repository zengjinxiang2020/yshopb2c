package co.yixiang.modules.user.service;

import co.yixiang.modules.user.entity.YxUserLevel;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.user.web.dto.UserLevelInfoDTO;
import co.yixiang.modules.user.web.param.YxUserLevelQueryParam;
import co.yixiang.modules.user.web.vo.YxUserLevelQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 用户等级记录表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-12-06
 */
public interface YxUserLevelService extends BaseService<YxUserLevel> {

    void setUserLevel(int uid,int levelId);

    void setLevelComplete(int uid);

    UserLevelInfoDTO getUserLevelInfo(int id);

    int getUserLevel(int uid,int grade);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxUserLevelQueryVo getYxUserLevelById(Serializable id) throws Exception;

    /**
     * 获取分页对象
     * @param yxUserLevelQueryParam
     * @return
     */
    Paging<YxUserLevelQueryVo> getYxUserLevelPageList(YxUserLevelQueryParam yxUserLevelQueryParam) throws Exception;

}
