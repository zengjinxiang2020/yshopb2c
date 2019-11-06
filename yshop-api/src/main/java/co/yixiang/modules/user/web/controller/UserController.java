package co.yixiang.modules.user.web.controller;

import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.web.param.IdParam;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.order.service.YxStoreOrderService;
import co.yixiang.modules.shop.service.YxStoreProductRelationService;
import co.yixiang.modules.shop.service.YxSystemGroupDataService;
import co.yixiang.modules.user.entity.YxUser;
import co.yixiang.modules.user.service.YxUserService;
import co.yixiang.modules.user.web.param.YxUserQueryParam;
import co.yixiang.modules.user.web.vo.YxUserQueryVo;
import co.yixiang.utils.SecurityUtils;
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
 * 用户控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-10-16
 */
@Slf4j
@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(value = "用户中心", tags = "用户中心", description = "用户中心")
public class UserController extends BaseController {

    private final YxUserService yxUserService;
    private final YxSystemGroupDataService systemGroupDataService;
    private final YxStoreOrderService orderService;
    private final YxStoreProductRelationService relationService;



    /**
     * 用户资料
     */
    @GetMapping("/userinfo")
    @ApiOperation(value = "获取用户信息",notes = "获取用户信息",response = YxUserQueryVo.class)
    public ApiResult<Object> userInfo(){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(yxUserService.getYxUserById(uid));
    }

    /**
     * 获取个人中心菜单
     */
    @GetMapping("/menu/user")
    @ApiOperation(value = "获取个人中心菜单",notes = "获取个人中心菜单")
    public ApiResult<Map<String,Object>> userMenu(){
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("routine_my_menus",systemGroupDataService.getDatas("routine_my_menus"));
        return ApiResult.ok(map);
    }

    /**
     * 个人中心
     */
    @GetMapping("/user")
    @ApiOperation(value = "个人中心",notes = "个人中心")
    public ApiResult<Object> user(){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(yxUserService.getYxUserById(uid));
    }

    /**
     * 订单统计数据
     */
    @GetMapping("/order/data")
    @ApiOperation(value = "订单统计数据",notes = "订单统计数据")
    public ApiResult<Object> orderData(){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(orderService.orderData(uid));
    }

    /**
     * 获取收藏产品
     */
    @GetMapping("/collect/user")
    @ApiOperation(value = "获取收藏产品",notes = "获取收藏产品")
    public ApiResult<Object> collectUser(@RequestParam(value = "page",defaultValue = "1") int page,
                                         @RequestParam(value = "limit",defaultValue = "10") int limit){
        int uid = SecurityUtils.getUserId().intValue();
        return ApiResult.ok(relationService.userCollectProduct(page,limit,uid));
    }

    /**
     * 用户资金统计
     */
    @GetMapping("/user/balance")
    @ApiOperation(value = "用户资金统计",notes = "用户资金统计")
    public ApiResult<Object> collectUser(){
        int uid = SecurityUtils.getUserId().intValue();
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("now_money",yxUserService.getYxUserById(uid).getNowMoney());
        map.put("orderStatusSum",orderService.orderData(uid).getSumPrice());
        map.put("recharge",0);
        return ApiResult.ok(map);
    }

    /**
     * 获取活动状态
     */
    @GetMapping("/user/activity")
    @ApiOperation(value = "获取活动状态",notes = "获取活动状态")
    public ApiResult<Object> activity(){
        Map<String,Object> map = new LinkedHashMap<>();
        map.put("is_bargin",false);
        map.put("is_pink",false);
        map.put("is_seckill",false);
        return ApiResult.ok(map);
    }

    /**
     * 获取活动状态
     */
    @PostMapping("/sign/user")
    @ApiOperation(value = "获取活动状态",notes = "获取活动状态")
    public ApiResult<Object> sign(){
        return ApiResult.fail("开发中");
    }



}

