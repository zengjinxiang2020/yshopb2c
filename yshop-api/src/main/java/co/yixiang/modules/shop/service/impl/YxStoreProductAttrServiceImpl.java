package co.yixiang.modules.shop.service.impl;

import co.yixiang.modules.shop.entity.YxStoreProductAttr;
import co.yixiang.modules.shop.entity.YxStoreProductAttrValue;
import co.yixiang.modules.shop.mapper.YxStoreProductAttrMapper;
import co.yixiang.modules.shop.mapper.YxStoreProductAttrValueMapper;
import co.yixiang.modules.shop.mapping.ProductAttrMap;
import co.yixiang.modules.shop.service.YxStoreProductAttrService;
import co.yixiang.modules.shop.web.dto.AttrValueDTO;
import co.yixiang.modules.shop.web.param.YxStoreProductAttrQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreProductAttrQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.web.vo.YxStoreProductAttrValueQueryVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.util.LinkedCaseInsensitiveMap;

import java.io.Serializable;
import java.util.*;


/**
 * <p>
 * 商品属性表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-23
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreProductAttrServiceImpl extends BaseServiceImpl<YxStoreProductAttrMapper, YxStoreProductAttr> implements YxStoreProductAttrService {

    @Autowired
    private YxStoreProductAttrMapper yxStoreProductAttrMapper;

    @Autowired
    private YxStoreProductAttrValueMapper yxStoreProductAttrValueMapper;

    @Autowired
    private ProductAttrMap productAttrMap;


    @Override
    public void decProductAttrStock(int num, int productId, String unique) {
        yxStoreProductAttrValueMapper.decStockIncSales(num,productId,unique);
    }

    @Override
    public Map<String, Object> getProductAttrDetail(int productId,int uid,int type) {
        QueryWrapper<YxStoreProductAttr> wrapper = new QueryWrapper<>();
        wrapper.eq("product_id",productId).orderByAsc("attr_values");
        List<YxStoreProductAttr>  storeProductAttrs = yxStoreProductAttrMapper
                .selectList(wrapper);

        QueryWrapper<YxStoreProductAttrValue> wrapper2 = new QueryWrapper<>();
        wrapper2.eq("product_id",productId);
        List<YxStoreProductAttrValue>  productAttrValues = yxStoreProductAttrValueMapper
                .selectList(wrapper2);

        List<Map<String, YxStoreProductAttrValue>> mapList = new ArrayList<>();

        Map<String, YxStoreProductAttrValue> map = new LinkedHashMap<>();
        for (YxStoreProductAttrValue value : productAttrValues) {

            map.put(value.getSuk(),value);
           // mapList.add(map);
        }

        List<YxStoreProductAttrQueryVo> yxStoreProductAttrQueryVoList = new ArrayList<>();

        for (YxStoreProductAttr attr : storeProductAttrs) {
            List<String> stringList = Arrays.asList(attr.getAttrValues().split(","));
            List<AttrValueDTO> attrValueDTOS = new ArrayList<>();
            for (String str : stringList) {
                AttrValueDTO attrValueDTO = new AttrValueDTO();
                attrValueDTO.setAttr(str);
                attrValueDTO.setCheck(false);

                attrValueDTOS.add(attrValueDTO);
            }
            YxStoreProductAttrQueryVo attrQueryVo = productAttrMap.toDto(attr);
            attrQueryVo.setAttrValue(attrValueDTOS);
            attrQueryVo.setAttrValueArr(stringList);

            yxStoreProductAttrQueryVoList.add(attrQueryVo);

        }

        //System.out.println(yxStoreProductAttrQueryVoList);
        //System.out.println(map);
        Map<String, Object> returnMap = new LinkedHashMap<>();


        returnMap.put("productAttr",yxStoreProductAttrQueryVoList);
        returnMap.put("productValue",map);
        return returnMap;
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
    public Boolean issetProductUnique(int productId, String unique) {
        return null;
    }

    @Override
    public YxStoreProductAttrValue uniqueByAttrInfo(String unique) {
        QueryWrapper<YxStoreProductAttrValue> wrapper = new QueryWrapper<>();
        wrapper.eq("`unique`",unique);
        return yxStoreProductAttrValueMapper.selectOne(wrapper);
    }
}
