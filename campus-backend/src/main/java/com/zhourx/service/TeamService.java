package com.zhourx.service;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhourx.model.domain.Team;
import com.zhourx.model.domain.User;
import com.zhourx.model.request.*;
import com.zhourx.model.vo.TeamVO;
import com.zhourx.model.vo.UserVO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @author zhourx
* @description 针对表【team(队伍)】的数据库操作Service
* @createDate 2023-05-12 19:33:37
*/
public interface TeamService extends IService<Team> {

    @Transactional(rollbackFor = Exception.class)
    long addTeam(Team team, User loginUser);

    Page<TeamVO> listTeams(long currentPage, TeamQueryRequest teamQuery, boolean isAdmin);

    boolean updateTeam(TeamUpdateRequest teamUpdateRequest, User loginUser);

    boolean joinTeam(TeamJoinRequest teamJoinRequest, User loginUser);

    @Transactional(rollbackFor = Exception.class)
    boolean quitTeam(TeamQuitRequest teamQuitRequest, User loginUser);

    boolean deleteTeam(long id, User loginUser,boolean isAdmin);

    TeamVO getTeam(Long teamId,Long userId);

    Page<TeamVO> listMyJoin(long currentPage, TeamQueryRequest teamQuery);

    List<UserVO> getTeamMember(Long teamId, Long userId);

    List<TeamVO> listAllMyJoin(Long id);

    void changeCoverImage(TeamCoverUpdateRequest request, Long userId, boolean admin);

    void kickOut(Long teamId, Long userId, Long loginUserId,boolean admin);

    Page<TeamVO> listMyCreate(long currentPage, Long userId);

    /**
     * 获取查询条件
     *
     * @param teamQueryRequest
     * @return
     */
    QueryWrapper<Team> getQueryWrapper(TeamQueryRequest teamQueryRequest);

}
