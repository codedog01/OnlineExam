package com.exam.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		/*添加视图映射配置*/
		registry.addViewController("/").setViewName("index/index");
		registry.addViewController("/manager").setViewName("manager/manager");
		registry.addViewController("/kickout").setViewName("system/kickout");
	}
	
}
