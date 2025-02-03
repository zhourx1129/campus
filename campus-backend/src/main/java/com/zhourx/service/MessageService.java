package com.zhourx.service;

import com.zhourx.model.domain.Message;
import com.zhourx.model.vo.BlogVO;
import com.zhourx.model.vo.MessageVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author zhourx
* @description 针对表【message】的数据库操作Service
* @createDate 2023-06-21 17:39:30
*/
public interface MessageService extends IService<Message> {

    long getMessageNum(Long userId);

    long getLikeNum(Long userId);

    List<MessageVO> getLike(Long userId);

    List<BlogVO> getUserBlog(Long userId);

    Boolean hasNewMessage(Long userId);
}
