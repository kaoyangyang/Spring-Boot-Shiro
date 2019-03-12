package com.infotop.mapper.sys;


import com.infotop.entity.sys.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    List<User> selectAll(Map<String, Object> searchParams);

	User selectByLoginName(String userName);
	
	User selectByNickname(String nickname);

	int blockedUser(Long id);

	Long selectAllCount(Map<String, Object> searchParams);

	List<User> selectAllForClassroomMember(Map<String, Object> searchParams);

	Long selectAllCountForClassroomMember(Map<String, Object> searchParams);
	
	//精准查询，用于检验loginName、nickName
	List<User> selectAllEqual(Map<String, Object> searchParams);

	int unblockedUser(Long id);
	//通过日期区间获取统计数
	List<Map<String,Object>> getStatisticsByDay(Map<String, Object> searchParams);

	int updateBindInfo(Map<String, Object> map);
}