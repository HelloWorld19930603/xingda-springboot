package com.xingda.xingdaspringboot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "com.xingda")
@SpringBootApplication
@MapperScan("com.xingda.maintenance.mapper")
public class XingdaSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(XingdaSpringbootApplication.class, args);
    }

}

