package com.zhourx.controller;

import com.zhourx.common.BaseResponse;
import com.zhourx.common.ErrorCode;
import com.zhourx.common.ResultUtils;
import com.zhourx.manager.RedisLimiterManager;
import com.zhourx.model.domain.User;
import com.zhourx.model.vo.UserVO;
import com.zhourx.service.FollowService;
import com.zhourx.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import com.zhourx.exception.BusinessException;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 关注接口
 *
 * @author zhourx
 * @date 2023/06/11
 */
@RestController
@RequestMapping("/follow")
@Api(tags = "关注管理模块")
@CrossOrigin(originPatterns = {"http://localhost:5173", "http://47.121.118.209","http://localhost:5174"}, allowCredentials = "true")
public class FollowController {
    /**
     * 关注服务
     */
    @Resource
    private FollowService followService;

    @Resource
    private UserService userService;

    @Resource
    private RedisLimiterManager limiterManager;

    /**
     * 关注用户
     *
     * @param id      id
     * @param request 请求
     * @return {@link BaseResponse}<{@link String}>
     */
    @PostMapping("/{id}")
    @ApiOperation(value = "关注用户")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "id", value = "关注用户id"),
                    @ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<String> followUser(@PathVariable Long id, HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN, "未登录");
        }
        // 限流
        boolean rateLimit = limiterManager.doRateLimit(loginUser.getId().toString());
        if (!rateLimit) {
            throw new BusinessException(ErrorCode.TOO_MANY_REQUEST, "请求过于频繁");
        }
        followService.followUser(id, loginUser.getId());
        return ResultUtils.success("ok");
    }

    /**
     * 获取粉丝
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link List}<{@link UserVO}>>
     */
    @GetMapping("/fans")
    @ApiOperation(value = "获取粉丝")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<UserVO>> listFans(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        List<UserVO> userVOList = followService.listFans(loginUser.getId());
        return ResultUtils.success(userVOList);
    }

    /**
     * 获取我关注的用户
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link List}<{@link UserVO}>>
     */
    @GetMapping("/my")
    @ApiOperation(value = "获取我关注的用户")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<UserVO>> listMyFollow(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        List<UserVO> userVOList = followService.listMyFollow(loginUser.getId());
        return ResultUtils.success(userVOList);
    }
}
