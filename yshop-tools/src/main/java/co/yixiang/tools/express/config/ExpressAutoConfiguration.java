/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.tools.express.config;

import co.yixiang.tools.express.ExpressService;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties(ExpressProperties.class)
public class ExpressAutoConfiguration {

    private final ExpressProperties properties;

    public ExpressAutoConfiguration(ExpressProperties properties) {
        this.properties = properties;
    }

    @Bean
    public ExpressService expressService() {
        ExpressService expressService = new ExpressService();
        expressService.setProperties(properties);
        return expressService;
    }

}
