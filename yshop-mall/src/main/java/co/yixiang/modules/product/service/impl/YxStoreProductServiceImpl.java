/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.product.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.api.YshopException;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.utils.QueryHelpPlus;
import co.yixiang.constant.ShopConstants;
import co.yixiang.dozer.service.IGenerator;
import co.yixiang.enums.CommonEnum;
import co.yixiang.enums.ProductEnum;
import co.yixiang.enums.ShopCommonEnum;
import co.yixiang.enums.SortEnum;
import co.yixiang.exception.BadRequestException;

import co.yixiang.exception.ErrorRequestException;
import co.yixiang.modules.category.service.YxStoreCategoryService;
import co.yixiang.modules.product.domain.YxStoreProduct;
import co.yixiang.modules.product.domain.YxStoreProductAttr;
import co.yixiang.modules.product.domain.YxStoreProductAttrResult;
import co.yixiang.modules.product.domain.YxStoreProductAttrValue;
import co.yixiang.modules.product.param.YxStoreProductQueryParam;
import co.yixiang.modules.product.service.*;
import co.yixiang.modules.product.service.dto.*;
import co.yixiang.modules.product.service.mapper.StoreProductAttrValueMapper;
import co.yixiang.modules.product.service.mapper.StoreProductMapper;
import co.yixiang.modules.product.vo.ProductVo;
import co.yixiang.modules.product.vo.YxStoreProductAttrQueryVo;
import co.yixiang.modules.product.vo.YxStoreProductQueryVo;
import co.yixiang.modules.product.vo.YxStoreProductReplyQueryVo;
import co.yixiang.modules.shop.service.YxSystemStoreService;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.utils.FileUtil;
import co.yixiang.utils.OrderUtil;
import co.yixiang.utils.RedisUtil;
import co.yixiang.utils.ShopKeyUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;



