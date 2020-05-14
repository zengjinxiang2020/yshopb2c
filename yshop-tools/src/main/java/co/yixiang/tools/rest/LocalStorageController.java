/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.tools.rest;
import java.util.Arrays;
import co.yixiang.dozer.service.IGenerator;
import lombok.AllArgsConstructor;
import co.yixiang.aop.log.Log;
import co.yixiang.tools.domain.LocalStorage;
import co.yixiang.tools.service.LocalStorageService;
import co.yixiang.tools.service.dto.LocalStorageQueryCriteria;
import co.yixiang.tools.service.dto.LocalStorageDto;
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
* @date 2020-05-13
*/
@AllArgsConstructor
@Api(tags = "文件管理")
@RestController
@RequestMapping("/api/localStorage")
public class LocalStorageController {

    private final LocalStorageService localStorageService;
    private final IGenerator generator;


    @Log("导出数据")
    @ApiOperation("导出数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('admin','localStorage:list')")
    public void download(HttpServletResponse response, LocalStorageQueryCriteria criteria) throws IOException {
        localStorageService.download(generator.convert(localStorageService.queryAll(criteria), LocalStorageDto.class), response);
    }

    @GetMapping
    @Log("查询文件")
    @ApiOperation("查询文件")
    @PreAuthorize("@el.check('admin','localStorage:list')")
    public ResponseEntity<Object> getLocalStorages(LocalStorageQueryCriteria criteria, Pageable pageable){
        return new ResponseEntity<>(localStorageService.queryAll(criteria,pageable),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增文件")
    @ApiOperation("新增文件")
    @PreAuthorize("@el.check('admin','localStorage:add')")
    public ResponseEntity<Object> create(@Validated @RequestBody LocalStorage resources){
        return new ResponseEntity<>(localStorageService.save(resources),HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改文件")
    @ApiOperation("修改文件")
    @PreAuthorize("@el.check('admin','localStorage:edit')")
    public ResponseEntity<Object> update(@Validated @RequestBody LocalStorage resources){
        localStorageService.updateById(resources);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @Log("删除文件")
    @ApiOperation("删除文件")
    @PreAuthorize("@el.check('admin','localStorage:del')")
    @DeleteMapping
    public ResponseEntity<Object> deleteAll(@RequestBody Long[] ids) {
        Arrays.asList(ids).forEach(id->{
            localStorageService.removeById(id);
        });
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
