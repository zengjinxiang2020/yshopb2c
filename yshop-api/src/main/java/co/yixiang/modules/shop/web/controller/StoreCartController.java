package co.yixiang.modules.shop.web.controller;

import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.web.param.IdParam;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.entity.YxStoreCart;
import co.yixiang.modules.shop.service.YxStoreCartService;
import co.yixiang.modules.shop.web.param.YxStoreCartQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;
import co.yixiang.utils.SecurityUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * <p>
 * 购物车控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-10-25
 */
@Slf4j
@RestController
@Api(value = "购物车", tags = "购物车", description = "购物车")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class StoreCartController extends BaseController {

    private final YxStoreCartService storeCartService;

    /**
     * 购物车 获取数量
     */
    @GetMapping("/cart/count")
    @ApiOperation(value = "获取数量",notes = "获取数量")
    public ApiResult<Map<String,Object>> count(@RequestParam(value = "numType",defaultValue = "0") int numType){
        Map<String,Object> map = new LinkedHashMap<>();
        int uid = SecurityUtils.getUserId().intValue();
        map.put("count",storeCartService.getUserCartNum(uid,"product",numType));
        return ApiResult.ok(map);
    }

    /**
     * 购物车 添加
     */
    @PostMapping("/cart/add")
    @ApiOperation(value = "添加购物车",notes = "添加购物车")
    public ApiResult<Map<String,Object>> add(@RequestBody String jsonStr){
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        Map<String,Object> map = new LinkedHashMap<>();
        int uid = SecurityUtils.getUserId().intValue();
        int cartNum = Integer.valueOf(jsonObject.get("cartNum").toString());
        if(cartNum <= 0){
            ApiResult.fail("购物车数量必须大于0");
        }
        int isNew = Integer.valueOf(jsonObject.get("new").toString());
        int productId = Integer.valueOf(jsonObject.get("productId").toString());
        if(productId <= 0){
            ApiResult.fail("产品参数有误");
        }
        String uniqueId = jsonObject.get("uniqueId").toString();

        map.put("cartId",storeCartService.addCart(uid,productId,cartNum,uniqueId
                ,"product",isNew,0,0,0));
        return ApiResult.ok(map);
    }


    /**
     * 购物车列表
     */
    @GetMapping("/cart/list")
    @ApiOperation(value = "购物车列表",notes = "购物车列表")
    public ApiResult<Map<String,Object>> getList(){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(storeCartService.getUserProductCartList(uid,"",0));
    }





}

