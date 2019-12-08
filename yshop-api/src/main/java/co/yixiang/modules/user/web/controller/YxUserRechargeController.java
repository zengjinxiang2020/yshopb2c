package co.yixiang.modules.user.web.controller;

import co.yixiang.modules.user.entity.YxUserRecharge;
import co.yixiang.modules.user.service.YxUserRechargeService;
import co.yixiang.modules.user.web.param.YxUserRechargeQueryParam;
import co.yixiang.modules.user.web.vo.YxUserRechargeQueryVo;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.api.ApiResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

import co.yixiang.common.web.vo.Paging;
import co.yixiang.common.web.param.IdParam;

/**
 * <p>
 * 用户充值表 前端控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-12-08
 */
@Slf4j
@RestController
@RequestMapping("/yxUserRecharge")
@Api("用户充值表 API")
public class YxUserRechargeController extends BaseController {

    @Autowired
    private YxUserRechargeService yxUserRechargeService;

    /**
    * 添加用户充值表
    */
    @PostMapping("/add")
    @ApiOperation(value = "添加YxUserRecharge对象",notes = "添加用户充值表",response = ApiResult.class)
    public ApiResult<Boolean> addYxUserRecharge(@Valid @RequestBody YxUserRecharge yxUserRecharge) throws Exception{
        boolean flag = yxUserRechargeService.save(yxUserRecharge);
        return ApiResult.result(flag);
    }

    /**
    * 修改用户充值表
    */
    @PostMapping("/update")
    @ApiOperation(value = "修改YxUserRecharge对象",notes = "修改用户充值表",response = ApiResult.class)
    public ApiResult<Boolean> updateYxUserRecharge(@Valid @RequestBody YxUserRecharge yxUserRecharge) throws Exception{
        boolean flag = yxUserRechargeService.updateById(yxUserRecharge);
        return ApiResult.result(flag);
    }

    /**
    * 删除用户充值表
    */
    @PostMapping("/delete")
    @ApiOperation(value = "删除YxUserRecharge对象",notes = "删除用户充值表",response = ApiResult.class)
    public ApiResult<Boolean> deleteYxUserRecharge(@Valid @RequestBody IdParam idParam) throws Exception{
        boolean flag = yxUserRechargeService.removeById(idParam.getId());
        return ApiResult.result(flag);
    }

    /**
    * 获取用户充值表
    */
    @PostMapping("/info")
    @ApiOperation(value = "获取YxUserRecharge对象详情",notes = "查看用户充值表",response = YxUserRechargeQueryVo.class)
    public ApiResult<YxUserRechargeQueryVo> getYxUserRecharge(@Valid @RequestBody IdParam idParam) throws Exception{
        YxUserRechargeQueryVo yxUserRechargeQueryVo = yxUserRechargeService.getYxUserRechargeById(idParam.getId());
        return ApiResult.ok(yxUserRechargeQueryVo);
    }

    /**
     * 用户充值表分页列表
     */
    @PostMapping("/getPageList")
    @ApiOperation(value = "获取YxUserRecharge分页列表",notes = "用户充值表分页列表",response = YxUserRechargeQueryVo.class)
    public ApiResult<Paging<YxUserRechargeQueryVo>> getYxUserRechargePageList(@Valid @RequestBody(required = false) YxUserRechargeQueryParam yxUserRechargeQueryParam) throws Exception{
        Paging<YxUserRechargeQueryVo> paging = yxUserRechargeService.getYxUserRechargePageList(yxUserRechargeQueryParam);
        return ApiResult.ok(paging);
    }

}

