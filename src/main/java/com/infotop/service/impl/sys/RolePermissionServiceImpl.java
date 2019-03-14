package com.infotop.service.impl.sys;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.infotop.entity.sys.RolePermission;
import com.infotop.mapper.sys.RolePermissionMapper;
import com.infotop.service.sys.RolePermissionService;
import org.springframework.stereotype.Service;

/**
 * 角色权限关系service实现类
 */
@Service("rolePermissionService")
public class RolePermissionServiceImpl   extends ServiceImpl<RolePermissionMapper,RolePermission> implements RolePermissionService {


}
