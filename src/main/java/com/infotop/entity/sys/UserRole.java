package com.infotop.entity.sys;

import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 用户角色关系表
 * 数据库表:sys_user_role
 * 
 * 2016年10月17日上午10:58:14
 */
@TableName("sys_user_role")
public class UserRole {
    private Long id;
    private Long userId;	//用户表id
    private Long roleId;	//角色表id

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}