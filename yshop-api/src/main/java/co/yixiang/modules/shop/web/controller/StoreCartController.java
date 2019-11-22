package co.yixiang.modules.shop.web.controller;

import cn.hutool.core.util.ObjectUtil;
import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.web.param.IdParam;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.entity.YxStoreCart;
import co.yixiang.modules.shop.service.YxStoreCartService;
import co.yixiang.modules.shop.web.param.CartIdsParm;
import co.yixiang.modules.shop.web.param.YxStoreCartQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCartQueryVo;
import co.yixiang.utils.SecurityUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.JsonArray;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.List;
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
        if(ObjectUtil.isNull(jsonObject.get("cartNum")) || ObjectUtil.isNull(jsonObject.get("productId"))){
            ApiResult.fail("参数有误");
        }
        int cartNum = jsonObject.getInteger("cartNum");
        if(cartNum <= 0){
            ApiResult.fail("购物车数量必须大于0");
        }
        int isNew = 1;
        if(ObjectUtil.isNotNull(jsonObject.get("new"))){
            isNew = jsonObject.getInteger("new");
        }
        int productId = jsonObject.getInteger("productId");
        if(productId <= 0){
            ApiResult.fail("产品参数有误");
        }
        String uniqueId = jsonObject.get("uniqueId").toString();

        //拼团
        int combinationId = 0;
        if(ObjectUtil.isNotNull(jsonObject.get("combinationId"))){
            combinationId = jsonObject.getInteger("combinationId");
        }

        map.put("cartId",storeCartService.addCart(uid,productId,cartNum,uniqueId
                ,"product",isNew,combinationId,0,0));
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

    /**
     * 修改产品数量
     */
    @PostMapping("/cart/num")
    @ApiOperation(value = "修改产品数量",notes = "修改产品数量")
    public ApiResult<Object> cartNum(@RequestBody String jsonStr){
        int uid = SecurityUtils.getUserId().intValue();
        JSONObject jsonObject = JSON.parseObject(jsonStr);
        if(ObjectUtil.isNull(jsonObject.get("id")) || ObjectUtil.isNull(jsonObject.get("number"))){
            ApiResult.fail("参数错误");
        }
        storeCartService.changeUserCartNum(jsonObject.getInteger("id"),
                jsonObject.getInteger("number"),uid);
        return ApiResult.ok("ok");
    }

    /**
     * 购物车删除产品
     */
    @PostMapping("/cart/del")
    @ApiOperation(value = "购物车删除产品",notes = "购物车删除产品")
    public ApiResult<Object> cartDel(@Validated @RequestBody CartIdsParm parm){
        int uid = SecurityUtils.getUserId().intValue();
//        JSONObject jsonObject = JSON.parseObject(jsonStr);
//        if(ObjectUtil.isNull(jsonObject.get("ids"))){
//            ApiResult.fail("参数错误");
//        }
        storeCartService.removeUserCart(uid, parm.getIds());

        return ApiResult.ok("ok");
    }





}

