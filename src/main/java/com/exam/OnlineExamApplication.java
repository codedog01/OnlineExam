package com.exam;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan(basePackages = "com.exam.mapper")
public class OnlineExamApplication {
	public static void main(String[] args) {
		SpringApplication.run(OnlineExamApplication.class, args);
	}
}
