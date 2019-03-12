package com.infotop.entity.sys;

/**
 * 角色权限表
 * 数据库表：sys_role_permission
 * 
 * 2016年10月17日上午11:01:09
 */
public class RolePermission {
    private Long id;
    private Long roleId;			//角色表id
    private Long permissionId;	//权限表id值
    private String permissionValue;	//权限表权限值

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

	public String getPermissionValue() {
		return permissionValue;
	}

	public void setPermissionValue(String permissionValue) {
		this.permissionValue = permissionValue;
	}

	public Long getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(Long permissionId) {
		this.permissionId = permissionId;
	}
}