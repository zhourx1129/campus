package com.zhourx.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhourx.model.domain.Chat;
import org.apache.ibatis.annotations.Mapper;

/**
* @author zhourx
* @description 针对表【chat(聊天消息表)】的数据库操作Mapper
* @createDate 2023-06-17 21:50:15
* @Entity com.zhourx.model.domain.Chat
*/
@Mapper
public interface ChatMapper extends BaseMapper<Chat> {

}




