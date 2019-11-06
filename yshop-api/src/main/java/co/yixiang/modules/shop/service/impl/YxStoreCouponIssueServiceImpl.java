package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.entity.YxStoreCouponIssue;
import co.yixiang.modules.shop.mapper.YxStoreCouponIssueMapper;
import co.yixiang.modules.shop.service.YxStoreCouponIssueService;
import co.yixiang.modules.shop.web.param.YxStoreCouponIssueQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCouponIssueQueryVo;
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
 * 优惠券前台领取表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreCouponIssueServiceImpl extends BaseServiceImpl<YxStoreCouponIssueMapper, YxStoreCouponIssue> implements YxStoreCouponIssueService {

    @Autowired
    private YxStoreCouponIssueMapper yxStoreCouponIssueMapper;

    @Override
    public YxStoreCouponIssueQueryVo getYxStoreCouponIssueById(Serializable id) throws Exception{
        return yxStoreCouponIssueMapper.getYxStoreCouponIssueById(id);
    }

    @Override
    public Paging<YxStoreCouponIssueQueryVo> getYxStoreCouponIssuePageList(YxStoreCouponIssueQueryParam yxStoreCouponIssueQueryParam) throws Exception{
        Page page = setPageParam(yxStoreCouponIssueQueryParam,OrderItem.desc("create_time"));
        IPage<YxStoreCouponIssueQueryVo> iPage = yxStoreCouponIssueMapper.getYxStoreCouponIssuePageList(page,yxStoreCouponIssueQueryParam);
        return new Paging(iPage);
    }

}
