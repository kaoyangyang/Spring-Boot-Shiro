package com.infotop.service.impl.sys;

import com.infotop.entity.sys.Authority;
import com.infotop.mapper.sys.AuthorityMapper;
import com.infotop.service.sys.AuthorityService;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(value="authorityService")
public class AuthorityServiceImpl implements AuthorityService {

    //注意/r/n前不能有空格
    private static final String CRLF= "\r\n";

    @Resource
    private ShiroFilterFactoryBean shiroFilterFactoryBean;

    @Autowired
    private AuthorityMapper authorityMapper;

    public String loadFilterChainDefinitions() {
       StringBuffer sb = new StringBuffer("");
       sb.append(getRestfulOperationAuthRule());
       
       return sb.toString();
    }

    

    //生成restful风格功能权限规则

    private String getRestfulOperationAuthRule() {
       List<Authority> operations = authorityMapper.selectAll();

       String url = "";
       StringBuffer sb  = new StringBuffer("");
       
       /*for(Authority entity : operations){
    	   url = entity.getUrl();
    	   if(! url.startsWith("/")) {
    		   url = "/"+ url ;
           }
    	   sb.append(url).append("=").append(entity.getPerms()).append(CRLF);
       }*/
       if(operations != null && operations.size() > 0){
    	   Authority entity = operations.get(0);
    	   sb.append(entity.getValue());
       }

       return sb.toString();
    }

    

    

    //此方法加同步锁
    public synchronized void reCreateFilterChains() {
       AbstractShiroFilter shiroFilter = null;
       try{
           shiroFilter = (AbstractShiroFilter)shiroFilterFactoryBean.getObject();
       } catch(Exception e) {
           throw new RuntimeException("get ShiroFilter from shiroFilterFactoryBean error!");
       }

       PathMatchingFilterChainResolver filterChainResolver =(PathMatchingFilterChainResolver)shiroFilter.getFilterChainResolver();

       DefaultFilterChainManager manager =(DefaultFilterChainManager)filterChainResolver.getFilterChainManager();

       //清空老的权限控制
       manager.getFilterChains().clear();

       shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
       shiroFilterFactoryBean.setFilterChainDefinitions(loadFilterChainDefinitions());

       //重新构建生成
       Map<String, String> chains = shiroFilterFactoryBean.getFilterChainDefinitionMap();
        for(Map.Entry<String, String> entry :chains.entrySet()) {

            String url = entry.getKey();

            String chainDefinition =entry.getValue().trim().replace(" ", "");

            manager.createChain(url,chainDefinition);
        }
    }


	@Override
	public List<Authority> selectAll() {
		return authorityMapper.selectAll();
	}



	@Override
	public Long selectAllCount() {
		return authorityMapper.selectAllCount();
	}


	@Override
	public int updateAuthority() {
		reCreateFilterChains();
		return 0;
	}

	@Override
	public int insert(Authority authority) {
		return authorityMapper.insert(authority);
	}


	@Override
	public int update(Authority authority) {
		return authorityMapper.updateByPrimaryKeySelective(authority);
	}


	@Override
	public int delete(String uuid) {
		return authorityMapper.deleteByUuid(uuid);
	}



	@Override
	public Authority getAuthorityById(Long id) {
		return authorityMapper.selectByPrimaryKey(id);
	}



	@Override
	public int deleteByUuid(String uuid) {
		return authorityMapper.deleteByUuid(uuid);
	}

 

}