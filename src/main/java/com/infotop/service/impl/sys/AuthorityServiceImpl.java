package com.infotop.service.impl.sys;


import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.infotop.entity.sys.Authority;
import com.infotop.mapper.sys.AuthorityMapper;
import com.infotop.service.sys.AuthorityService;
import org.springframework.stereotype.Service;

@Service(value="authorityService")
public class AuthorityServiceImpl extends ServiceImpl<AuthorityMapper,Authority> implements AuthorityService {


 

}