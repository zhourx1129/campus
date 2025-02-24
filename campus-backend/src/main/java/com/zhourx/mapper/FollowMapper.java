package com.zhourx.mapper;

import com.zhourx.model.domain.Follow;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* @author zhourx
* @description 针对表【follow】的数据库操作Mapper
* @createDate 2023-06-11 13:02:31
* @Entity com.zhourx.model.domain.Follow
*/
@Mapper
public interface FollowMapper extends BaseMapper<Follow> {

}




