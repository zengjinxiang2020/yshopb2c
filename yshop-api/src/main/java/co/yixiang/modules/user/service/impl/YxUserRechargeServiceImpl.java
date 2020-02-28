/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.user.service.impl;

import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.user.entity.YxUserRecharge;
import co.yixiang.modules.user.mapper.YxUserRechargeMapper;
import co.yixiang.modules.user.service.YxUserRechargeService;
import co.yixiang.modules.user.web.param.RechargeParam;
import co.yixiang.modules.user.web.param.YxUserRechargeQueryParam;
import co.yixiang.modules.user.web.vo.YxUserRechargeQueryVo;
import co.yixiang.utils.OrderUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * <p>
 * 用户充值表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-12-08
 */
@Slf4j
@Service
@AllArgsConstructor
@Transactional(rollbackFor = Exception.class)
public class YxUserRechargeServiceImpl extends BaseServiceImpl<YxUserRechargeMapper, YxUserRecharge> implements YxUserRechargeService {

    private final YxUserRechargeMapper yxUserRechargeMapper;


    /**
     * 充值(废弃掉)
     * @param param
     */
    @Override
    public void addRecharge(RechargeParam param,int uid) {
        YxUserRecharge yxUserRecharge = new YxUserRecharge();
        String orderId = "re_"+OrderUtil.orderSn();
        yxUserRecharge.setOrderId(orderId);
        yxUserRecharge.setUid(uid);
        yxUserRecharge.setPrice(BigDecimal.valueOf(param.getPrice()));
        yxUserRecharge.setRechargeType("weixin");
        yxUserRecharge.setPaid(0);
        yxUserRecharge.setAddTime(OrderUtil.getSecondTimestampTwo());

        yxUserRechargeMapper.insert(yxUserRecharge);

    }

    @Override
    public YxUserRechargeQueryVo getYxUserRechargeById(Serializable id) throws Exception{
        return yxUserRechargeMapper.getYxUserRechargeById(id);
    }

    @Override
    public Paging<YxUserRechargeQueryVo> getYxUserRechargePageList(YxUserRechargeQueryParam yxUserRechargeQueryParam) throws Exception{
        Page page = setPageParam(yxUserRechargeQueryParam,OrderItem.desc("create_time"));
        IPage<YxUserRechargeQueryVo> iPage = yxUserRechargeMapper.getYxUserRechargePageList(page,yxUserRechargeQueryParam);
        return new Paging(iPage);
    }

}
