package com.zhourx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhourx.model.domain.User;

import java.util.List;

/**
* @author zhourx
* @description 针对表【user】的数据库操作Mapper
* @createDate 2023-05-07 19:56:01
* @Entity generator.domain.User
*/
public interface UserMapper extends BaseMapper<User> {

    List<User> getRandomUser();
}




