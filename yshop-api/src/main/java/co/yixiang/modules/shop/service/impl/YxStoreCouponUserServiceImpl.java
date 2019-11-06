package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.entity.YxStoreCouponUser;
import co.yixiang.modules.shop.mapper.YxStoreCouponUserMapper;
import co.yixiang.modules.shop.service.YxStoreCouponUserService;
import co.yixiang.modules.shop.web.param.YxStoreCouponUserQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCouponUserQueryVo;
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
 * 优惠券发放记录表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreCouponUserServiceImpl extends BaseServiceImpl<YxStoreCouponUserMapper, YxStoreCouponUser> implements YxStoreCouponUserService {

    @Autowired
    private YxStoreCouponUserMapper yxStoreCouponUserMapper;

    @Override
    public YxStoreCouponUserQueryVo getYxStoreCouponUserById(Serializable id) throws Exception{
        return yxStoreCouponUserMapper.getYxStoreCouponUserById(id);
    }

    @Override
    public Paging<YxStoreCouponUserQueryVo> getYxStoreCouponUserPageList(YxStoreCouponUserQueryParam yxStoreCouponUserQueryParam) throws Exception{
        Page page = setPageParam(yxStoreCouponUserQueryParam,OrderItem.desc("create_time"));
        IPage<YxStoreCouponUserQueryVo> iPage = yxStoreCouponUserMapper.getYxStoreCouponUserPageList(page,yxStoreCouponUserQueryParam);
        return new Paging(iPage);
    }

}
