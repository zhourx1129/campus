package com.zhourx.model.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户登录请求
 *
 * @author zhourx
 * @date 2023/06/22
 */
@Data
@ApiModel(value = "用户登录请求")
public class UserLoginRequest implements Serializable {
    /**
     * 串行版本uid
     */
    private static final long serialVersionUID = 3191241716373120793L;

    /**
     * 用户帐户
     */
    @ApiModelProperty(value = "用户账号")
    private String userAccount;

    /**
     * 用户密码
     */
    @ApiModelProperty(value = "用户密码")
    private String userPassword;

}
