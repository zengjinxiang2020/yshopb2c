package co.yixiang.modules.shop.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import co.yixiang.exception.ErrorRequestException;
import co.yixiang.modules.shop.entity.YxStoreCart;
import co.yixiang.modules.shop.entity.YxStoreProductAttrValue;
import co.yixiang.modules.shop.mapper.YxStoreCartMapper;
import co.yixiang.modules.shop.mapping.CartMap;
import co.yixiang.modules.shop.service.YxStoreCartService;
import co.yixiang.modules.shop.service.YxStoreProductAttrService;
import co.yixiang.modules.shop.service.YxStoreProductService;
import co.yixiang.modules.shop.web.param.YxStoreCartQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;
import co.yixiang.common.service.impl.BaseServiceImpl;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.web.vo.YxStoreProductQueryVo;
import co.yixiang.utils.OrderUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.util.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import javax.validation.Valid;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


/**
 * <p>
 * 购物车表 服务实现类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-25
 */
@Slf4j
@Service
@Builder
@Transactional(rollbackFor = Exception.class)
public class YxStoreCartServiceImpl extends BaseServiceImpl<YxStoreCartMapper, YxStoreCart> implements YxStoreCartService {

    @Autowired
    private YxStoreCartMapper yxStoreCartMapper;

    @Autowired
    private YxStoreProductService productService;

    @Autowired
    private YxStoreProductAttrService productAttrService;

    @Autowired
    private CartMap cartMap;

    /**
     * 删除购物车
     * @param uid
     * @param ids
     */
    @Override
    public void removeUserCart(int uid, List<String> ids) {
        QueryWrapper<YxStoreCart> wrapper = new QueryWrapper<>();
        wrapper.eq("uid",uid).in("id",ids);

        YxStoreCart storeCart = new YxStoreCart();
        storeCart.setIsDel(1);

        yxStoreCartMapper.update(storeCart,wrapper);
    }

    /**
     * 改购物车数量
     * @param cartId
     * @param cartNum
     * @param uid
     */
    @Override
    public void changeUserCartNum(int cartId, int cartNum, int uid) {
        QueryWrapper<YxStoreCart> wrapper = new QueryWrapper<>();
        wrapper.eq("uid",uid).eq("id",cartId);

        YxStoreCart cart = getOne(wrapper);
        if(ObjectUtil.isNull(cart)){
            throw new ErrorRequestException("购物车不存在");
        }

        if(cartNum <= 0){
            throw new ErrorRequestException("库存错误");
        }

        //todo 普通商品库存
        int stock = productService.getProductStock(cart.getProductId()
                ,cart.getProductAttrUnique());
        if(stock < cartNum){
            throw new ErrorRequestException("该产品库存不足"+cartNum);
        }

        if(cartNum == cart.getCartNum()) return;

        YxStoreCart storeCart = new YxStoreCart();
        storeCart.setCartNum(cartNum);
        storeCart.setId(Long.valueOf(cartId));

        yxStoreCartMapper.updateById(storeCart);


    }

    /**
     * 购物车列表
     * @param uid 用户id
     * @param cartIds 购物车id，多个逗号隔开
     * @param status 0-购购物车列表
     * @return
     */
    @Override
    public Map<String, Object> getUserProductCartList(int uid, String cartIds, int status) {
        QueryWrapper<YxStoreCart> wrapper = new QueryWrapper<>();
        wrapper.eq("uid",uid).eq("type","product").eq("is_pay",0)
                .eq("is_del",0).orderByDesc("add_time");
        if(status == 0) wrapper.eq("is_new",0);
        if(StrUtil.isNotEmpty(cartIds)) wrapper.in("id",cartIds.split(","));
        List<YxStoreCart> carts = yxStoreCartMapper.selectList(wrapper);

        List<YxStoreCartQueryVo> valid = new ArrayList<>();
        List<YxStoreCartQueryVo> invalid = new ArrayList<>();

        for (YxStoreCart storeCart : carts) {
            YxStoreProductQueryVo storeProduct = productService
                    .getYxStoreProductById(storeCart.getProductId());
            YxStoreCartQueryVo storeCartQueryVo = cartMap.toDto(storeCart);
            //System.out.println(storeProduct);
            storeCartQueryVo.setProductInfo(storeProduct);
            if(ObjectUtil.isNull(storeProduct)){
                YxStoreCart yxStoreCart = new YxStoreCart();
                yxStoreCart.setIsDel(1);
                yxStoreCartMapper.update(yxStoreCart,
                        new QueryWrapper<YxStoreCart>()
                                .lambda().eq(YxStoreCart::getId,storeCart.getId()));
            }else if(storeProduct.getIsShow() == 0 || storeProduct.getIsDel() == 1 || storeProduct.getStock() == 0){
                invalid.add(storeCartQueryVo);
            }else{
                if(StrUtil.isNotEmpty(storeCart.getProductAttrUnique())){
                    YxStoreProductAttrValue productAttrValue = productAttrService
                            .uniqueByAttrInfo(storeCart.getProductAttrUnique());
                    if(ObjectUtil.isNull(productAttrValue) || productAttrValue.getStock() == 0){
                        invalid.add(storeCartQueryVo);
                    }else{
                        storeProduct.setAttrInfo(productAttrValue);
                        //todo 秒杀 砍价 拼团

                        //todo 设置真实价格
                        storeCartQueryVo.setTruePrice(productAttrValue.getPrice()
                                .doubleValue());
                        //todo 设置会员价
                        storeCartQueryVo.setVipTruePrice(productAttrValue.getPrice()
                                .doubleValue());
                        storeCartQueryVo.setCostPrice(productAttrValue.getCost()
                                .doubleValue());
                        storeCartQueryVo.setTrueStock(productAttrValue.getStock());

                        valid.add(storeCartQueryVo);
                    }
                }else{
                    storeCartQueryVo.setTruePrice(storeProduct.getPrice()
                            .doubleValue());
                    //todo 设置会员价
                    storeCartQueryVo.setVipTruePrice(0d);
                    storeCartQueryVo.setCostPrice(storeProduct.getCost()
                            .doubleValue());
                    storeCartQueryVo.setTrueStock(storeProduct.getStock());

                    valid.add(storeCartQueryVo);
                }
            }
        }
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("valid",valid);
        map.put("invalid",invalid);
        return map;
    }

