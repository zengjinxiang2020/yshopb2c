package co.yixiang.modules.user.service;

import co.yixiang.modules.order.web.vo.YxStoreOrderQueryVo;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.common.service.BaseService;
import co.yixiang.modules.user.web.dto.PromUserDTO;
import co.yixiang.modules.user.web.dto.UserRankDTO;
import co.yixiang.modules.user.web.param.PromParam;
import co.yixiang.modules.user.web.param.YxUserQueryParam;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import co.yixiang.common.web.vo.Paging;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-16
 */
public interface YxUserService extends BaseService<YxUser> {

    void incIntegral(int uid,double integral);

    YxUserQueryVo getNewYxUserById(Serializable id);
    boolean backOrderBrokerage(YxStoreOrderQueryVo order);

    boolean backOrderBrokerageTwo(YxStoreOrderQueryVo order);

    void setUserSpreadCount(int uid);

    int getSpreadCount(int uid,int type);

    List<PromUserDTO> getUserSpreadGrade(PromParam promParam,int uid);

    boolean setSpread(int spread,int uid);

    void decIntegral(int uid,double integral);

    void incPayCount(int uid);

    void decPrice(int uid,double payPrice);

    YxUser findByName(String name);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxUserQueryVo getYxUserById(Serializable id);

    /**
     * 获取分页对象
     * @param yxUserQueryParam
     * @return
     */
    Paging<YxUserQueryVo> getYxUserPageList(YxUserQueryParam yxUserQueryParam) throws Exception;

}
