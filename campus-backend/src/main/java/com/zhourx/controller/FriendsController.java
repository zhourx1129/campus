package com.zhourx.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhourx.common.BaseResponse;
import com.zhourx.common.ErrorCode;
import com.zhourx.common.ResultUtils;
import com.zhourx.exception.BusinessException;
import com.zhourx.model.domain.Friends;
import com.zhourx.model.domain.User;
import com.zhourx.model.request.FriendAddRequest;
import com.zhourx.model.vo.FriendsRecordVO;
import com.zhourx.service.FriendsService;
import com.zhourx.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 好友控制器
 *
 * @author zhourx
 * @date 2023/06/19
 */
@RestController
@RequestMapping("/friends")
@Api(tags = "好友管理模块")
@CrossOrigin(originPatterns = {"http://localhost:5173", "http://47.121.118.209", "http://localhost:5174"}, allowCredentials = "true")
public class FriendsController {
    /**
     * 好友服务
     */
    @Resource
    private FriendsService friendsService;

    /**
     * 用户服务
     */
    @Resource
    private UserService userService;

    /**
     * 添加好友
     *
     * @param friendAddRequest 好友添加请求
     * @param request          请求
     * @return {@link BaseResponse}<{@link Boolean}>
     */
    @PostMapping("/add")
    @ApiOperation(value = "添加好友")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "friendAddRequest", value = "好友添加请求"),
                    @ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Boolean> addFriendRecords(@RequestBody FriendAddRequest friendAddRequest, HttpServletRequest request) {
        if (friendAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "请求有误");
        }
        User loginUser = userService.getLoginUser(request);
        boolean addStatus = friendsService.addFriendRecords(loginUser, friendAddRequest);
        return ResultUtils.success(addStatus);
    }

    /**
     * 查询记录
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link List}<{@link FriendsRecordVO}>>
     */
    @GetMapping("/getRecords")
    @ApiOperation(value = "查询记录")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<FriendsRecordVO>> getRecords(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        List<FriendsRecordVO> friendsList = friendsService.obtainFriendApplicationRecords(loginUser);
        return ResultUtils.success(friendsList);
    }

    /**
     * 获取未读记录条数
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link Integer}>
     */
    @GetMapping("/getRecordCount")
    @ApiOperation(value = "查询记录")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Integer> getRecordCount(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        int recordCount = friendsService.getRecordCount(loginUser);
        return ResultUtils.success(recordCount);
    }

    /**
     * 获取我申请的记录
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link List}<{@link FriendsRecordVO}>>
     */
    @GetMapping("/getMyRecords")
    @ApiOperation(value = "获取我申请的记录")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<FriendsRecordVO>> getMyRecords(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        List<FriendsRecordVO> myFriendsList = friendsService.getMyRecords(loginUser);
        return ResultUtils.success(myFriendsList);
    }

    /**
     * 获取好友列表
     *
     * @param request 请求
     */
    @GetMapping("/my/list")
    @ApiOperation(value = "我的好友")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<User>> searchUsersByUserName(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        Long loginUserId = loginUser.getId();
        List<Friends> friendsList = friendsService.list(new QueryWrapper<Friends>()
                .eq("receive_id", loginUserId)
                .eq("status", 1));
        // 使用流和Lambda表达式进行过滤查询
        List<User> userList = friendsList.stream().map(friends -> userService.getById(friends.getFromId())).collect(Collectors.toList());
        return ResultUtils.success(userList);
    }

    /**
     * 同意申请
     *
     * @param fromId  从id
     * @param request 请求
     * @return {@link BaseResponse}<{@link Boolean}>
     */
    @PostMapping("/agree/{fromId}")
    @ApiOperation(value = "同意申请")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "fromId", value = "申请id"),
                    @ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Boolean> agreeToApply(@PathVariable("fromId") Long fromId, HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        // 接收者
        boolean agreeToApplyStatus = friendsService.agreeToApply(loginUser, fromId);
        return ResultUtils.success(agreeToApplyStatus);
    }

    /**
     * 取消申请
     *
     * @param id      id
     * @param request 请求
     * @return {@link BaseResponse}<{@link Boolean}>
     */
    @PostMapping("/canceledApply/{id}")
    @ApiOperation(value = "取消申请")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "id", value = "申请id"),
                    @ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Boolean> canceledApply(@PathVariable("id") Long id, HttpServletRequest request) {
        if (id == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR, "请求有误");
        }
        User loginUser = userService.getLoginUser(request);
        boolean canceledApplyStatus = friendsService.canceledApply(id, loginUser);
        return ResultUtils.success(canceledApplyStatus);
    }

    /**
     * 阅读
     *
     * @param ids     id
     * @param request 请求
     * @return {@link BaseResponse}<{@link Boolean}>
     */
    @GetMapping("/read")
    @ApiOperation(value = "阅读")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "ids", value = "申请id"),
                    @ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Boolean> toRead(@RequestParam(required = false) Set<Long> ids, HttpServletRequest request) {
        if (CollectionUtils.isEmpty(ids)) {
            return ResultUtils.success(false);
        }
        User loginUser = userService.getLoginUser(request);
        boolean isRead = friendsService.toRead(loginUser, ids);
        return ResultUtils.success(isRead);
    }

    /**
     * 获取未阅读过的申请列表
     *
     * @param request 请求
     * @return {@link BaseResponse}
     */
    @GetMapping("/noRead/Num")
    @ApiOperation(value = "阅读")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Long> applyNoReadNum(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        long messageNum = friendsService.applyNoRead(loginUser.getId());
        return ResultUtils.success(messageNum);
    }
}
