package co.yixiang.modules.user.service;

import co.yixiang.modules.user.entity.YxWechatUser;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.user.web.param.YxWechatUserQueryParam;
import co.yixiang.modules.user.web.vo.YxWechatUserQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 微信用户表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
public interface YxWechatUserService extends BaseService<YxWechatUser> {

    YxWechatUser getUserInfo(String openid);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxWechatUserQueryVo getYxWechatUserById(Serializable id);

    /**
     * 获取分页对象
     * @param yxWechatUserQueryParam
     * @return
     */
    Paging<YxWechatUserQueryVo> getYxWechatUserPageList(YxWechatUserQueryParam yxWechatUserQueryParam) throws Exception;

}