/**
* @author hupeng
* @date 2020-05-12
*/
@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class YxStoreProductServiceImpl extends BaseServiceImpl<StoreProductMapper, YxStoreProduct> implements YxStoreProductService {

    @Autowired
    private IGenerator generator;

    @Autowired
    private StoreProductMapper storeProductMapper;
    @Autowired
    private StoreProductAttrValueMapper storeProductAttrValueMapper;

    @Autowired
    private YxStoreCategoryService yxStoreCategoryService;
    @Autowired
    private YxStoreProductAttrService yxStoreProductAttrService;
    @Autowired
    private YxStoreProductAttrValueService yxStoreProductAttrValueService;
    @Autowired
    private YxStoreProductAttrResultService yxStoreProductAttrResultService;
    @Autowired
    private YxUserService userService;
    @Autowired
    private YxStoreProductReplyService replyService;
    @Autowired
    private YxStoreProductRelationService relationService;
    @Autowired
    private YxSystemStoreService systemStoreService;



    /**
     * 增加库存 减少销量
     * @param num 数量
     * @param productId 商品id
     * @param unique sku唯一值
     */
    @Override
    public void incProductStock(Integer num, Long productId, String unique) {
        if(StrUtil.isNotEmpty(unique)){
            yxStoreProductAttrService.incProductAttrStock(num,productId,unique);
        }
        storeProductMapper.incStockDecSales(num,productId);
    }

    /**
     * 减少库存与增加销量
     * @param num 数量
     * @param productId 商品id
     * @param unique sku
     */
    @Override
    public void decProductStock(int num, Long productId, String unique) {
        if(StrUtil.isNotEmpty(unique)){
            yxStoreProductAttrService.decProductAttrStock(num,productId,unique);
        }
        int res = storeProductMapper.decStockIncSales(num,productId);
        if(res == 0) throw new YshopException("商品库存不足");
    }



    @Override
    public YxStoreProduct getProductInfo(int id) {
        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.eq("is_del",0).eq("is_show",1).eq("id",id);
        YxStoreProduct storeProduct = this.baseMapper.selectOne(wrapper);
        if(ObjectUtil.isNull(storeProduct)){
            throw new ErrorRequestException("商品不存在或已下架");
        }

        return storeProduct;
    }


    /**
     * 获取单个商品
     * @param id 商品id
     * @return YxStoreProductQueryVo
     */
    @Override
    public YxStoreProductQueryVo getStoreProductById(Long id) {
        return generator.convert(this.baseMapper.selectById(id),YxStoreProductQueryVo.class);
    }


    /**
     * 返回商品库存
     * @param productId 商品id
     * @param unique sku唯一值
     * @return int
     */
    @Override
    public int getProductStock(Long productId, String unique) {
        if(StrUtil.isEmpty(unique)){
            return this.getById(productId).getStock();
        }else{
            return yxStoreProductAttrService.uniqueByStock(unique);
        }

    }


    /**
     * 商品列表
     * @param productQueryParam YxStoreProductQueryParam
     * @return list
     */
    @Override
    public List<YxStoreProductQueryVo> getGoodsList(YxStoreProductQueryParam productQueryParam) {

        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(YxStoreProduct::getIsShow,CommonEnum.SHOW_STATUS_1.getValue());

        //分类搜索
        if(StrUtil.isNotBlank(productQueryParam.getSid()) &&
                !ShopConstants.YSHOP_ZERO.equals(productQueryParam.getSid())){
            wrapper.lambda().eq(YxStoreProduct::getCateId,productQueryParam.getSid());
        }
        //关键字搜索
        if(StrUtil.isNotEmpty(productQueryParam.getKeyword())){
            wrapper.lambda().like(YxStoreProduct::getStoreName,productQueryParam.getKeyword());
        }

        //新品搜索
        if(StrUtil.isNotBlank(productQueryParam.getNews()) &&
                !ShopConstants.YSHOP_ZERO.equals(productQueryParam.getNews())){
            wrapper.lambda().eq(YxStoreProduct::getIsNew,ShopCommonEnum.IS_NEW_1.getValue());
        }

        //销量排序
        if(SortEnum.DESC.getValue().equals(productQueryParam.getSalesOrder())){
            wrapper.lambda().orderByDesc(YxStoreProduct::getSales);
        }else if(SortEnum.ASC.getValue().equals(productQueryParam.getSalesOrder())) {
            wrapper.lambda().orderByAsc(YxStoreProduct::getSales);
        }

        //价格排序
        if(SortEnum.DESC.getValue().equals(productQueryParam.getPriceOrder())){
            wrapper.lambda().orderByDesc(YxStoreProduct::getPrice);
        }else if(SortEnum.ASC.getValue().equals(productQueryParam.getPriceOrder())){
            wrapper.lambda().orderByAsc(YxStoreProduct::getPrice);
        }

        wrapper.lambda().orderByDesc(YxStoreProduct::getSort);

        Page<YxStoreProduct> pageModel = new Page<>(productQueryParam.getPage(),
                productQueryParam.getLimit());

        IPage<YxStoreProduct> pageList = storeProductMapper.selectPage(pageModel,wrapper);

        List<YxStoreProductQueryVo> list = generator.convert(pageList.getRecords(),YxStoreProductQueryVo.class);

        return list;
    }

    /**
     * 商品详情
     * @param id 商品id
     * @param uid 用户id
     * @param latitude 纬度
     * @param longitude 经度
     * @return ProductVo
     */
    @Override
    public ProductVo goodsDetail(Long id, Long uid, String latitude, String longitude) {
        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(YxStoreProduct::getIsShow,ShopCommonEnum.SHOW_1.getValue())
                .eq(YxStoreProduct::getId,id);
        YxStoreProduct storeProduct = storeProductMapper.selectOne(wrapper);
        if(ObjectUtil.isNull(storeProduct)){
            throw new ErrorRequestException("商品不存在或已下架");
        }
        Map<String, Object> returnMap = yxStoreProductAttrService.getProductAttrDetail(id,0,0);
        ProductVo productVo = new ProductVo();
        YxStoreProductQueryVo storeProductQueryVo  = generator.convert(storeProduct,YxStoreProductQueryVo.class);

        //处理库存
        Integer newStock = storeProductAttrValueMapper.sumStock(id);
        if(newStock != null)  storeProductQueryVo.setStock(newStock);

        //设置VIP价格
        double vipPrice = userService.setLevelPrice(
                storeProductQueryVo.getPrice().doubleValue(),uid);
        storeProductQueryVo.setVipPrice(BigDecimal.valueOf(vipPrice));

        //收藏
        boolean isCollect = relationService.isProductRelation(id,uid);
        storeProductQueryVo.setUserCollect(isCollect);

        //总条数
        int totalCount = replyService.productReplyCount(id);
        productVo.setReplyCount(totalCount);

        //评价
        YxStoreProductReplyQueryVo storeProductReplyQueryVo = replyService.getReply(id);
        productVo.setReply(storeProductReplyQueryVo);

        //好评比例
        String replyPer = replyService.replyPer(id);
        productVo.setReplyChance(replyPer);


        productVo.setStoreInfo(storeProductQueryVo);
        productVo.setProductAttr((List<YxStoreProductAttrQueryVo>)returnMap.get("productAttr"));
        productVo.setProductValue((Map<String, YxStoreProductAttrValue>)returnMap.get("productValue"));


        //门店
        productVo.setSystemStore(systemStoreService.getStoreInfo(latitude,longitude));
        productVo.setMapKey(RedisUtil.get(ShopKeyUtils.getTengXunMapKey()));

        return productVo;
    }


    /**
     * 商品列表
     * @param page 页码
     * @param limit 条数
     * @param order ProductEnum
     * @return List
     */
    @Override
    public List<YxStoreProductQueryVo> getList(int page, int limit, int order) {

        QueryWrapper<YxStoreProduct> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(YxStoreProduct::getIsShow,ShopCommonEnum.SHOW_1.getValue())
                .orderByDesc(YxStoreProduct::getSort);

        // order
        switch (ProductEnum.toType(order)){
            case TYPE_1:
                wrapper.lambda().eq(YxStoreProduct::getIsBest,
                        ShopCommonEnum.IS_STATUS_1.getValue()); //精品推荐
                break;
            case TYPE_3:
                wrapper.lambda().eq(YxStoreProduct::getIsNew,
                        ShopCommonEnum.IS_STATUS_1.getValue());//// 首发新品
                break;
            case TYPE_4:
                wrapper.lambda().eq(YxStoreProduct::getIsBenefit,
                        ShopCommonEnum.IS_STATUS_1.getValue()); //// 促销单品
                break;
            case TYPE_2:
                wrapper.lambda().eq(YxStoreProduct::getIsHot,
                        ShopCommonEnum.IS_STATUS_1.getValue());//// 热门榜单
                break;
        }
        Page<YxStoreProduct> pageModel = new Page<>(page, limit);

        IPage<YxStoreProduct> pageList = storeProductMapper.selectPage(pageModel,wrapper);


        return generator.convert(pageList.getRecords(),YxStoreProductQueryVo.class);
    }






    //============ 分割线================//


    @Override
    public Map<String, Object> queryAll(YxStoreProductQueryCriteria criteria, Pageable pageable) {
        getPage(pageable);
        PageInfo<YxStoreProduct> page = new PageInfo<>(queryAll(criteria));
        Map<String, Object> map = new LinkedHashMap<>(2);
        map.put("content", generator.convert(page.getList(), YxStoreProductDto.class));
        map.put("totalElements", page.getTotal());
        return map;
    }


    @Override
    public List<YxStoreProduct> queryAll(YxStoreProductQueryCriteria criteria){
        List<YxStoreProduct> yxStoreProductList = baseMapper.selectList(QueryHelpPlus.getPredicate(YxStoreProduct.class, criteria));
        yxStoreProductList.forEach(yxStoreProduct ->{
            yxStoreProduct.setStoreCategory(yxStoreCategoryService.getById(yxStoreProduct.getCateId()));
        });
        return yxStoreProductList;
    }


    @Override
    public void download(List<YxStoreProductDto> all, HttpServletResponse response) throws IOException {
        List<Map<String, Object>> list = new ArrayList<>();
        for (YxStoreProductDto yxStoreProduct : all) {
            Map<String,Object> map = new LinkedHashMap<>();
            map.put("商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)", yxStoreProduct.getMerId());
            map.put("商品图片", yxStoreProduct.getImage());
            map.put("轮播图", yxStoreProduct.getSliderImage());
            map.put("商品名称", yxStoreProduct.getStoreName());
            map.put("商品简介", yxStoreProduct.getStoreInfo());
            map.put("关键字", yxStoreProduct.getKeyword());
            map.put("产品条码（一维码）", yxStoreProduct.getBarCode());
            map.put("分类id", yxStoreProduct.getCateId());
            map.put("商品价格", yxStoreProduct.getPrice());
            map.put("会员价格", yxStoreProduct.getVipPrice());
            map.put("市场价", yxStoreProduct.getOtPrice());
            map.put("邮费", yxStoreProduct.getPostage());
            map.put("单位名", yxStoreProduct.getUnitName());
            map.put("排序", yxStoreProduct.getSort());
            map.put("销量", yxStoreProduct.getSales());
            map.put("库存", yxStoreProduct.getStock());
            map.put("状态（0：未上架，1：上架）", yxStoreProduct.getIsShow());
            map.put("是否热卖", yxStoreProduct.getIsHot());
            map.put("是否优惠", yxStoreProduct.getIsBenefit());
            map.put("是否精品", yxStoreProduct.getIsBest());
            map.put("是否新品", yxStoreProduct.getIsNew());
            map.put("产品描述", yxStoreProduct.getDescription());
            map.put("添加时间", yxStoreProduct.getAddTime());
            map.put("是否包邮", yxStoreProduct.getIsPostage());
            map.put("是否删除", yxStoreProduct.getIsDel());
            map.put("商户是否代理 0不可代理1可代理", yxStoreProduct.getMerUse());
            map.put("获得积分", yxStoreProduct.getGiveIntegral());
            map.put("成本价", yxStoreProduct.getCost());
            map.put("秒杀状态 0 未开启 1已开启", yxStoreProduct.getIsSeckill());
            map.put("砍价状态 0未开启 1开启", yxStoreProduct.getIsBargain());
            map.put("是否优品推荐", yxStoreProduct.getIsGood());
            map.put("虚拟销量", yxStoreProduct.getFicti());
            map.put("浏览量", yxStoreProduct.getBrowse());
            map.put("产品二维码地址(用户小程序海报)", yxStoreProduct.getCodePath());
            map.put("淘宝京东1688类型", yxStoreProduct.getSoureLink());
            list.add(map);
        }
        FileUtil.downloadExcel(list, response);
    }

    /**
     * 新增商品
     * @param storeProduct storeProduct
     * @return  YxStoreProduct
     */
    @Override
    public YxStoreProduct saveProduct(YxStoreProduct storeProduct) {
        if (storeProduct.getStoreCategory().getId() == null) {
            throw new BadRequestException("分类名称不能为空");
        }
        boolean check = yxStoreCategoryService
                .checkProductCategory(storeProduct.getStoreCategory().getId());
        if(!check) throw new BadRequestException("商品分类必选选择二级");
        storeProduct.setCateId(storeProduct.getStoreCategory().getId().toString());
        this.save(storeProduct);
        return storeProduct;
    }

//    @Override
//    public void recovery(Integer id) {
//        storeProductMapper.updateDel(0,id);
//        storeProductMapper.updateOnsale(0,id);
//    }

    /**
     * 商品上架下架
     * @param id 商品id
     * @param status  ShopCommonEnum
     */
    @Override
    public void onSale(Long id,Integer status) {
        if(ShopCommonEnum.SHOW_1.getValue().equals(status)){
            status = ShopCommonEnum.SHOW_0.getValue();
        }else{
            status = ShopCommonEnum.SHOW_1.getValue();
        }
        storeProductMapper.updateOnsale(status,id);
    }

    /**
     * 组合sku
     * @param id 商品di
     * @param jsonStr 属性json
     * @return list
     */
    @Override
    public List<ProductFormatDto> isFormatAttr(Long id, String jsonStr) {
        if(ObjectUtil.isNull(id)) throw new YshopException("产品不存在");

        YxStoreProductDto yxStoreProductDTO = generator.convert(this.getById(id),YxStoreProductDto.class);
        DetailDto detailDTO = this.attrFormat(jsonStr);
        List<ProductFormatDto> newList = new ArrayList<>();
        for (Map<String, Map<String,String>> map : detailDTO.getRes()) {
            ProductFormatDto productFormatDTO = new ProductFormatDto();
            productFormatDTO.setDetail(map.get("detail"));
            productFormatDTO.setCost(yxStoreProductDTO.getCost().doubleValue());
            productFormatDTO.setPrice(yxStoreProductDTO.getPrice().doubleValue());
            productFormatDTO.setSales(yxStoreProductDTO.getSales());
            productFormatDTO.setPic(yxStoreProductDTO.getImage());
            productFormatDTO.setCheck(false);
            newList.add(productFormatDTO);
        }
        return newList;
    }

    /**
     * 保存sku
     * @param id 商品id
     * @param jsonStr sku json
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void createProductAttr(long id, String jsonStr) {
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        List<FromatDetailDto> attrList = JSON.parseArray(
                jsonObject.get("items").toString(),
                FromatDetailDto.class);
        List<ProductFormatDto> valueList = JSON.parseArray(
                jsonObject.get("attrs").toString(),
                ProductFormatDto.class);


        List<YxStoreProductAttr> attrGroup = new ArrayList<>();
        for (FromatDetailDto fromatDetailDTO : attrList) {
            YxStoreProductAttr  yxStoreProductAttr = new YxStoreProductAttr();
            yxStoreProductAttr.setProductId(id);
            yxStoreProductAttr.setAttrName(fromatDetailDTO.getValue());
            yxStoreProductAttr.setAttrValues(StrUtil.
                    join(",",fromatDetailDTO.getDetail()));
            attrGroup.add(yxStoreProductAttr);
        }


        List<YxStoreProductAttrValue> valueGroup = new ArrayList<>();
        for (ProductFormatDto productFormatDTO : valueList) {
            YxStoreProductAttrValue yxStoreProductAttrValue = new YxStoreProductAttrValue();
            yxStoreProductAttrValue.setProductId(id);
            List<String> stringList = productFormatDTO.getDetail().values()
                    .stream().collect(Collectors.toList());
            Collections.sort(stringList);
            yxStoreProductAttrValue.setSku(StrUtil.
                    join(",",stringList));
            yxStoreProductAttrValue.setPrice(BigDecimal.valueOf(productFormatDTO.getPrice()));
            yxStoreProductAttrValue.setCost(BigDecimal.valueOf(productFormatDTO.getCost()));
            yxStoreProductAttrValue.setStock(productFormatDTO.getSales());
            yxStoreProductAttrValue.setUnique(IdUtil.simpleUUID());
            yxStoreProductAttrValue.setImage(productFormatDTO.getPic());

            valueGroup.add(yxStoreProductAttrValue);
        }

        if(attrGroup.isEmpty() || valueGroup.isEmpty()){
            throw new BadRequestException("请设置至少一个属性!");
        }

        //如果设置sku 处理价格与库存

        ////取最小价格
        BigDecimal minPrice = valueGroup
                .stream()
                .map(YxStoreProductAttrValue::getPrice)
                .min(Comparator.naturalOrder())
                .orElse(BigDecimal.ZERO);

        //计算库存
        Integer stock = valueGroup
                .stream()
                .map(YxStoreProductAttrValue::getStock)
                .reduce(Integer::sum)
                .orElse(0);

        YxStoreProduct yxStoreProduct = YxStoreProduct.builder()
                .stock(stock)
                .price(minPrice)
                .id(id)
                .build();
        this.updateById(yxStoreProduct);

        //插入之前清空
        this.clearProductAttr(id,true);


        //保存属性
        yxStoreProductAttrService.saveOrUpdateBatch(attrGroup);

        //保存值
        yxStoreProductAttrValueService.saveOrUpdateBatch(valueGroup);

        Map<String,Object> map = new LinkedHashMap<>();
        map.put("attr",jsonObject.get("items"));
        map.put("value",jsonObject.get("attrs"));

        //保存结果
        this.setResult(map,id);
    }

    /**
     * 保存sku
     * @param map sku map组合值
     * @param id 商品di
     */
    @Transactional(rollbackFor = Exception.class)
    public void setResult(Map<String, Object> map,long id) {
        YxStoreProductAttrResult yxStoreProductAttrResult = new YxStoreProductAttrResult();
        yxStoreProductAttrResult.setProductId(id);
        yxStoreProductAttrResult.setResult(JSON.toJSONString(map));
        yxStoreProductAttrResult.setChangeTime(new Date());


        yxStoreProductAttrResultService.saveOrUpdate(yxStoreProductAttrResult);
    }

    /**
     * 获取产品属性
     * @param id 商品id
     * @return json
     */
    @Override
    public String getStoreProductAttrResult(Long id) {
        YxStoreProductAttrResult yxStoreProductAttrResult = yxStoreProductAttrResultService
                .getOne(new QueryWrapper<YxStoreProductAttrResult>().lambda()
                        .eq(YxStoreProductAttrResult::getProductId,id));
        if(ObjectUtil.isNull(yxStoreProductAttrResult)) return "";
        return  yxStoreProductAttrResult.getResult();
    }

    @Override
    public void updateProduct(YxStoreProduct resources) {
        if(resources.getStoreCategory() == null || resources.getStoreCategory().getId() == null) throw new BadRequestException("请选择分类");
        boolean check = yxStoreCategoryService
                .checkProductCategory(resources.getStoreCategory().getId());
        if(!check) throw new BadRequestException("商品分类必选选择二级");
        resources.setCateId(resources.getStoreCategory().getId().toString());
        this.saveOrUpdate(resources);
    }



    /**
     * 删除属性值
     * @param id 商品id
     * @param isActice boolean
     */
    public void clearProductAttr(long id,boolean isActice) {
        if(ObjectUtil.isNull(id)) throw new BadRequestException("产品不存在");
        yxStoreProductAttrService.remove(new QueryWrapper<YxStoreProductAttr>().lambda()
                .eq(YxStoreProductAttr::getProductId,id));
        yxStoreProductAttrValueService.remove(new QueryWrapper<YxStoreProductAttrValue>().lambda()
                .eq(YxStoreProductAttrValue::getProductId,id));
        if(isActice){
            yxStoreProductAttrResultService.remove(new QueryWrapper<YxStoreProductAttrResult>().lambda()
                    .eq(YxStoreProductAttrResult::getProductId,id));
        }
    }
    /**
     * 组合规则属性算法
     * @param jsonStr 属性json
     * @return DetailDto
     */
    private DetailDto attrFormat(String jsonStr){
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        List<FromatDetailDto> fromatDetailDTOList = JSON.parseArray(jsonObject.get("items").toString(),
                FromatDetailDto.class);
        List<String> data = new ArrayList<>();
        List<Map<String,Map<String,String>>> res =new ArrayList<>();
        if(fromatDetailDTOList.size() > 1){
            for (int i=0; i < fromatDetailDTOList.size() - 1;i++){
                if(i == 0) data = fromatDetailDTOList.get(i).getDetail();
                List<String> tmp = new LinkedList<>();
                for (String v : data) {
                    for (String g : fromatDetailDTOList.get(i+1).getDetail()) {
                        String rep2 = "";
                        if(i == 0){
                            rep2 = fromatDetailDTOList.get(i).getValue() + "_" + v + "-"
                                    + fromatDetailDTOList.get(i+1).getValue() + "_" + g;
                        }else{
                            rep2 = v + "-"
                                    + fromatDetailDTOList.get(i+1).getValue() + "_" + g;
                        }
                        tmp.add(rep2);
                        if(i == fromatDetailDTOList.size() - 2){
                            Map<String,Map<String,String>> rep4 = new LinkedHashMap<>();
                            Map<String,String> reptemp = new LinkedHashMap<>();
                            for (String h : Arrays.asList(rep2.split("-"))) {
                                List<String> rep3 = Arrays.asList(h.split("_"));

                                if(rep3.size() > 1){
                                    reptemp.put(rep3.get(0),rep3.get(1));
                                }else{
                                    reptemp.put(rep3.get(0),"");
                                }
                            }
                            rep4.put("detail",reptemp);
                            res.add(rep4);
                        }
                    }
                }
                //System.out.println("tmp:"+tmp);
                if(!tmp.isEmpty()){
                    data = tmp;
                }
            }
        }else{
            List<String> dataArr = new ArrayList<>();

            for (FromatDetailDto fromatDetailDTO : fromatDetailDTOList) {

                for (String str : fromatDetailDTO.getDetail()) {
                    Map<String,Map<String,String>> map2 = new LinkedHashMap<>();
                    //List<Map<String,String>> list1 = new ArrayList<>();
                    dataArr.add(fromatDetailDTO.getValue()+"_"+str);
                    Map<String,String> map1 = new LinkedHashMap<>();
                    map1.put(fromatDetailDTO.getValue(),str);
                    //list1.add(map1);
                    map2.put("detail",map1);
                    res.add(map2);
                }
            }
            String s = StrUtil.join("-",dataArr);
            data.add(s);
        }
        DetailDto detailDTO = new DetailDto();
        detailDTO.setData(data);
        detailDTO.setRes(res);
        return detailDTO;
    }
}
