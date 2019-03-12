package com.infotop.service.sys;


import com.infotop.entity.sys.Permission;
import com.infotop.utils.Tree;

import java.util.List;
import java.util.Map;

/**  
 * 参数Service
 */
public interface PermissionService {
	//根据查询条件获取结果树
	List<Tree> permissionTree(Map<String, Object> filterParams);
	//获取整株树
	List<Tree> getAllPermissionTree();
	//新增参数
	int insert(Permission permission);
	
	Permission getPermissionById(Long id);
	int updatePermission(Permission permission);
	//根据ids删除节点
	int deleteByIds(List<Long> ids);
	//根据单个节点id删除节点
	int deleteById(Long id);
	//根据自定义查询条件获取参数列表
	List<Permission> getPermissions(Map<String, Object> filterParams);
	
	//根据参数分类获取参数集合
	List<Permission> getPermissionsByCategory(String category);
	//根据参数分类、二级分类获取参数集合
	List<Permission> getPermissionsByCategoryAndSubCategory(String category, String subcategory);
	
	Long getPermissionsCount(Map<String, Object> filterParams);
}
