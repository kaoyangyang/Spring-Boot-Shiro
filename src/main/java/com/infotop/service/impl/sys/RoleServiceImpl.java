package com.infotop.service.impl.sys;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.infotop.entity.sys.Role;
import com.infotop.mapper.sys.RoleMapper;
import com.infotop.service.sys.RoleService;
import org.springframework.stereotype.Service;

/**
 * 角色service实现类
 */
@Service("roleService")
public class RoleServiceImpl extends ServiceImpl<RoleMapper,Role> implements RoleService {

}
