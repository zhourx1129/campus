package com.zhourx.mapper;

import com.zhourx.model.domain.Blog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* @author zhourx
* @description 针对表【blog】的数据库操作Mapper
* @createDate 2023-06-03 15:54:34
* @Entity com.zhourx.model.domain.Blog
 */
@Mapper
public interface BlogMapper extends BaseMapper<Blog> {

}




