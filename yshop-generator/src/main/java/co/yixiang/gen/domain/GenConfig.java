/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.gen.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * 代码生成配置
 * @author Zheng Jie
 * @date 2019-01-03
 */
@Data
@Entity
@NoArgsConstructor
@Table(name = "gen_config")
public class GenConfig {

    public GenConfig(String tableName) {
        this.cover = false;
        this.moduleName = "yshop-system";
        this.tableName = tableName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @NotBlank
    private String tableName;

    /** 接口名称 **/
    private String apiAlias;

    /** 包路径 */
    @NotBlank
    private String pack;

    /** 模块名 */
    @Column(name = "module_name")
    @NotBlank
    private String moduleName;

    /** 前端文件路径 */
    @NotBlank
    private String path;

    /** 前端文件路径 */
    @Column(name = "api_path")
    private String apiPath;

    /** 作者 */
    private String author;

    /** 表前缀 */
    private String prefix;

    /** 是否覆盖 */
    private Boolean cover;
}
