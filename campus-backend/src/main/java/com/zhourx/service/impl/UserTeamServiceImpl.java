package com.zhourx.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhourx.mapper.UserTeamMapper;
import com.zhourx.model.domain.UserTeam;
import com.zhourx.service.UserTeamService;
import org.springframework.stereotype.Service;

/**
* @author zhourx
* @description 针对表【user_team(用户队伍关系)】的数据库操作Service实现
* @createDate 2023-05-14 11:45:06
*/
@Service
public class UserTeamServiceImpl extends ServiceImpl<UserTeamMapper, UserTeam>
    implements UserTeamService {

}




