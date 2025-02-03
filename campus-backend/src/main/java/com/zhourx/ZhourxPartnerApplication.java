package com.zhourx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * @author zhourx
 */
@SpringBootApplication
@EnableRedisHttpSession
public class ZhourxPartnerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZhourxPartnerApplication.class, args);
    }

}
