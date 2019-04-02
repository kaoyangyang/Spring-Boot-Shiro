package com.infotop.shiro;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.infotop.entity.sys.Role;
import com.infotop.entity.sys.RolePermission;
import com.infotop.entity.sys.User;
import com.infotop.service.sys.RolePermissionService;
import com.infotop.service.sys.RoleService;
import com.infotop.service.sys.UserService;
import com.infotop.utils.JWTUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MyRealm extends AuthorizingRealm {

    private static final Logger LOGGER = LogManager.getLogger(MyRealm.class);

    @Autowired
    private UserService userService;

    @Autowired
    protected RoleService roleService;

    @Autowired
    protected RolePermissionService rolePermissionService;
    /**
     * 大坑！，必须重写此方法，不然Shiro会报错
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof JWTToken;
    }

    /**
     * 只有当需要检测用户权限的时候才会调用此方法，例如checkRole,checkPermission之类的
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = JWTUtil.getUsername(principals.toString());
        EntityWrapper<User> ew = new EntityWrapper<User>();
        ew.eq("login_name",username);
        User user = userService.selectOne(ew);
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        //获取角色列表
        EntityWrapper<Role> ewRole = new EntityWrapper<>();
        ewRole.eq("uuid",user.getUuid());
        List<Role> roles = roleService.selectList(ewRole);
        List<String> permissionNames = new ArrayList<>();
        for (Role role : roles) {
            // 基于Role的权限信息
            simpleAuthorizationInfo.addRole(role.getName());
            // 基于Permission的权限信息
            EntityWrapper<RolePermission> permission = new EntityWrapper<>();
            permission.eq("role_id",role.getId());
            List<RolePermission> rolePermissions = rolePermissionService.selectList(permission);
            for(RolePermission rolePermission :rolePermissions){
                permissionNames.add(rolePermission.getPermissionValue());
            }
            simpleAuthorizationInfo.addStringPermissions(permissionNames);
        }
//        simpleAuthorizationInfo.addRole("admin");
//        simpleAuthorizationInfo.addStringPermission("admin");
        return simpleAuthorizationInfo;
    }

    /**
     * 默认使用此方法进行用户名正确与否验证，错误抛出异常即可。
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken auth) throws AuthenticationException {
        String token = (String) auth.getCredentials();
        // 解密获得username，用于和数据库进行对比
        String username = JWTUtil.getUsername(token);
        if (username == null) {
            throw new AuthenticationException("token invalid");
        }
        EntityWrapper<User> ewRole = new EntityWrapper<>();
        ewRole.eq("login_name",username);
        User userBean = userService.selectOne(ewRole);
        if (userBean == null) {
            throw new AuthenticationException("User didn't existed!");
        }
        Long now = System.currentTimeMillis();
        DecodedJWT decode = JWT.decode(token);
        Long expiresAt = decode.getExpiresAt().getTime();
        if(now>expiresAt){
            throw new AuthenticationException("Time Out");
        }
//        if (! JWTUtil.verify(token, username, userBean.getPassword())) {
//            throw new AuthenticationException("Username or password error");
//        }

        return new SimpleAuthenticationInfo(token, token, "my_realm");
    }
}
