/**
 * Copyright (C) 2018-2020
 * All rights reserved, Designed By www.yixiang.co
 * 注意：
 * 本软件为www.yixiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.yixiang.modules.quartz.config;

import org.quartz.Scheduler;
import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.AdaptableJobFactory;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Component;

/**
 * 定时任务配置
 * @author /
 * @date 2019-01-07
 */
@Configuration
public class QuartzConfig {

	/**
	 * 解决Job中注入Spring Bean为null的问题
	 */
	@Component("quartzJobFactory")
	public static class QuartzJobFactory extends AdaptableJobFactory {

		private final AutowireCapableBeanFactory capableBeanFactory;

		public QuartzJobFactory(AutowireCapableBeanFactory capableBeanFactory) {
			this.capableBeanFactory = capableBeanFactory;
		}

		@Override
		protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {

			//调用父类的方法
			Object jobInstance = super.createJobInstance(bundle);
			capableBeanFactory.autowireBean(jobInstance);
			return jobInstance;
		}
	}

	/**
	 * 注入scheduler到spring
	 * @param quartzJobFactory /
	 * @return Scheduler
	 * @throws Exception /
	 */
	@Bean(name = "scheduler")
	public Scheduler scheduler(QuartzJobFactory quartzJobFactory) throws Exception {
		SchedulerFactoryBean factoryBean=new SchedulerFactoryBean();
		factoryBean.setJobFactory(quartzJobFactory);
		factoryBean.afterPropertiesSet();
		Scheduler scheduler=factoryBean.getScheduler();
		scheduler.start();
		return scheduler;
	}
}
