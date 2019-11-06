package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.entity.YxStoreCouponIssueUser;
import co.yixiang.modules.shop.mapper.YxStoreCouponIssueUserMapper;
import co.yixiang.modules.shop.service.YxStoreCouponIssueUserService;
import co.yixiang.modules.shop.web.param.YxStoreCouponIssueUserQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCouponIssueUserQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;


/**
 * <p>
 * 优惠券前台用户领取记录表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreCouponIssueUserServiceImpl extends BaseServiceImpl<YxStoreCouponIssueUserMapper, YxStoreCouponIssueUser> implements YxStoreCouponIssueUserService {

    @Autowired
    private YxStoreCouponIssueUserMapper yxStoreCouponIssueUserMapper;

    @Override
    public YxStoreCouponIssueUserQueryVo getYxStoreCouponIssueUserById(Serializable id) throws Exception{
        return yxStoreCouponIssueUserMapper.getYxStoreCouponIssueUserById(id);
    }

    @Override
    public Paging<YxStoreCouponIssueUserQueryVo> getYxStoreCouponIssueUserPageList(YxStoreCouponIssueUserQueryParam yxStoreCouponIssueUserQueryParam) throws Exception{
        Page page = setPageParam(yxStoreCouponIssueUserQueryParam,OrderItem.desc("create_time"));
        IPage<YxStoreCouponIssueUserQueryVo> iPage = yxStoreCouponIssueUserMapper.getYxStoreCouponIssueUserPageList(page,yxStoreCouponIssueUserQueryParam);
        return new Paging(iPage);
    }

}
