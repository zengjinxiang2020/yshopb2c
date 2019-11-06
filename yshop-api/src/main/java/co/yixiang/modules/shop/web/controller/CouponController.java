package co.yixiang.modules.shop.web.controller;

import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.service.YxArticleService;
import co.yixiang.modules.shop.web.param.YxArticleQueryParam;
import co.yixiang.modules.shop.web.vo.YxArticleQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 优惠券 todo
 * </p>
 *
 * @author hupeng
 * @since 2019-10-02
 */
@Slf4j
@RestController
@Api(value = "优惠券", tags = "优惠券", description = "优惠券")
public class CouponController extends BaseController {





    /**
     * 优惠券列表
     */
    @GetMapping("/coupons")
    @ApiOperation(value = "优惠券列表",notes = "优惠券列表",response = YxArticleQueryVo.class)
    public ApiResult<List> getList(
            @RequestParam(value = "page",defaultValue = "1") int page,
            @RequestParam(value = "limit",defaultValue = "10") int limit
    ){
        // todo
        List list = new ArrayList();
        return ApiResult.ok(list);
    }

}

