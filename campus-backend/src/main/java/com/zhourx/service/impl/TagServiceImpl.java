package com.zhourx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhourx.mapper.TagMapper;
import com.zhourx.model.domain.Tag;
import com.zhourx.service.TagService;
import org.springframework.stereotype.Service;

/**
* @author zhourx
* @description 针对表【tag】的数据库操作Service实现
* @createDate 2023-05-07 19:05:01
*/
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements TagService {
}




