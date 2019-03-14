package com.infotop.service.impl.sys;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.infotop.entity.sys.Permission;
import com.infotop.mapper.sys.PermissionMapper;
import com.infotop.service.sys.PermissionService;
import org.springframework.stereotype.Service;

/**
 * 权限service实现类
 */
@Service("permissionService")
public class PermissionServiceImpl  extends ServiceImpl<PermissionMapper,Permission> implements PermissionService {
	


}
