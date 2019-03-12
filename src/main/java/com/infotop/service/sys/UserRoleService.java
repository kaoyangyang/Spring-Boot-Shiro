package com.infotop.service.sys;


import com.infotop.entity.sys.UserRole;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * 用户角色service
 * 
 * 2016年10月26日下午4:33:37
 */

public interface UserRoleService {
	//获取用户角色
	List<UserRole> getUserRoles(Map<String, Object> filterMap);
	//新增用户角色关系
	int insert(UserRole userRole, HttpServletRequest request, String createdUserId);
	//根据用户id删除用户-角色关系
	int deleteByUserId(Long userId, HttpServletRequest request, String createdUserId);
	//根据角色Id删除用户-角色关系
	int deleteByRoleId(Long roleId, HttpServletRequest request, String createdUserId);

}
