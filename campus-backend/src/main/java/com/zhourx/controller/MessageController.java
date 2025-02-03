package com.zhourx.controller;

import com.zhourx.common.BaseResponse;
import com.zhourx.common.ErrorCode;
import com.zhourx.common.ResultUtils;
import com.zhourx.constants.RedisConstants;
import com.zhourx.exception.BusinessException;
import com.zhourx.model.domain.User;
import com.zhourx.model.vo.BlogVO;
import com.zhourx.model.vo.MessageVO;
import com.zhourx.service.MessageService;
import com.zhourx.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 消息控制器
 *
 * @author zhourx
 * @date 2023/06/22
 */
@RestController
@RequestMapping("/message")
@Api(tags = "消息管理模块")
@CrossOrigin(originPatterns = {"http://localhost:5173", "http://47.121.118.209","http://localhost:5174"}, allowCredentials = "true")
public class MessageController {

    /**
     * 消息服务
     */
    @Resource
    private MessageService messageService;

    /**
     * redis
     */
    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private UserService userService;


    /**
     * 用户是否有新消息
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link Boolean}>
     */
    @GetMapping
    @ApiOperation(value = "用户是否有新消息")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Boolean> userHasNewMessage(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            return ResultUtils.success(false);
        }
        Boolean hasNewMessage = messageService.hasNewMessage(loginUser.getId());
        return ResultUtils.success(hasNewMessage);
    }

    /**
     * 获取用户新消息数量
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link Long}>
     */
    @GetMapping("/num")
    @ApiOperation(value = "获取用户新消息数量")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Long> getUserMessageNum(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            return ResultUtils.success(0L);
        }
        long messageNum = messageService.getMessageNum(loginUser.getId());
        return ResultUtils.success(messageNum);
    }

    /**
     * 获取用户点赞消息数量
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link Long}>
     */
    @GetMapping("/like/num")
    @ApiOperation(value = "获取用户点赞消息数量")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<Long> getUserLikeMessageNum(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        long messageNum = messageService.getLikeNum(loginUser.getId());
        return ResultUtils.success(messageNum);
    }

    /**
     * 获取用户点赞消息
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link List}<{@link MessageVO}>>
     */
    @GetMapping("/like")
    @ApiOperation(value = "获取用户点赞消息")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<MessageVO>> getUserLikeMessage(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        List<MessageVO> messageVOList = messageService.getLike(loginUser.getId());
        return ResultUtils.success(messageVOList);
    }

    /**
     * 获取用户博客消息数量
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link String}>
     */
    @GetMapping("/blog/num")
    @ApiOperation(value = "获取用户博客消息数量")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<String> getUserBlogMessageNum(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        String likeNumKey = RedisConstants.MESSAGE_BLOG_NUM_KEY + loginUser.getId();
        Boolean hasKey = stringRedisTemplate.hasKey(likeNumKey);
        if (Boolean.TRUE.equals(hasKey)) {
            String num = stringRedisTemplate.opsForValue().get(likeNumKey);
            return ResultUtils.success(num);
        } else {
            return ResultUtils.success("0");
        }
    }

    /**
     * 获取用户博客消息
     *
     * @param request 请求
     * @return {@link BaseResponse}<{@link List}<{@link BlogVO}>>
     */
    @GetMapping("/blog")
    @ApiOperation(value = "获取用户博客消息")
    @ApiImplicitParams(
            {@ApiImplicitParam(name = "request", value = "request请求")})
    public BaseResponse<List<BlogVO>> getUserBlogMessage(HttpServletRequest request) {
        User loginUser = userService.getLoginUser(request);
        if (loginUser == null) {
            throw new BusinessException(ErrorCode.NOT_LOGIN);
        }
        List<BlogVO> blogVOList = messageService.getUserBlog(loginUser.getId());
        return ResultUtils.success(blogVOList);
    }
}
