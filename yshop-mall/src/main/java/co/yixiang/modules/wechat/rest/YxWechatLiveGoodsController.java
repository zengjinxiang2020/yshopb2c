/**
* Copyright (C) 2018-2020
* All rights reserved, Designed By www.yixiang.co
* 注意：
* 本软件为www.yixiang.co开发研制，未经购买不得使用
* 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
* 一经发现盗用、分享等行为，将追究法律责任，后果自负
*/
package co.yixiang.modules.wechat.rest;
import java.util.Arrays;
import co.yixiang.dozer.service.IGenerator;
import co.yixiang.modules.wechat.service.WxMaLiveGoodsService;
import lombok.AllArgsConstructor;
import co.yixiang.logging.aop.log.Log;
import co.yixiang.modules.wechat.domain.YxWechatLiveGoods;
import co.yixiang.modules.wechat.service.YxWechatLiveGoodsService;
import co.yixiang.modules.wechat.service.dto.YxWechatLiveGoodsQueryCriteria;
import co.yixiang.modules.wechat.service.dto.YxWechatLiveGoodsDto;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

/**
* @author hupeng
* @date 2020-08-11
*/
@AllArgsConstructor
@Api(tags = "yxWechatLiveGoods管理")
@RestController
@RequestMapping("/api/yxWechatLiveGoods")
public class YxWechatLiveGoodsController {

    private final YxWechatLiveGoodsService yxWechatLiveGoodsService;
    private final IGenerator generator;
    private final WxMaLiveGoodsService wxMaLiveGoodsService;

    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('admin','yxWechatLiveGoods:list')")
    public void download(HttpServletResponse response, YxWechatLiveGoodsQueryCriteria criteria) throws IOException {
        yxWechatLiveGoodsService.download(generator.convert(yxWechatLiveGoodsService.queryAll(criteria), YxWechatLiveGoodsDto.class), response);
    }

    @GetMapping
    @Log("查询yxWechatLiveGoods")
    @ApiOperation("查询yxWechatLiveGoods")
    @PreAuthorize("@el.check('admin','yxWechatLiveGoods:list')")
    public ResponseEntity<Object> getYxWechatLiveGoodss(YxWechatLiveGoodsQueryCriteria criteria, Pageable pageable){
        return new ResponseEntity<>(yxWechatLiveGoodsService.queryAll(criteria,pageable),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增yxWechatLiveGoods")
    @ApiOperation("新增yxWechatLiveGoods")
    @PreAuthorize("@el.check('admin','yxWechatLiveGoods:add')")
    public ResponseEntity<Object> create(@Validated @RequestBody YxWechatLiveGoods resources){
        return new ResponseEntity<>(yxWechatLiveGoodsService.saveGoods(resources),HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改yxWechatLiveGoods")
    @ApiOperation("修改yxWechatLiveGoods")
    @PreAuthorize("@el.check('admin','yxWechatLiveGoods:edit')")
    public ResponseEntity<Object> update(@Validated @RequestBody YxWechatLiveGoods resources){
        yxWechatLiveGoodsService.updateGoods(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除yxWechatLiveGoods")
    @ApiOperation("删除yxWechatLiveGoods")
    @PreAuthorize("@el.check('admin','yxWechatLiveGoods:del')")
    @DeleteMapping
    public ResponseEntity<Object> deleteAll(@RequestBody Long[] ids) {
        Arrays.asList(ids).forEach(id->{
                yxWechatLiveGoodsService.removeGoods(id);
        });
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation("同步数据")
    @PostMapping("/synchro")
    public ResponseEntity<Object> synchroWxOlLiveGoods(@RequestBody Integer[] ids) {
        yxWechatLiveGoodsService.synchroWxOlLive(Arrays.asList(ids));
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
