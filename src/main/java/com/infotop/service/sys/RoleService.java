package com.infotop.service.sys;


import com.infotop.entity.sys.Role;
import com.infotop.utils.Tree;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**  
 * 角色Service接口
 */

public interface RoleService {
	//新增
	int insert(Role role, HttpServletRequest request, String createdUserId);
	//根据id获取数据
	Role getRoleById(Long id);
	//获取角色数据列表
	List<Role> getRoles(Map<String, Object> searchParams);
	//更新角色信息
	int updateRole(Role role, HttpServletRequest request, String createdUserId);
	//获取角色数据总数
	Long getRolesCount(Map<String, Object> searchParams);
	//
	int delete(Long id, HttpServletRequest request, String createdUserId);
	//获取角色树
	List<Tree> roleTree(Map<String, Object> filterParams);
	//根据userID关联用户角色表获取该用户的所有角色
	List<Role> getRolesByUserId(Long userId);
}
