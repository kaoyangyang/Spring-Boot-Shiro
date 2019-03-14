package com.infotop.service.impl.sys;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.infotop.entity.sys.User;
import com.infotop.mapper.sys.UserMapper;
import com.infotop.service.sys.UserService;
import org.springframework.stereotype.Service;

/**
 * 用户service
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserMapper,User> implements UserService {

}
