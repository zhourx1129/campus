package com.zhourx.controller;

import com.zhourx.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.time.LocalDate;

/**
 * @author zhourx 2023/9/16 20:42
 */
@SpringBootTest
class UserControllerTest {
    @Resource
    private UserService userService;
    @Test
    void userSigIn() {

    }

    public static void main(String[] args) {
        LocalDate today = LocalDate.now();
        System.out.println(today);
    }
}