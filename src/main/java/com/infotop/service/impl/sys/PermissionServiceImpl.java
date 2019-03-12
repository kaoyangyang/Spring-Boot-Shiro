package com.infotop.service.impl.sys;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.infotop.entity.sys.Permission;
import com.infotop.mapper.sys.PermissionMapper;
import com.infotop.service.sys.PermissionService;
import com.infotop.utils.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限service实现类
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {
	

	@Autowired
	private PermissionMapper permissionMapper;

	/**
	 * 获取权限树
	 */
	public List<Tree> permissionTree(Map<String, Object> filterParams) {
		List<Tree> treeList = Lists.newArrayList();
		//根据查询条件获取所有结果集
		List<Permission> permissionList = permissionMapper.selectAll(filterParams);
		if(permissionList != null && permissionList.size()>0){
			//将结果放入结果树中
			for(Permission permission : permissionList){
				Tree tree = new Tree();
				tree.setId(permission.getId());
				tree.setPid(permission.getPid());
				tree.setName(permission.getName());
				tree.setIconCls("status_online");
				tree.setState("closed");
				tree.setValue(permission.getValue());
				tree.setIsParent(true);
				Map<String, String> attribute = Maps.newHashMap();
				attribute.put("permissionType", permission.getPermissionType());
				attribute.put("name", permission.getName());
				attribute.put("value", permission.getValue());
				attribute.put("remark", permission.getRemark());
				attribute.put("sort", String.valueOf(permission.getSort()));
				attribute.put("pid", String.valueOf(permission.getPid()));
				tree.setAttributes(attribute);
				treeList.add(tree);
			}
		}
		return treeList;
	}

	@Override
	public int insert(Permission permission) {
		return permissionMapper.insertSelective(permission);
	}

	@Override
	public Permission getPermissionById(Long id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updatePermission(Permission permission) {
		return permissionMapper.updateByPrimaryKeySelective(permission);
	}

	/**
	 * 根据id删除节点，若存在子节点，则不允许删除
	 */
	@Transactional(readOnly = false)
	public int deleteByIds(List<Long> ids) {
		Map<String, Object> filterMap = new HashMap<String, Object>();
		for(long id : ids){
			filterMap.put("pid", id);
			List<Permission> permissionChild = getPermissions(filterMap);
			if(permissionChild == null || permissionChild.size() == 0){
				deleteById(id);
			}else{
				return 2;	//存在子节点直接返回不再进行删除操作
			}
		}
		return 0;
	}
	
	public List<Permission> getPermissions(Map<String, Object> filterMap){
		return permissionMapper.selectAll(filterMap);
	}
	
	public int deleteById(Long id){
		return permissionMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 根据权限分类查询结果
	 */
	@Override
	public List<Permission> getPermissionsByCategory(String category) {
		Map<String,Object> filterParams = new HashMap<String, Object>();
		filterParams.put("category", category);
		return permissionMapper.selectAll(filterParams);
	}

	/**
	 * 根据权限分类、二级分类查询结果
	 */
	@Override
	public List<Permission> getPermissionsByCategoryAndSubCategory(String category, String subcategory) {
		Map<String,Object> filterParams = new HashMap<String, Object>();
		filterParams.put("category", category);
		filterParams.put("subcategory", subcategory);
		return permissionMapper.selectAll(filterParams);
	}

	@Override
	public Long getPermissionsCount(Map<String, Object> filterParams) {
		return permissionMapper.selectAllCount(filterParams);
	}

	/**
	 * 获取整株权限树
	 */
	@Override
	public List<Tree> getAllPermissionTree() {
		Map<String, Object> filterParams = new HashMap<String, Object>(); 
		List<Tree> treeList = Lists.newArrayList(); 
		//根据查询条件获取所有结果集
		List<Permission> permissionList = permissionMapper.selectAll(filterParams);
		if(permissionList != null && permissionList.size()>0){
			//将结果放入结果树中
			for(Permission permission : permissionList){
				Tree tree = new Tree();
				tree.setId(permission.getId());
				tree.setPid(permission.getPid());
				tree.setName(permission.getName());
				tree.setIconCls("status_online");
				tree.setState("closed");
				tree.setValue(permission.getValue());
				tree.setIsParent(true);
				Map<String, String> attribute = Maps.newHashMap();
				attribute.put("permissionType", permission.getPermissionType());
				attribute.put("name", permission.getName());
				attribute.put("value", permission.getValue());
				attribute.put("remark", permission.getRemark());
				attribute.put("sort", String.valueOf(permission.getSort()));
				attribute.put("pid", String.valueOf(permission.getPid()));
				tree.setAttributes(attribute);
				treeList.add(tree);
			}
		}
		return treeList;
	}


}
