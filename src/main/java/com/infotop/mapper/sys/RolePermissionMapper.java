package com.infotop.mapper.sys;


import com.infotop.entity.sys.RolePermission;

import java.util.List;
import java.util.Map;

public interface RolePermissionMapper {
    int deleteByRoleId(Long roleId);
    int deleteByPermissionId(Long permissionName);
    int insertSelective(RolePermission record);
    List<RolePermission> selectAll(Map<String, Object> filterParams);
    //根据角色id获取权限名称
	List<String> selectPermissionValuesByRoleId(Long roleId);
}