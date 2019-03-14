package com.infotop.controller;

import com.alibaba.fastjson.JSONArray;
import com.infotop.entity.sys.User;
import com.infotop.exception.UnauthorizedException;
import com.infotop.thrift.basic.client.BasicDataClient;
import com.infotop.thrift.basic.common.UserDetail;
import com.infotop.util.JSONUtils;
import com.infotop.utils.JWTUtil;
import com.infotop.utils.ResponseBean;
import com.infotop.utils.Result;
import com.infotop.utils.ResultUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.apache.thrift.TException;
import org.apache.thrift.transport.TTransportException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin
public class WebController {

    private static final Logger LOGGER = LogManager.getLogger(WebController.class);

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public Result login(@RequestBody User user) {
        String userjson = "";
        String userByUserUuidOrLoginName = "";
        try {
            userjson = BasicDataClient.checkLoginNameAndPwd(user.getLoginName(), user.getPassword());
            if (!StringUtils.isEmpty(userjson)) {
                Map<String, Object> parseMap = (Map<String, Object>) JSONArray.parse(userjson);
                String status = parseMap.get("data").toString();
                if ("true".equals(status)) {
                    userByUserUuidOrLoginName = BasicDataClient.findUserByUserUuidOrLoginName(user.getLoginName(), 2);
                }
                if (StringUtils.isNotEmpty(userByUserUuidOrLoginName)) {
                    UserDetail userDetail = JSONUtils.convertJsonStr2UserDetail(userByUserUuidOrLoginName);
                    user.setSmallAvatar(userDetail.getSmallAvatar());
                    user.setMiddleAvatar(userDetail.getMiddleAvatar());
                    user.setLargeAvatar(userDetail.getLargeAvatar());
                    user.setNickname(userDetail.getName());
                    Map<String, Object> map = new HashMap<>();
                    map.put("token", JWTUtil.sign(user.getLoginName(), user.getPassword()));
                    map.put("user", user);
                    Result success = ResultUtil.success(map);
                    return success;
                }

            }else{
                Result success = ResultUtil.error(0,"用户名或密码错误");
                return success;
            }

        } catch (TTransportException e) {
            e.printStackTrace();
        } catch (TException e) {
            e.printStackTrace();
        }

        throw new UnauthorizedException();
    }


    @GetMapping("/article")
    public ResponseBean article() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            return new ResponseBean(200, "You are already logged in", null);
        } else {
            return new ResponseBean(200, "You are guest", null);
        }
    }

    @GetMapping("/require_auth")
    @RequiresAuthentication
    public ResponseBean requireAuth() {
        return new ResponseBean(200, "You are authenticated", null);
    }

    @GetMapping("/require_role")
    @RequiresRoles("admin")
    public ResponseBean requireRole() {
        return new ResponseBean(200, "You are visiting require_role", null);
    }

    @GetMapping("/require_permission")
    @RequiresPermissions(logical = Logical.AND, value = {"view", "edit"})
    public ResponseBean requirePermission() {
        return new ResponseBean(200, "You are visiting permission require edit,view", null);
    }

    @RequestMapping(path = "/401")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ResponseBean unauthorized() {
        return new ResponseBean(200, "Unauthorized", null);
    }
}
