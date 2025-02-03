package com.zhourx.mapper;

import com.zhourx.model.domain.BlogComments;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* @author zhourx
* @description 针对表【blog_comments】的数据库操作Mapper
* @createDate 2023-06-08 12:44:45
* @Entity com.zhourx.model.domain.BlogComments
*/
@Mapper
public interface BlogCommentsMapper extends BaseMapper<BlogComments> {

}




