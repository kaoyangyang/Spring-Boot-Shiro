package com.infotop.mapper.sys;


import com.infotop.entity.sys.UserRole;

import java.util.List;
import java.util.Map;

public interface UserRoleMapper {
    int insert(UserRole record);
    List<UserRole> selectAll(Map<String, Object> filterMap);
    int deleteByRoleId(Long roleId);
    int deleteByUserId(Long userId);
}