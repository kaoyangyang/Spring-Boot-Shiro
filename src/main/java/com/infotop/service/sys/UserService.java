package com.infotop.service.sys;


import com.infotop.entity.sys.User;

import javax.servlet.http.HttpServletRequest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;


/**  
 * 用户Service接口
 */

public interface UserService {
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;

	User getUserById(Long id);
	
	List<User> getUsers(Map<String, Object> searchParams);
	
	int insert(User user) throws NoSuchAlgorithmException;

	User getByLoginName(String loginName);
	
	User getByNickname(String nickname);

	int updateUser(User user);
	//封禁用户
	int blockedUser(Long id);
	
	//解封用户
	int unblockedUser(Long id);

	//获取用户总数
	Long getUsersCount(Map<String, Object> searchParams);

	//为班级学员模块获取数据
	List<User> getUsersForClassroomMember(Map<String, Object> searchParams);
	Long getUsersCountForClassroomMember(Map<String, Object> searchParams);
	
	//保存用户头像,并返回路径 
	public Map<String,Object> savePersonnelImage(HttpServletRequest request, String pathSmall, String pathMiddle, String pathLarge, String loginId);

	//用于精准查询loginName/nickname
	List<User> getUsersEqual(Map<String, Object> searchParams);

	// 校验登录账号唯一性
	public boolean validateUniqueLoginName(String loginName);
	// 校验昵称唯一性
	public boolean validateUniqueNickname(String nickname);
	// 校验手机号唯一性
	public boolean validateUniquePhone(String phone);
	// 校验登录账号规则，要求登录账号为  1-10个以字母开头、可带数字、"_"的字串
	public boolean validateFormatLoginName(String loginName);
	// 校验昵称规则，要求1-10个以字母或下划线或汉字或数字的字符串
	public boolean validateFormatNickname(String nickname);
	// 校验手机号规则
	public boolean validateFormatPhone(String phone);
	// 通过日期区间获取统计数
	List<Map<String,Object>> getStatisticsByDay(Map<String, Object> params);
	// 校验手机号唯一性，且排除当前用户
	boolean validateUniquePhoneNotSelf(String newPhone, String uuid);
	// 修改绑定信息，如手机号、电子邮箱
	int updateBindInfo(Map<String, Object> map);
	
}
