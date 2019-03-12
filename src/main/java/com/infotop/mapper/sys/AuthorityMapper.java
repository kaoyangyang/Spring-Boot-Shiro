package com.infotop.mapper.sys;


import com.infotop.entity.sys.Authority;

import java.util.List;

public interface AuthorityMapper {
	List<Authority> selectAll();
	Long selectAllCount();
	int insert(Authority authority);
	int updateByPrimaryKeySelective(Authority authority);
	Authority selectByPrimaryKey(Long id);
	int deleteByUuid(String uuid);
	
}