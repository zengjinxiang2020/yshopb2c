/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co

 */
package co.yixiang.gen.service.mapper;

import co.yixiang.gen.domain.ColumnConfig;
import co.yixiang.common.mapper.CoreMapper;
import co.yixiang.gen.domain.vo.TableInfo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ColumnInfoMapper extends CoreMapper<ColumnConfig> {

    @Select("select table_name ,create_time , engine, table_collation, table_comment from information_schema.tables " +
            "where table_schema = (select database()) and table_name like CONCAT('%',#{name},'%')  order by create_time desc")
    IPage<TableInfo> selectTables(@Param("page") Page page, @Param("name") String name);

    @Select("SELECT COUNT(*) from information_schema.tables where table_schema = (select database()) and table_name like CONCAT('%',#{name},'%') order by create_time desc")
    Integer selectTablesCount(@Param("name") String name);


    @Select("select column_name, is_nullable, data_type, column_comment, column_key, extra from information_schema.columns " +
            "where table_name = #{name} and table_schema = (select database()) order by ordinal_position")
    List queryByTableName(@Param("name") String name);

}
