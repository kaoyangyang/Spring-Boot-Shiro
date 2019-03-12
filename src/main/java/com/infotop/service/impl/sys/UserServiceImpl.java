package com.infotop.service.impl.sys;

import com.infotop.entity.sys.User;
import com.infotop.mapper.sys.UserMapper;
import com.infotop.service.sys.UserService;
import com.infotop.utils.Digests;
import com.infotop.utils.Encodes;
import com.infotop.utils.OperationUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户service
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	
	private static final int SALT_SIZE = 8;

	@Autowired
	private UserMapper userMapper;

	public User getUserById(Long id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public List<User> getUsers(Map<String, Object> searchParams) {
		return userMapper.selectAll(searchParams);
	}

	public int insert(User user) throws NoSuchAlgorithmException {
		try{
			entryptPassword(user);
		}catch(Exception e){
			
		}
		int result = userMapper.insert(user);
		
		
		return result;
	}
	

	/**
	 * 根据账号查找用户信息
	 */
	public User getByLoginName(String loginName){
		return userMapper.selectByLoginName(loginName);
	}
	
	
	private void entryptPassword(User user) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));
		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(),
				salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));

	}
	
	/**
	 * 修改用户信息
	 * 
	 */
	public int updateUser(User user){
		int result = -1;
		try {
			//有修改密码的则对密码重新加密
			if (StringUtils.isNotBlank(user.getPlainPassword())) {
				try {
					entryptPassword(user);
				} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
			}
			result = userMapper.updateByPrimaryKeySelective(user);
			
			if(result > 0){
//				Log log = new Log("User", "update", "修改用户信息");
//		        logService.saveLogAndLogData(log, user);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 封禁用户信息
	 * @param id
	 * @return
	 */
	public int blockedUser(Long id){
		int result = -1;
		try{
			result = userMapper.blockedUser(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//TODO 日志 ，删除时只有id如何处理？
		if(result > 0){
//			Log log = new Log("User", "blocked", "封禁用户信息id:" + id);
//			logService.saveLogAndLogData(log, new Object());
		}
		return result;
	}

	/**
	 * 获取用户总数
	 */
	public Long getUsersCount(Map<String, Object> searchParams) {
		return userMapper.selectAllCount(searchParams);
	}

	/**
	 * 为班级学员模块获取用户数据*/
	public List<User> getUsersForClassroomMember(
			Map<String, Object> searchParams) {
		return userMapper.selectAllForClassroomMember(searchParams);
	}
	/**
	 * 为班级学员模块获取用户总数*/
	public Long getUsersCountForClassroomMember(Map<String, Object> searchParams) {
		return userMapper.selectAllCountForClassroomMember(searchParams);
	}
	
    /**
     * 保存用户图片,并返回路径
     * @param request
     * @param
     * @return
     */
    public Map<String, Object> savePersonnelImage(HttpServletRequest request, String pathSmall, String pathMiddle, String pathLarge, String loginId) {
        Map<String, Object> map = null;
        User user = this.getUserById(Long.valueOf(loginId));
//        String delePath = user.getAvatar();
//        if (!StringUtils.isEmpty(delePath)) {
//            FileStoreUtils.deleteFile(request, delePath);
//        }
        try {
//            List<FileStoreDto> list = FileStoreUtils.fileUpload(request, path);
            user.setSmallAvatar(pathSmall); 
            user.setMiddleAvatar(pathMiddle); 
            user.setLargeAvatar(pathLarge);  
            map = new HashMap<String, Object>();
            map.put("pathSmall", pathSmall);
			map.put("pathMiddle", pathMiddle);
			map.put("pathLarge", pathLarge);
//            map.put("largePath", list.get(0).getProjectPathFile());
        } catch (Exception e) {
            e.printStackTrace();
        }
        updateUser(user);// 保存

        return map;
    }

	/**
	 * 精确查询loginName、nickname，用于检验唯一性
	 */
	public List<User> getUsersEqual(Map<String, Object> searchParams) {
		return userMapper.selectAllEqual(searchParams);
	}

	@Override
	public User getByNickname(String nickname) {
		return userMapper.selectByNickname(nickname);
	}

	@Override
	public int unblockedUser(Long id) {
		int result = -1;
		try{
			result = userMapper.unblockedUser(id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//TODO 日志 ，删除时只有id如何处理？
		if(result > 0){
//			Log log = new Log("User", "unblocked", "解封用户信息id:" + id);
//			logService.saveLogAndLogData(log, null);
		}
		return result;
	}
	
	
	
	/**
	 * 校验登录账号唯一性
	 * @param loginName
	 * @return
	 */
	public boolean validateUniqueLoginName(String loginName){
		User validUser = userMapper.selectByLoginName(loginName);
		if(validUser != null){
			return false;
		}
		
		return true;
	}
	/**
	 * 校验昵称唯一性
	 * @param nickname
	 * @return
	 */
	public boolean validateUniqueNickname(String nickname){
		User validUser = userMapper.selectByNickname(nickname);
		if(validUser != null){
			return false;
		}
		
		return true;
	}
	/**
	 * 校验手机号唯一性
	 * @param
	 * @return
	 */
	public boolean validateUniquePhone(String phone){
		Map<String, Object> filterParams = new HashMap<String, Object>();
		filterParams.put("phone", phone);
		List<User> validUser = userMapper.selectAll(filterParams);
		if(validUser != null && validUser.size()>0){
			return false;
		}
		
		return true;
	}
	
	
	
	/**
	 * 校验登录账号规则，要求登录账号为  1-10个以字母开头、可带数字、"_"的字串 
	 * @param loginName
	 * @return
	 */
	public boolean validateFormatLoginName(String loginName){
		String regex = "^[a-zA-Z]{1}([a-zA-Z0-9]|[_]){0,9}$";
		return OperationUtil.validateRegex(regex, loginName);
	}
	
	/**
	 * 校验昵称规则，要求1-10个以字母或下划线或汉字或数字的字符串
	 * @param
	 * @return
	 */
	public boolean validateFormatNickname(String nickname){
		String regex = "^([a-zA-Z0-9]|[_]|[\u4E00-\uFA29]|[\uE7C7-\uE7F3]){1,10}$";
		return OperationUtil.validateRegex(regex, nickname);
	}
	
	/**
	 * 校验手机号规则
	 * @param phone
	 * @return
	 */
	public boolean validateFormatPhone(String phone){
		String regex = "^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$";
		return OperationUtil.validateRegex(regex, phone);
	}
	//通过日期区间获取统计数
	@Override
	public List<Map<String,Object>> getStatisticsByDay(Map<String,Object> params){
		return userMapper.getStatisticsByDay(params);
	}

	//判断手机号唯一性，排除用户唯一编码为uuid的数据，修改手机号避免录入自身手机号造成校验失败
	public boolean validateUniquePhoneNotSelf(String phone, String uuid) {
		Map<String, Object> filterParams = new HashMap<String, Object>();
		filterParams.put("phone", phone);
		List<User> validUser = userMapper.selectAll(filterParams);
		if(validUser != null && validUser.size()>0){
			//仅有一条数据且uuid相同的认为唯一
			if(validUser.size() == 1){
				User user = validUser.get(0);
				if(StringUtils.equals(uuid, user.getUuid())){
					return true;
				}
			}
		}else{
			//没有符合条件的数据，认为唯一
			return true;
		}
		
		return false;
	}

	/**
	 * 更新绑定信息，如手机号、email
	 */
	public int updateBindInfo(Map<String, Object> map) {
		return userMapper.updateBindInfo(map);
	}

}
