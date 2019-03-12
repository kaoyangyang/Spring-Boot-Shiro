package com.infotop.service.sys;


import com.infotop.entity.sys.RolePermission;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**  
 * 角色权限关系service
 */

public interface RolePermissionService {
	//新增
	int insert(RolePermission rolePermission, HttpServletRequest request, String createdUserId);
	//获取角色数据列表
	List<RolePermission> getRolePermissions(Map<String, Object> searchParams);
	//根据角色id删除
	int deleteByRoleId(Long roleId, HttpServletRequest request, String createdUserId);
	//根据权限名称删除
	int deleteByPermissionId(Long permissionId, HttpServletRequest request, String createdUserId);
	List<String> getPermissionValuesByRoleId(Long id);
}
