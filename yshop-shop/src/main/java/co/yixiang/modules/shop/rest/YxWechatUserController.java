/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.shop.rest;
import java.util.Arrays;
import co.yixiang.dozer.service.IGenerator;
import lombok.AllArgsConstructor;
import co.yixiang.logging.aop.log.Log;
import co.yixiang.modules.shop.domain.YxWechatUser;
import co.yixiang.modules.shop.service.YxWechatUserService;
import co.yixiang.modules.shop.service.dto.YxWechatUserQueryCriteria;
import co.yixiang.modules.shop.service.dto.YxWechatUserDto;
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
* @date 2020-05-12
*/
@AllArgsConstructor
@Api(tags = "微信用户管理")
@RestController
@RequestMapping("/api/yxWechatUser")
public class YxWechatUserController {

    private final YxWechatUserService yxWechatUserService;
    private final IGenerator generator;


    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('admin','yxWechatUser:list')")
    public void download(HttpServletResponse response, YxWechatUserQueryCriteria criteria) throws IOException {
        yxWechatUserService.download(generator.convert(yxWechatUserService.queryAll(criteria), YxWechatUserDto.class), response);
    }

    @GetMapping
    @Log("查询微信用户")
    @ApiOperation("查询微信用户")
    @PreAuthorize("@el.check('admin','yxWechatUser:list')")
    public ResponseEntity<Object> getYxWechatUsers(YxWechatUserQueryCriteria criteria, Pageable pageable){
        return new ResponseEntity<>(yxWechatUserService.queryAll(criteria,pageable),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增微信用户")
    @ApiOperation("新增微信用户")
    @PreAuthorize("@el.check('admin','yxWechatUser:add')")
    public ResponseEntity<Object> create(@Validated @RequestBody YxWechatUser resources){
        return new ResponseEntity<>(yxWechatUserService.save(resources),HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改微信用户")
    @ApiOperation("修改微信用户")
    @PreAuthorize("@el.check('admin','yxWechatUser:edit')")
    public ResponseEntity<Object> update(@Validated @RequestBody YxWechatUser resources){
        yxWechatUserService.updateById(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除微信用户")
    @ApiOperation("删除微信用户")
    @PreAuthorize("@el.check('admin','yxWechatUser:del')")
    @DeleteMapping
    public ResponseEntity<Object> deleteAll(@RequestBody Integer[] ids) {
        Arrays.asList(ids).forEach(id->{
            yxWechatUserService.removeById(id);
        });
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
