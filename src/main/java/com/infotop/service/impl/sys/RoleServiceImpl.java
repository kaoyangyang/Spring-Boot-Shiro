package com.infotop.service.impl.sys;

import com.google.common.collect.Lists;
import com.infotop.entity.sys.Role;
import com.infotop.mapper.sys.RoleMapper;
import com.infotop.service.sys.RoleService;
import com.infotop.utils.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 角色service实现类
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	/**
	 * 新增
	 */
	@Override
	public int insert(Role role, HttpServletRequest request, String createdUserId) {
		return roleMapper.insertSelective(role);
	}
	
	@Override
	public Role getRoleById(Long id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Role> getRoles(Map<String, Object> filterParams) {
		return roleMapper.selectAll(filterParams);
	}

	@Override
	public int updateRole(Role role, HttpServletRequest request, String createdUserId) {
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	@Override
	public Long getRolesCount(Map<String, Object> filterParams) {
		return roleMapper.selectAllCount(filterParams);
	}

	@Override
	public int delete(Long id, HttpServletRequest request, String createdUserId) {
//		Log log = new Log("Role", "delete", "删除id：" + id, OperationUtil.getIpAddr(request), createdUserId);
//		logService.saveLogAndLogData(log, null);
		return roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Tree> roleTree(Map<String, Object> filterParams) {
		List<Tree> treeList = Lists.newArrayList(); 
		//根据查询条件获取所有结果集
		List<Role> roleList = roleMapper.selectAll(filterParams);
		if(roleList != null && roleList.size()>0){
			//将结果放入结果树中
			for(Role role : roleList){
				Tree tree = new Tree();
				tree.setId(role.getId());
				tree.setName(role.getName());
				tree.setIconCls("status_online");
				tree.setState("closed");
				tree.setValue(role.getUuid());
				tree.setIsParent(false);
				treeList.add(tree);
			}
		}
		return treeList;
	}

	/**
	 * 根据userID关联用户角色表获取该用户的所有角色(non-Javadoc)
	 */
	@Override
	public List<Role> getRolesByUserId(Long userId) {
		return roleMapper.selectByUserId(userId);
	}


}
