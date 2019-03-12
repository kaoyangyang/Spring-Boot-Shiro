package com.infotop.controller.sys;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.infotop.common.coreUtils.DateTimeUtil;
import com.infotop.common.coreUtils.OperationUtil;
import com.infotop.common.coreUtils.ShiroUser;
import com.infotop.controller.BasicController;
import com.infotop.entity.sys.User;
import com.infotop.entity.sys.UserRole;
import com.infotop.service.sys.UserRoleService;
import com.infotop.service.sys.UserService;
import com.infotop.utils.DataGrid;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**  
 * 用户信息控制类
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BasicController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	/**
	 * 用户列表页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("")
	public String list(HttpServletRequest request, Model model){
		
		return "/admin/user/userList";
	}
	
	/**
	 * 新增用户modal
	 * @param model
	 * @return
	 */
	@RequestMapping("insertFormModal")
	public String insertFormModal(Model model){
		
		return "/admin/user/userRegisterModal";
	}
	
	
	/**
	 * 插入用户信息
	 * @param user
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	@ResponseBody
	public Message insert(@Validated User user, HttpServletRequest request, Model model){
		Message msg = new Message();
		try{
			ShiroUser su = super.getLoginUser(request);
			User currentUser = userService.getByLoginName(su.getLoginName());
			if (currentUser != null) {
				//验证登录账号、昵称、手机号是否唯一、格式是否正确。
				if(!userService.validateFormatLoginName(user.getLoginName())){
					msg.setSuccess(false);
					msg.setMessage("保存失败！登录账号格式不正确。");
					return msg;
				}
				
				if(!userService.validateUniqueLoginName(user.getLoginName())){
					msg.setSuccess(false);
					msg.setMessage("保存失败！该登录账号已被注册。");
					return msg;
				}
				
				if(!userService.validateFormatNickname(user.getNickname())){
					msg.setSuccess(false);
					msg.setMessage("保存失败！昵称格式不正确。");
					return msg;
				}
				
				
				if(!userService.validateUniqueNickname(user.getNickname())){
					msg.setSuccess(false);
					msg.setMessage("保存失败！该昵称已被注册。");
					return msg;
				}
				
				
				if(!userService.validateFormatPhone(user.getPhone())){
					msg.setSuccess(false);
					msg.setMessage("保存失败！手机号格式不正确。");
					return msg;
				}
				
				if(!userService.validateUniquePhone(user.getPhone())){
					msg.setSuccess(false);
					msg.setMessage("保存失败！该手机号已被注册。");
					return msg;
				}
				
				
				user.setUuid(OperationUtil.getUUID());
				user.setCreatedTime(DateTimeUtil.nowTimeStr());
				user.setCreatedIp(OperationUtil.getIpAddr(request));
				user.setStatus("0");//默认启用
				
				int result = userService.insert(user);
				
				msg.setSuccess(true);
				msg.setMessage("保存成功！");
			}else{
				//用户信息失效，重定向到前台
			}
		}catch(Exception e){
			msg.setSuccess(false);
			msg.setMessage("保存失败！");
		}
		
		return msg;
	}
	
	/**
	 * 检验loginName唯一性
	 * @param loginName
	 * @param id
	 * @return
	 */
	@RequestMapping(value="checkLoginName")
	@ResponseBody
	public boolean checkLoginName(@RequestParam(value="loginName") String loginName,
			@RequestParam(value="id", defaultValue="-1") Long id){
		if(!StringUtils.isBlank(loginName)){
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put("loginName", loginName);
			List<User> validUsers = userService.getUsersEqual(searchParams);
			
			//数据库中没有该登录账号或该登录账号为本数据登录账号则检验成功，否则视为存在多个相同登录账号
			if(validUsers == null || validUsers.size() == 0){
				msg.setSuccess(true);
				msg.setMessage("检验成功！");
				return true;
			}else if(validUsers.size() == 1){
				User validUser = validUsers.get(0);
				if(id.longValue() == validUser.getId().longValue()){
					msg.setSuccess(true);
					msg.setMessage("检验成功！");
					return true;
				}
			}
		}else{
			msg.setSuccess(false);
			msg.setMessage("登录账号不能为空。");
			return false;
		}
		
		msg.setSuccess(false);
		msg.setMessage("检验失败！已存在相同登录账号。");
		return false;
		
	}
	
	/**
	 * 检验昵称是否唯一
	 * @param
	 * @return
	 */
	@RequestMapping(value="checkNickname")
	@ResponseBody
	public boolean checkNickname(@RequestParam(value="nickname") String nickname,
			@RequestParam(value="id", defaultValue="-1") Long id){
		if(!StringUtils.isBlank(nickname)){
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put("nickname", nickname);
			List<User> validUsers = userService.getUsersEqual(searchParams);
			//数据库中没有该昵称或该昵称为本数据昵称则检验成功，否则视为存在多个相同昵称
			if(validUsers == null || validUsers.size() == 0){
				msg.setSuccess(true);
				msg.setMessage("检验成功！");
				return true;
			}else if(validUsers.size() == 1){
				User validUser = validUsers.get(0);
				if(id.longValue() == validUser.getId().longValue()){
					msg.setSuccess(true);
					msg.setMessage("检验成功！");
					return true;
				}
			}
		}else{
			msg.setSuccess(false);
			msg.setMessage("登录账号不能为空。");
			return false;
		}
		
		msg.setSuccess(false);
		msg.setMessage("检验失败！已存在相同昵称。");
		return false;
		
	}
	
	/**
	 * 检验手机号是否唯一
	 * @param
	 * @return
	 */
	@RequestMapping(value="checkPhone")
	@ResponseBody
	public boolean checkPhone(@RequestParam(value="phone") String phone,
			@RequestParam(value="id", defaultValue="-1") Long id){
		if(!StringUtils.isBlank(phone)){
			Map<String, Object> searchParams = new HashMap<String, Object>();
			searchParams.put("phone", phone);
			List<User> validUsers = userService.getUsersEqual(searchParams);
			//数据库中没有该昵称或该昵称为本数据昵称则检验成功，否则视为存在多个相同昵称
			if(validUsers == null || validUsers.size() == 0){
				msg.setSuccess(true);
				msg.setMessage("检验成功！");
				return true;
			}else if(validUsers.size() == 1){
				User validUser = validUsers.get(0);
				if(id.longValue() == validUser.getId().longValue()){
					msg.setSuccess(true);
					msg.setMessage("检验成功！");
					return true;
				}
			}
		}else{
			msg.setSuccess(false);
			msg.setMessage("登录账号不能为空。");
			return false;
		}
		
		msg.setSuccess(false);
		msg.setMessage("检验失败！该手机号已被注册。");
		return false;
		
	}
	
	
	
	/**
	 * 更新页面的modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updateFormModal/{id}", method = RequestMethod.GET)
	public String updateFormModal(@PathVariable("id") Long id, Model model){
		User user = userService.getUserById(id);
		if(user == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("user", user);
		model.addAttribute("action", "update");
		return "/admin/user/userFormModal";
	}
	
	/**
	 * 更新用户信息
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST )
	@ResponseBody
	public Message update(@Validated @ModelAttribute("preloadUser") User user,
	                      HttpServletRequest request) {
		try{
			userService.updateUser(user);
			msg.setSuccess(true);
			msg.setMessage("更新成功");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	/**
	 * 封禁用户（假删除）
	 * @param
	 * @return
	 */
	@RequestMapping("blocked")
	@ResponseBody
	public Message blocked(@RequestParam(value = "ids") List<Long> ids){
		try{
			for(long id : ids){
				userService.blockedUser(id);
			}
			
			msg.setSuccess(true);
			msg.setMessage("封禁成功！");
			msg.setData("");
		}catch(Exception e){
			e.printStackTrace();
			msg.setSuccess(false);
			msg.setMessage("封禁失败！");
			msg.setData("");
		}
		
		return msg;
	}
	
	/**
	 * 解封
	 * @param
	 * @return
	 */
	@RequestMapping("unblocked")
	@ResponseBody
	public Message unblocked(@RequestParam(value = "ids") List<Long> ids){
		try{
			for(long id : ids){
				userService.unblockedUser(id);
			}
			
			msg.setSuccess(true);
			msg.setMessage("解封成功！");
			msg.setData("");
		}catch(Exception e){
			e.printStackTrace();
			msg.setSuccess(false);
			msg.setMessage("解封失败！");
			msg.setData("");
		}
		
		return msg;
	}
	
	/**
	 * 获取用户数据
	 * @RequestBody 获取前台的参数等信息
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="findList")
	@ResponseBody
	public DataGrid findList(HttpServletRequest request) throws JsonProcessingException {
		DataGrid result = new DataGrid();
		
//		//获取查询条件
		Map<String, Object> searchParams = new HashMap<String, Object>();
//		//页面偏移即页面index
		int offset = 0;
//		//一页显示数据量
		int limit = 10;
//
//		//分页参数
		searchParams.put("offsetIndex", offset);
		searchParams.put("limit", limit);
//
		//ObjectMapper mapper = new ObjectMapper();
		//查询本页结果
		List<User> users = userService.getUsers(searchParams);
		//查询总数	
		Long total = userService.getUsersCount(searchParams);
	
		try{
			result.setTotal(total);  
			result.setRows(users);  
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	/**
	 * 拦截，从数据库中获取完整信息，填充前台为空的数据，保障数据完整性
	 * @param id
	 * @return
	 */
	@ModelAttribute("preloadUser")
	public User getUser(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return userService.getUserById(id);
		}
		return null;
	}
	
	/**
	 * 查看信息modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="viewModal/{id}", method = RequestMethod.GET)
	public String viewModal(@PathVariable("id") Long id, Model model){
		User user = userService.getUserById(id);
		if(user == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("user", user);
		
		return "/admin/user/userViewModal";
	}
	
	/**
	 * 用户授角色Modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="authorizeModal/{id}")
	public String authorizeModal(@PathVariable("id")Long id, Model model){
		User currentUser = userService.getUserById(id);
		//获取角色-权限信息
		Map<String, Object> filterParams = new HashMap<String, Object>();
		filterParams.put("userId", id);
		List<UserRole> userRoles = userRoleService.getUserRoles(filterParams);
		
		model.addAttribute("user", currentUser);
		model.addAttribute("userRoles", userRoles);
		model.addAttribute("action", "authorize");
		return "/admin/user/userAuthorizeModal";
	}
	
	/**
	 * 授角色
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="authorize")
	@ResponseBody
	public Message authorize(@ModelAttribute("preloadUser") User user, HttpServletRequest request){
		try{
			ShiroUser su = super.getLoginUser(request);
			if(user != null){
				String roleIds = user.getRoleIds();
				Long userId = user.getId();
				String[] roleIdArray = new String[]{};
				if(userId != null && roleIds != null){
					//删除原用户-角色关系
					userRoleService.deleteByUserId(userId, request, su.getUserUuid());
					
					roleIdArray = roleIds.split(",");
					UserRole userRole;
					for(String roleId : roleIdArray){
						userRole = new UserRole();
						userRole.setUserId(userId);
						userRole.setRoleId(Long.valueOf(roleId));
						userRoleService.insert(userRole, request, su.getUserUuid());
					}
				}
			}
			msg.setSuccess(true);
			msg.setMessage("授权成功！");
			msg.setData("");
		}catch(Exception e){
			e.printStackTrace();
			msg.setSuccess(false);
			msg.setMessage("授权失败！");
			msg.setData("");
		}
		return msg;
	}
	
	
	/**
	 * 用户重置密码Modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="resetPasswordModal/{id}")
	public String resetPasswordModal(@PathVariable("id")Long id, Model model){
		User currentUser = userService.getUserById(id);
		if(currentUser == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("user", currentUser);
		model.addAttribute("action", "resetPassword");
		return "/admin/user/userResetPasswordModal";
	}
	
	/**
	 * 重置密码
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="resetPassword")
	@ResponseBody
	public Message resetPassword(@ModelAttribute("preloadUser") User user, HttpServletRequest request){
		try{
			int result = userService.updateUser(user);
			if(result > 0){
				msg.setSuccess(true);
				msg.setMessage("重置密码成功！");
				msg.setData("");
				return msg;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		msg.setSuccess(false);
		msg.setMessage("重置密码失败！");
		msg.setData("");
		
		return msg;
	}
	
	
	/* 初始化密码为123456
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "refreshPassword")
	@ResponseBody
	public Message refreshPassword(@RequestParam("id") Long id) {
		User user = userService.getUserById(id);
		if(user != null){
			user.setPlainPassword("123456");
			int result = userService.updateUser(user);
			if(result > 0){
				msg.setSuccess(true);
				msg.setMessage("密码初始化成功");
				msg.setData("");
				return msg;
			}
		}
		
		msg.setSuccess(false);
		msg.setMessage("密码初始化失败！");
		msg.setData("");
		return msg;
	}
	
}
