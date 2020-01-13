package co.yixiang.modules.shop.web.controller;

import co.yixiang.annotation.AnonymousAccess;
import co.yixiang.aop.log.Log;
import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.modules.shop.service.YxStoreProductRelationService;
import co.yixiang.modules.shop.service.YxStoreProductReplyService;
import co.yixiang.modules.shop.service.YxStoreProductService;
import co.yixiang.modules.shop.web.dto.ProductDTO;
import co.yixiang.modules.shop.web.param.YxStoreProductQueryParam;
import co.yixiang.modules.shop.web.param.YxStoreProductRelationQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreProductQueryVo;
import co.yixiang.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-10-19
 */
@Slf4j
@RestController
@Api(value = "产品模块", tags = "产品模块", description = "产品模块")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class StoreProductController extends BaseController {

    private final YxStoreProductService storeProductService;
    private final YxStoreProductRelationService productRelationService;
    private final YxStoreProductReplyService replyService;


    /**
     * 获取首页更多产品
     */
    @AnonymousAccess
    @GetMapping("/groom/list/{type}")
    @ApiOperation(value = "获取首页更多产品",notes = "获取首页更多产品")
    public ApiResult<Map<String,Object>> moreGoodsList(@PathVariable Integer type){

        Map<String,Object> map = new LinkedHashMap<>();
        if(type == 1){//TODO 精品推荐
            map.put("list",storeProductService.getList(1,20,1));
        }else if(type == 2){//TODO  热门榜单
            map.put("list",storeProductService.getList(1,20,4));
        }else if(type == 3){//TODO 首发新品
            map.put("list",storeProductService.getList(1,20,2));
        }else if(type == 4){//TODO 促销单品
            map.put("list",storeProductService.getList(1,20,3));
        }

        return ApiResult.ok(map);
    }

    /**
     * 获取首页更多产品
     */
    @AnonymousAccess
    @GetMapping("/products")
    @ApiOperation(value = "商品列表",notes = "商品列表")
    public ApiResult<List<YxStoreProductQueryVo>> goodsList(YxStoreProductQueryParam productQueryParam){

        return ApiResult.ok(storeProductService.getGoodsList(productQueryParam));
    }

    /**
     * 为你推荐
     */
    @AnonymousAccess
    @GetMapping("/product/hot")
    @ApiOperation(value = "为你推荐",notes = "为你推荐")
    public ApiResult<List<YxStoreProductQueryVo>> productRecommend(
            @RequestParam(value = "page",defaultValue = "1") int page,
            @RequestParam(value = "limit",defaultValue = "10") int limit){

        return ApiResult.ok(storeProductService.getList(page,limit,1));
    }

    /**
     * 普通商品详情
     */
    @Log(value = "查看商品详情",type = 1)
    @GetMapping("/product/detail/{id}")
    @ApiOperation(value = "普通商品详情",notes = "普通商品详情")
    public ApiResult<ProductDTO> detail(@PathVariable Integer id){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(storeProductService.goodsDetail(id,0,uid));
    }

    /**
     * 添加收藏
     */
    @Log(value = "添加收藏",type = 1)
    @PostMapping("/collect/add")
    @ApiOperation(value = "添加收藏",notes = "添加收藏")
    public ApiResult<Object> collectAdd(@Validated @RequestBody YxStoreProductRelationQueryParam param){
        int uid = SecurityUtils.getUserId().intValue();
        productRelationService.addRroductRelation(param,uid,"collect");
        return ApiResult.ok("success");
    }

    /**
     * 取消收藏
     */
    @Log(value = "取消收藏",type = 1)
    @PostMapping("/collect/del")
    @ApiOperation(value = "取消收藏",notes = "取消收藏")
    public ApiResult<Object> collectDel(@Validated @RequestBody YxStoreProductRelationQueryParam param){
        int uid = SecurityUtils.getUserId().intValue();
        productRelationService.delRroductRelation(param,uid,"collect");
        return ApiResult.ok("success");
    }

    /**
     * 获取产品评论
     */
    @GetMapping("/reply/list/{id}")
    @ApiOperation(value = "获取产品评论",notes = "获取产品评论")
    public ApiResult<Object> replyList(@PathVariable Integer id,
                                       @RequestParam(value = "type",defaultValue = "0") int type,
                                       @RequestParam(value = "page",defaultValue = "1") int page,
                                       @RequestParam(value = "limit",defaultValue = "10") int limit){
        return ApiResult.ok(replyService.getReplyList(id,type,page,limit));
    }

    /**
     * 获取产品评论数据
     */
    @GetMapping("/reply/config/{id}")
    @ApiOperation(value = "获取产品评论数据",notes = "获取产品评论数据")
    public ApiResult<Object> replyCount(@PathVariable Integer id){
        return ApiResult.ok(replyService.getReplyCount(id));
    }














}

