/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.domain.YxUserBill;
import co.yixiang.common.service.impl.BaseServiceImpl;
import lombok.AllArgsConstructor;
import co.yixiang.dozer.service.IGenerator;
import com.github.pagehelper.PageInfo;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.utils.FileUtil;
import co.yixiang.modules.shop.service.YxUserBillService;
import co.yixiang.modules.shop.service.dto.YxUserBillDto;
import co.yixiang.modules.shop.service.dto.YxUserBillQueryCriteria;
import co.yixiang.modules.shop.service.mapper.UserBillMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.LinkedHashMap;

/**
* @author hupeng
* @date 2020-05-12
*/
@Service
@AllArgsConstructor
//@CacheConfig(cacheNames = "yxUserBill")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxUserBillServiceImpl extends BaseServiceImpl<UserBillMapper, YxUserBill> implements YxUserBillService {

    private final IGenerator generator;

    @Override
    //@Cacheable
    public Map<String, Object> queryAll(YxUserBillQueryCriteria criteria, Pageable pageable) {
        getPage(pageable);
        PageInfo<YxUserBill> page = new PageInfo<>(queryAll(criteria));
        Map<String, Object> map = new LinkedHashMap<>(2);
        map.put("content", generator.convert(page.getList(), YxUserBillDto.class));
        map.put("totalElements", page.getTotal());
        return map;
    }


    @Override
    //@Cacheable
    public List<YxUserBill> queryAll(YxUserBillQueryCriteria criteria){
        return baseMapper.selectList(QueryHelpPlus.getPredicate(YxUserBill.class, criteria));
    }


    @Override
    public void download(List<YxUserBillDto> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (YxUserBillDto yxUserBill : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("用户uid", yxUserBill.getUid());
            map.put("关联id", yxUserBill.getLinkId());
            map.put("0 = 支出 1 = 获得", yxUserBill.getPm());
            map.put("账单标题", yxUserBill.getTitle());
            map.put("明细种类", yxUserBill.getCategory());
            map.put("明细类型", yxUserBill.getType());
            map.put("明细数字", yxUserBill.getNumber());
            map.put("剩余", yxUserBill.getBalance());
            map.put("备注", yxUserBill.getMark());
            map.put("添加时间", yxUserBill.getAddTime());
            map.put("0 = 带确定 1 = 有效 -1 = 无效", yxUserBill.getStatus());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }
}
