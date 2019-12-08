package co.yixiang.modules.shop.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.exception.ErrorRequestException;
import co.yixiang.modules.shop.entity.YxStoreCategory;
import co.yixiang.modules.shop.entity.YxStoreProduct;
import co.yixiang.modules.shop.entity.YxStoreProductAttrValue;
import co.yixiang.modules.shop.mapper.YxStoreCategoryMapper;
import co.yixiang.modules.shop.mapper.YxStoreProductMapper;
import co.yixiang.modules.shop.mapping.YxStoreProductMap;
import co.yixiang.modules.shop.service.*;
import co.yixiang.modules.shop.web.dto.ProductDTO;
import co.yixiang.modules.shop.web.param.YxStoreProductQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreProductAttrQueryVo;
import co.yixiang.modules.shop.web.vo.YxStoreProductQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.utils.CateDTO;
import co.yixiang.utils.TreeUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-19
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class YxStoreProductServiceImpl extends BaseServiceImpl<YxStoreProductMapper, YxStoreProduct> implements YxStoreProductService {

    @Autowired
    private YxStoreProductMapper yxStoreProductMapper;

    @Autowired
    private YxStoreProductMap storeProductMap;

    @Autowired
    private YxStoreProductAttrService storeProductAttrService;

    @Autowired
    private YxStoreProductRelationService relationService;

    @Autowired
    private YxStoreProductReplyService replyService;

    @Autowired
    private YxUserService userService;


    /**
     * 增加库存 减少销量
     * @param num
     * @param productId
     * @param unique
     */
    @Override
    public void incProductStock(int num, int productId, String unique) {
        if(StrUtil.isNotEmpty(unique)){
            storeProductAttrService.incProductAttrStock(num,productId,unique);
            yxStoreProductMapper.decSales(num,productId);
        }else{
            yxStoreProductMapper.incStockDecSales(num,productId);
        }
    }

    /**
     * 库存与销量
     * @param num
     * @param productId
     * @param unique
     */
    @Override
    public void decProductStock(int num, int productId, String unique) {
        if(StrUtil.isNotEmpty(unique)){
            storeProductAttrService.decProductAttrStock(num,productId,unique);
            yxStoreProductMapper.incSales(num,productId);
        }else{
            yxStoreProductMapper.decStockIncSales(num,productId);
        }
    }

    /**
     * 返回商品库存
     * @param productId
     * @param unique
     * @return
     */
    @Override
    public int getProductStock(int productId, String unique) {
        if(StrUtil.isEmpty(unique)){
            return getYxStoreProductById(productId).getStock();
        }else{
            return storeProductAttrService.uniqueByStock(unique);
        }

    }

    @Override
    public ProductDTO goodsDetail(int id, int type,int uid) {
        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("is_show",1).eq("id",id);
        YxStoreProduct storeProduct = yxStoreProductMapper.selectOne(wrapper);
        if(ObjectUtil.isNull(storeProduct)){
            throw new ErrorRequestException("商品不存在或已下架");
        }
        Map<String, Object> returnMap = storeProductAttrService.getProductAttrDetail(id,0,0);
        ProductDTO productDTO = new ProductDTO();
        YxStoreProductQueryVo storeProductQueryVo  = storeProductMap.toDto(storeProduct);
        //设置VIP价格
        double vipPrice = userService.setLevelPrice(
                storeProductQueryVo.getPrice().doubleValue(),uid);
        storeProductQueryVo.setVipPrice(BigDecimal.valueOf(vipPrice));
        storeProductQueryVo.setUserCollect(relationService
                .isProductRelation(id,"product",uid,"collect"));
        productDTO.setStoreInfo(storeProductQueryVo);
        productDTO.setProductAttr((List<YxStoreProductAttrQueryVo>)returnMap.get("productAttr"));
        productDTO.setProductValue((Map<String, YxStoreProductAttrValue>)returnMap.get("productValue"));

        productDTO.setReply(replyService.getReply(id));
        int replyCount = replyService.productReplyCount(id);
        productDTO.setReplyCount(replyCount);
        productDTO.setReplyChance(replyService.doReply(id,replyCount));//百分比

        return productDTO;
    }

    /**
     * 商品列表
     * @return
     */
    @Override
    public List<YxStoreProductQueryVo> getGoodsList(YxStoreProductQueryParam productQueryParam) {

        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("is_show",1).orderByDesc("sort");

        //分类搜索
        if(productQueryParam.getSid() > 0){
            wrapper.eq("cate_id",productQueryParam.getSid());
        }
        //关键字搜索
        if(StrUtil.isNotEmpty(productQueryParam.getKeyword())){
            wrapper.like("store_name",productQueryParam.getKeyword());
        }

        //新品搜索
        if(productQueryParam.getNews() == 1){
            wrapper.eq("is_new",1);
        }
        //销量排序
        if(productQueryParam.getSalesOrder().equals("desc")){
            wrapper.orderByDesc("sales");
        }else{
            wrapper.orderByAsc("sales");
        }
        //价格排序
        if(productQueryParam.getPriceOrder().equals("desc")){
            wrapper.orderByDesc("price");
        }else{
            wrapper.orderByAsc("price");
        }


        Page<YxStoreProduct> pageModel = new Page<>(productQueryParam.getPage(),
                productQueryParam.getLimit());

        IPage<YxStoreProduct> pageList = yxStoreProductMapper.selectPage(pageModel,wrapper);

        List<YxStoreProductQueryVo> list = storeProductMap.toDto(pageList.getRecords());

//        for (GoodsDTO goodsDTO : list) {
//            goodsDTO.setIsCollect(isCollect(goodsDTO.getGoodsId(),userId));
//        }

        return list;
    }

    /**
     * 商品列表
     * @param page
     * @param limit
     * @param order
     * @return
     */
    @Override
    public List<YxStoreProductQueryVo> getList(int page, int limit, int order) {

        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("is_show",1).orderByDesc("sort");


        //todo order = 1 精品推荐  order=2  新品 3-优惠产品 4-热卖
        switch (order){
            case 1:
                wrapper.eq("is_best",1);
                break;
            case 2:
                wrapper.eq("is_new",1);
                break;
            case 3:
                wrapper.eq("is_benefit",1);
                break;
            case 4:
                wrapper.eq("is_hot",1);
                break;
        }
        Page<YxStoreProduct> pageModel = new Page<>(page, limit);

        IPage<YxStoreProduct> pageList = yxStoreProductMapper.selectPage(pageModel,wrapper);

        List<YxStoreProductQueryVo> list = storeProductMap.toDto(pageList.getRecords());


        return list;
    }

    @Override
    public YxStoreProductQueryVo getYxStoreProductById(Serializable id){
        return yxStoreProductMapper.getYxStoreProductById(id);
    }

    @Override
    public Paging<YxStoreProductQueryVo> getYxStoreProductPageList(YxStoreProductQueryParam yxStoreProductQueryParam) throws Exception{
        Page page = setPageParam(yxStoreProductQueryParam,OrderItem.desc("create_time"));
        IPage<YxStoreProductQueryVo> iPage = yxStoreProductMapper.getYxStoreProductPageList(page,yxStoreProductQueryParam);
        return new Paging(iPage);
    }

}
