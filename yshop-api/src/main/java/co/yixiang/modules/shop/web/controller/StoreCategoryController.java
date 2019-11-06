package co.yixiang.modules.shop.web.controller;

import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.web.param.IdParam;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.entity.YxStoreCategory;
import co.yixiang.modules.shop.service.YxStoreCategoryService;
import co.yixiang.modules.shop.web.param.YxStoreCategoryQueryParam;
import co.yixiang.modules.shop.web.vo.YxStoreCategoryQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * <p>
 * 商品分类前端控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-10-22
 */
@Slf4j
@RestController
@Api("商品分类表 API")
public class StoreCategoryController extends BaseController {

    @Autowired
    private YxStoreCategoryService yxStoreCategoryService;


    /**
     * 商品分类列表
     */
    @GetMapping("/category")
    @ApiOperation(value = "商品分类列表",notes = "商品分类列表")
    public ApiResult<Paging<YxStoreCategoryQueryVo>> getYxStoreCategoryPageList(){

        return ApiResult.ok(yxStoreCategoryService.getList());
    }

}