    /**
     * 添加购物车
     * @param uid  用户id
     * @param productId 普通产品编号
     * @param cartNum  购物车数量
     * @param productAttrUnique 属性唯一值
     * @param type product
     * @param isNew 1 加入购物车直接购买  0 加入购物车
     * @param combinationId 拼团id
     * @param seckillId  秒杀id
     * @param bargainId  砍价id
     * @return
     */
    @Override
    public int addCart(int uid, int productId, int cartNum, String productAttrUnique,
                       String type, int isNew, int combinationId, int seckillId, int bargainId) {
        YxStoreProductQueryVo productQueryVo = productService
                .getYxStoreProductById(productId);
        if(ObjectUtil.isNull(productQueryVo)){
            throw new ErrorRequestException("该产品已下架或删除");
        }

        int stock = productService.getProductStock(productId,productAttrUnique);
        if(stock < cartNum){
            throw new ErrorRequestException("该产品库存不足"+cartNum);
        }

        QueryWrapper<YxStoreCart> wrapper = new QueryWrapper<>();
        wrapper.eq("uid",uid).eq("type",type).eq("is_pay",0).eq("is_del",0)
                .eq("is_new",isNew).eq("product_attr_unique",productAttrUnique)
                .eq("combination_id",combinationId).eq("bargain_id",bargainId)
                .eq("seckill_id",seckillId);

        YxStoreCart cart =yxStoreCartMapper.selectOne(wrapper);
        YxStoreCart storeCart = new YxStoreCart();

        storeCart.setBargainId(bargainId);
        storeCart.setCartNum(cartNum);
        storeCart.setCombinationId(combinationId);
        storeCart.setIsNew(0);
        storeCart.setProductAttrUnique(productAttrUnique);
        storeCart.setProductId(productId);
        storeCart.setSeckillId(seckillId);
        storeCart.setType(type);
        storeCart.setUid(uid);
        storeCart.setIsNew(isNew);
        if(ObjectUtil.isNotNull(cart)){
            if(isNew == 0){
                storeCart.setCartNum(cartNum + storeCart.getCartNum());
            }
            storeCart.setId(cart.getId());
            yxStoreCartMapper.updateById(storeCart);
        }else{
            storeCart.setAddTime(OrderUtil.getSecondTimestampTwo());
            yxStoreCartMapper.insert(storeCart);
        }

        return storeCart.getId().intValue();
    }

    @Override
    public int getUserCartNum(int uid, String type, int numType) {
        int num = 0;
        QueryWrapper<YxStoreCart> wrapper = new QueryWrapper<>();
        wrapper.eq("uid",uid).eq("type",type).eq("is_pay",0).eq("is_del",0).eq("is_new",0);
        if(numType > 0){
            num = yxStoreCartMapper.selectCount(wrapper);
        }else{
            num = yxStoreCartMapper.cartSum(uid,type);
        }
        return num;
    }

    @Override
    public YxStoreCartQueryVo getYxStoreCartById(Serializable id) throws Exception{
        return yxStoreCartMapper.getYxStoreCartById(id);
    }



}
