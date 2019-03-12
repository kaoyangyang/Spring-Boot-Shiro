package com.infotop.service.impl.sys;

import com.infotop.entity.sys.RolePermission;
import com.infotop.mapper.sys.RolePermissionMapper;
import com.infotop.service.sys.RolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 角色权限关系service实现类
 */
@Service("rolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

	@Autowired
	private RolePermissionMapper rolePermissionMapper;
	

	/**
	 * 新增
	 */
	@Override
	public int insert(RolePermission rolePermission, HttpServletRequest request, String createdUserId) {
		return rolePermissionMapper.insertSelective(rolePermission);
	}

	@Override
	public List<RolePermission> getRolePermissions(Map<String, Object> filterParams) {
		return rolePermissionMapper.selectAll(filterParams);
	}


	@Override
	public int deleteByRoleId(Long roleId, HttpServletRequest request, String createdUserId) {
		//Log log = new Log("RolePermission", "deleteByRoleId", "删除id：" + roleId, OperationUtil.getIpAddr(request), createdUserId);
		//logService.saveLogAndLogData(log, null);
		return rolePermissionMapper.deleteByRoleId(roleId);
	}

	
	@Override
	public int deleteByPermissionId(Long permissionId, HttpServletRequest request, String createdUserId) {
		//Log log = new Log("RolePermission", "delete", "删除权限Id：" + permissionId, OperationUtil.getIpAddr(request), createdUserId);
		//logService.saveLogAndLogData(log, null);
		return rolePermissionMapper.deleteByPermissionId(permissionId);
	}

	@Override
	public List<String> getPermissionValuesByRoleId(Long roleId) {
		return rolePermissionMapper.selectPermissionValuesByRoleId(roleId);
	}

}
