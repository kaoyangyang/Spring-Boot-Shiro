package com.infotop.service.sys;


import com.infotop.entity.sys.Authority;

import java.util.List;

/**  
 * 参数Service
 */
public interface AuthorityService {
	List<Authority> selectAll();
	Long selectAllCount();
	abstract int updateAuthority();
	int insert(Authority authority);
	int update(Authority authority);
	int delete(String uuid);
	Authority getAuthorityById(Long id);
	int deleteByUuid(String uuid);
}
