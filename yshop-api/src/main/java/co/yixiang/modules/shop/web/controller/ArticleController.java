package co.yixiang.modules.shop.web.controller;

import co.yixiang.common.api.ApiResult;
import co.yixiang.common.web.controller.BaseController;
import co.yixiang.common.web.vo.Paging;
import co.yixiang.modules.shop.service.ArticleService;
import co.yixiang.modules.shop.web.param.YxArticleQueryParam;
import co.yixiang.modules.shop.web.vo.YxArticleQueryVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 文章 前端控制器
 * </p>
 *
 * @author hupeng
 * @since 2019-10-02
 */
@Slf4j
@RestController
@RequestMapping("/article")
@Api(value = "文章模块", tags = "文章模块", description = "文章模块")
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;


    /**
    * 获取文章文章详情
    */
    @GetMapping("/details/{id}")
    @ApiOperation(value = "文章详情",notes = "文章详情",response = YxArticleQueryVo.class)
    public ApiResult<YxArticleQueryVo> getYxArticle(@PathVariable Integer id) throws Exception{
        YxArticleQueryVo yxArticleQueryVo = articleService.getYxArticleById(id);
        articleService.incVisitNum(id);
        return ApiResult.ok(yxArticleQueryVo);
    }

    /**
     * 文章列表
     */
    @GetMapping("/list")
    @ApiOperation(value = "文章列表",notes = "文章列表",response = YxArticleQueryVo.class)
    public ApiResult<Paging<YxArticleQueryVo>> getYxArticlePageList(
            @RequestParam(value = "page",defaultValue = "1") int page,
            @RequestParam(value = "limit",defaultValue = "10") int limit
    ){
       // throw new ErrorRequestException("error");
        YxArticleQueryParam yxArticleQueryParam = new YxArticleQueryParam();
        yxArticleQueryParam.setCurrent(page);
        yxArticleQueryParam.setSize(limit);
        Paging<YxArticleQueryVo> paging = articleService.getYxArticlePageList(yxArticleQueryParam);
        return ApiResult.ok(paging.getRecords());
    }

}

