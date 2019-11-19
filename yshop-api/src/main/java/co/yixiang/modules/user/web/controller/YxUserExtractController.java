package co.yixiang.modules.user.web.controller;

import co.yixiang.modules.user.entity.YxUserExtract;
import co.yixiang.modules.user.service.YxUserExtractService;
import co.yixiang.modules.user.web.param.YxUserExtractQueryParam;
import co.yixiang.modules.user.web.vo.YxUserExtractQueryVo;
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
 * 用户提现表 前端控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-11-11
 */
@Slf4j
@RestController
@RequestMapping("/yxUserExtract")
@Api("用户提现表 API")
public class YxUserExtractController extends BaseController {

    @Autowired
    private YxUserExtractService yxUserExtractService;

    /**
    * 添加用户提现表
    */
    @PostMapping("/add")
    @ApiOperation(value = "添加YxUserExtract对象",notes = "添加用户提现表",response = ApiResult.class)
    public ApiResult<Boolean> addYxUserExtract(@Valid @RequestBody YxUserExtract yxUserExtract) throws Exception{
        boolean flag = yxUserExtractService.save(yxUserExtract);
        return ApiResult.result(flag);
    }

    /**
    * 修改用户提现表
    */
    @PostMapping("/update")
    @ApiOperation(value = "修改YxUserExtract对象",notes = "修改用户提现表",response = ApiResult.class)
    public ApiResult<Boolean> updateYxUserExtract(@Valid @RequestBody YxUserExtract yxUserExtract) throws Exception{
        boolean flag = yxUserExtractService.updateById(yxUserExtract);
        return ApiResult.result(flag);
    }

    /**
    * 删除用户提现表
    */
    @PostMapping("/delete")
    @ApiOperation(value = "删除YxUserExtract对象",notes = "删除用户提现表",response = ApiResult.class)
    public ApiResult<Boolean> deleteYxUserExtract(@Valid @RequestBody IdParam idParam) throws Exception{
        boolean flag = yxUserExtractService.removeById(idParam.getId());
        return ApiResult.result(flag);
    }

    /**
    * 获取用户提现表
    */
    @PostMapping("/info")
    @ApiOperation(value = "获取YxUserExtract对象详情",notes = "查看用户提现表",response = YxUserExtractQueryVo.class)
    public ApiResult<YxUserExtractQueryVo> getYxUserExtract(@Valid @RequestBody IdParam idParam) throws Exception{
        YxUserExtractQueryVo yxUserExtractQueryVo = yxUserExtractService.getYxUserExtractById(idParam.getId());
        return ApiResult.ok(yxUserExtractQueryVo);
    }

    /**
     * 用户提现表分页列表
     */
    @PostMapping("/getPageList")
    @ApiOperation(value = "获取YxUserExtract分页列表",notes = "用户提现表分页列表",response = YxUserExtractQueryVo.class)
    public ApiResult<Paging<YxUserExtractQueryVo>> getYxUserExtractPageList(@Valid @RequestBody(required = false) YxUserExtractQueryParam yxUserExtractQueryParam) throws Exception{
        Paging<YxUserExtractQueryVo> paging = yxUserExtractService.getYxUserExtractPageList(yxUserExtractQueryParam);
        return ApiResult.ok(paging);
    }

}

