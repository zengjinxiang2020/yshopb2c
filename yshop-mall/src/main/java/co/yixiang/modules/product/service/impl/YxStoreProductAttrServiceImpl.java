/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.product.service.impl;

import co.yixiang.api.YshopException;
import co.yixiang.common.service.impl.BaseServiceImpl;

import co.yixiang.dozer.service.IGenerator;
import co.yixiang.modules.product.domain.YxStoreProductAttr;
import co.yixiang.modules.product.domain.YxStoreProductAttrValue;
import co.yixiang.modules.product.service.YxStoreProductAttrService;
import co.yixiang.modules.product.service.dto.AttrValueDto;
import co.yixiang.modules.product.service.mapper.StoreProductAttrMapper;
import co.yixiang.modules.product.service.mapper.StoreProductAttrValueMapper;
import co.yixiang.modules.product.vo.YxStoreProductAttrQueryVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;


/**
* @author hupeng
* @date 2020-05-12
*/
@Service
@AllArgsConstructor
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxStoreProductAttrServiceImpl extends BaseServiceImpl<StoreProductAttrMapper, YxStoreProductAttr> implements YxStoreProductAttrService {

    private final IGenerator generator;
    private final StoreProductAttrMapper yxStoreProductAttrMapper;
    private final StoreProductAttrValueMapper yxStoreProductAttrValueMapper;


    /**
     * 增加库存减去销量
     * @param num 数量
     * @param productId 商品id
     * @param unique sku唯一值
     */
    @Override
    public void incProductAttrStock(Integer num, Long productId, String unique) {
        yxStoreProductAttrValueMapper.incStockDecSales(num,productId,unique);
    }

    /**
     * 减少库存增加销量
     * @param num 数量
     * @param productId 商品id
     * @param unique sku唯一值
     */
    @Override
    public void decProductAttrStock(int num, Long productId, String unique) {
        int res = yxStoreProductAttrValueMapper.decStockIncSales(num,productId,unique);
        if(res == 0) throw new YshopException("商品库存不足");
    }

    /**
     * 库存
     * @param unique
     * @return
     */
    @Override
    public int uniqueByStock(String unique) {
        QueryWrapper<YxStoreProductAttrValue> wrapper = new QueryWrapper<>();
        wrapper.eq("`unique`",unique);
        return yxStoreProductAttrValueMapper.selectOne(wrapper).getStock();
    }



    @Override
    public YxStoreProductAttrValue uniqueByAttrInfo(String unique) {
        QueryWrapper<YxStoreProductAttrValue> wrapper = new QueryWrapper<>();
        wrapper.eq("`unique`",unique);
        return yxStoreProductAttrValueMapper.selectOne(wrapper);
    }

    @Override
    public Map<String, Object> getProductAttrDetail(long productId, long uid, int type) {
        QueryWrapper<YxStoreProductAttr> wrapper = new QueryWrapper<>();
        wrapper.eq("product_id",productId).orderByAsc("attr_values");
        List<YxStoreProductAttr> storeProductAttrs = yxStoreProductAttrMapper
                .selectList(wrapper);

        QueryWrapper<YxStoreProductAttrValue> wrapper2 = new QueryWrapper<>();
        wrapper2.eq("product_id",productId);
        List<YxStoreProductAttrValue>  productAttrValues = yxStoreProductAttrValueMapper
                .selectList(wrapper2);

        List<Map<String, YxStoreProductAttrValue>> mapList = new ArrayList<>();

        Map<String, YxStoreProductAttrValue> map = new LinkedHashMap<>();
        for (YxStoreProductAttrValue value : productAttrValues) {

            map.put(value.getSku(),value);
            // mapList.add(map);
        }

        List<YxStoreProductAttrQueryVo> yxStoreProductAttrQueryVoList = new ArrayList<>();

        for (YxStoreProductAttr attr : storeProductAttrs) {
            List<String> stringList = Arrays.asList(attr.getAttrValues().split(","));
            List<AttrValueDto> attrValueDTOS = new ArrayList<>();
            for (String str : stringList) {
                AttrValueDto attrValueDTO = new AttrValueDto();
                attrValueDTO.setAttr(str);
                attrValueDTO.setCheck(false);

                attrValueDTOS.add(attrValueDTO);
            }
            YxStoreProductAttrQueryVo attrQueryVo = generator.convert(attr,YxStoreProductAttrQueryVo.class);
            attrQueryVo.setAttrValue(attrValueDTOS);
            attrQueryVo.setAttrValueArr(stringList);

            yxStoreProductAttrQueryVoList.add(attrQueryVo);

        }


        Map<String, Object> returnMap = new LinkedHashMap<>();


        returnMap.put("productAttr",yxStoreProductAttrQueryVoList);
        returnMap.put("productValue",map);
        return returnMap;
    }

}
