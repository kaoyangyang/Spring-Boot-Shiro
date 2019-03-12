package com.infotop.service.impl.sys;

import com.infotop.entity.sys.UserRole;
import com.infotop.mapper.sys.UserRoleMapper;
import com.infotop.service.sys.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 用户-角色service实现
 * 
 * 2016年10月26日下午4:39:03
 */
@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public List<UserRole> getUserRoles(Map<String, Object> filterMap) {
		return userRoleMapper.selectAll(filterMap);
	}

	@Override
	public int insert(UserRole userRole, HttpServletRequest request, String createdUserId) {
		return userRoleMapper.insert(userRole);
	}

	@Override
	public int deleteByUserId(Long userId, HttpServletRequest request, String createdUserId) {
		return userRoleMapper.deleteByUserId(userId);
	}

	@Override
	public int deleteByRoleId(Long roleId, HttpServletRequest request, String createdUserId) {
		return userRoleMapper.deleteByRoleId(roleId);
	}
	

}
