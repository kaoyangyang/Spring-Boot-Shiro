package com.infotop.mapper.sys;


import com.infotop.entity.sys.Role;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
	//根据id删除一条数据
    int deleteByPrimaryKey(Long id);
    //自定义新增数据
    int insertSelective(Role record);
    //根据主键查询
    Role selectByPrimaryKey(Long id);
    //根据主键（id）自定义修改
    int updateByPrimaryKeySelective(Role record);
    //查询所有角色数据列表
    List<Role> selectAll(Map<String, Object> filterParams);
    
    Long selectAllCount(Map<String, Object> filterParams);

    List<Role> selectByUserId(Long userId);
}