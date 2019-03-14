package com.infotop.service.impl.sys;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.infotop.entity.sys.UserRole;
import com.infotop.mapper.sys.UserRoleMapper;
import com.infotop.service.sys.UserRoleService;
import org.springframework.stereotype.Service;

/**
 * 用户-角色service实现
 * 
 * 2016年10月26日下午4:39:03
 */
@Service("userRoleService")
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper,UserRole> implements UserRoleService {

}
