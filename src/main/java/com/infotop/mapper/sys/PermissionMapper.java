package com.infotop.mapper.sys;


import com.infotop.entity.sys.Permission;

import java.util.List;
import java.util.Map;

public interface PermissionMapper {
    //自定义新增数据
    int insertSelective(Permission record);
    //根据主键自定义修改
    int updateByPrimaryKeySelective(Permission record);
	//根据主键删除
    int deleteByPrimaryKey(Long id);
    //根据主键查询
    Permission selectByPrimaryKey(Long id);
    //根据自定义查询条件查询结果集
    List<Permission> selectAll(Map<String, Object> filterParams);
    
	Long selectAllCount(Map<String, Object> filterParams);
}