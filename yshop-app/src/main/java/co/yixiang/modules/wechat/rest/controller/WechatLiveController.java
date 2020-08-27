/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.wechat.rest.controller;

import co.yixiang.api.ApiResult;
import co.yixiang.dozer.service.IGenerator;
import co.yixiang.logging.aop.log.Log;
import co.yixiang.modules.wechat.domain.YxWechatLive;
import co.yixiang.modules.wechat.service.YxWechatLiveService;
import co.yixiang.modules.wechat.service.dto.YxWechatLiveDto;
import co.yixiang.modules.wechat.service.dto.YxWechatLiveQueryCriteria;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

/**
* @author hupeng
* @date 2020-08-10
*/
@AllArgsConstructor
@Api(tags = "wxlive管理")
@RestController
@RequestMapping
public class WechatLiveController {

    private final YxWechatLiveService yxWechatLiveService;


    @GetMapping("yxWechatLive")
    @ApiOperation("查询所有直播间")
    public ApiResult<Map<String,Object>> getYxWechatLives(YxWechatLiveQueryCriteria criteria, Pageable pageable){
        return ApiResult.ok(yxWechatLiveService.queryAll(criteria,pageable));
    }

}
