package com.infotop.controller.sys;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.infotop.common.coreUtils.DateTimeUtil;
import com.infotop.common.coreUtils.OperationUtil;
import com.infotop.common.coreUtils.ShiroUser;
import com.infotop.controller.BasicController;
import com.infotop.entity.sys.Permission;
import com.infotop.entity.sys.Role;
import com.infotop.entity.sys.RolePermission;
import com.infotop.service.sys.PermissionService;
import com.infotop.service.sys.RolePermissionService;
import com.infotop.service.sys.RoleService;
import com.infotop.service.sys.UserService;
import com.infotop.utils.DataGrid;
import com.infotop.utils.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**  
 * 角色控制类
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController extends BasicController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RolePermissionService rolePermissionService;
	
	@Autowired
	private PermissionService permissionService;
	
	/**
	 * 角色列表页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("")
	public String list(HttpServletRequest request, Model model){
		
		return "/admin/role/roleList";
	}
	
	/**
	 * 获取角色数据
	 * @RequestBody 获取前台的参数等信息
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="findList")
	@ResponseBody
	public Object findList(	HttpServletRequest request,
			@RequestBody JSONObject jsonObj) throws JsonProcessingException {
		DataGrid result = new DataGrid();
		
		//获取查询条件
		Map<String, Object> searchParams = (HashMap<String, Object>)jsonObj.get("search");
		//页面偏移即页面index
		int offset = "".equals(jsonObj.getString("offset"))?0:jsonObj.getIntValue("offset");
		//一页显示数据量
		int limit = "".equals(jsonObj.getString("limit"))?10:jsonObj.getIntValue("limit");
		
		//分页参数
		searchParams.put("offsetIndex", offset);
		searchParams.put("limit", limit);
		
		List<Role> roles = roleService.getRoles(searchParams);
		//查询总数	
		Long total = roleService.getRolesCount(searchParams);
		try{
			result.setTotal(total);  
			result.setRows(roles);  
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 新增角色modal，没有权限树
	 * @param model
	 * @return
	 */
	@RequestMapping("insertFormModal")
	public String insertFormModal(Model model){
		model.addAttribute("action", "insert");
		return "/admin/role/roleFormModal";
	}
	
	
	/**
	 * 保存角色信息
	 * @param
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	@ResponseBody
	public Message insert(@Validated Role role, HttpServletRequest request, Model model){
		Message msg = new Message();
		try{
			ShiroUser su = super.getLoginUser(request);
			
			role.setUuid(OperationUtil.getUUID());
			//添加创建人信息
			role.setCreatedid(su.getUserUuid().toString());
			role.setCreatedtime(DateTimeUtil.nowTimeStr());
			role.setCreatedip(OperationUtil.getIpAddr(request));
			
			int result = roleService.insert(role, request, su.getUserUuid());
			if(result == 0){	
				msg.setSuccess(false);
				msg.setMessage("保存失败！");
				return msg;
			}
			msg.setSuccess(true);
			msg.setMessage("保存成功！");
		}catch(Exception e){
			msg.setSuccess(false);
			msg.setMessage("保存失败！");
		}
		
		return msg;
	}
	
	
	/**
	 * 更新页面的modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updateFormModal/{id}", method = RequestMethod.GET)
	public String updateFormModal(@PathVariable("id") Long id, Model model){
		Role role = roleService.getRoleById(id);
		if(role == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("role", role);
		model.addAttribute("action", "update");
		return "/admin/role/roleFormModal";
	}
	
	/**
	 * 更新用户信息
	 * @param
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST )
	@ResponseBody
	public Message update(@Validated @ModelAttribute("preloadRole") Role role,
	                      HttpServletRequest request) {
		try{
			//添加修改人信息
			ShiroUser su = super.getLoginUser(request);
			role.setUpdatedid(su.getUserUuid().toString());
			role.setUpdatedtime(DateTimeUtil.nowTimeStr());
			role.setUpdatedip(OperationUtil.getIpAddr(request));
			
			int result = roleService.updateRole(role, request, su.getUserUuid());
			if(result == 0){
				msg.setSuccess(false);
				msg.setMessage("更新失败！");
				return msg;
			}
			msg.setSuccess(true);
			msg.setMessage("更新成功");
		}catch(Exception e){
			e.printStackTrace();
			msg.setSuccess(false);
			msg.setMessage("更新失败！" + e.getMessage());
		}
		
		return msg;
	}
	
	
	/**
	 * 删除角色
	 * @param
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(@RequestParam(value = "ids") List<Long> ids, HttpServletRequest request){
		try{
			ShiroUser su = super.getLoginUser(request);
			for(long id : ids){
				roleService.delete(id, request, su.getUserUuid());
			}
			
			msg.setSuccess(true);
			msg.setMessage("删除成功！");
			msg.setData("");
		}catch(Exception e){
			e.printStackTrace();
			msg.setSuccess(false);
			msg.setMessage("删除失败！");
			msg.setData("");
		}
		
		return msg;
	}
	
	/**
	 * 授权操作Modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="authorizeModal/{id}")
	public String authorizeModal(@PathVariable("id")Long id, Model model){
		//获取角色-权限信息
		Map<String, Object> filterParams = new HashMap<String, Object>();
		filterParams.put("roleId", id);
		List<RolePermission> rolePermissions = rolePermissionService.getRolePermissions(filterParams);
		
		model.addAttribute("roleId", id);
		model.addAttribute("rolePermissions", rolePermissions);
		model.addAttribute("action", "authorize");
		return "/admin/role/roleAuthorizeModal";
	}
	
	
	/**
	 * 授权操作
	 * @param
	 * @param
	 * @return
	 */
	@RequestMapping(value="authorize")
	@ResponseBody
	public Message authorize(@ModelAttribute("preloadRole") Role role, HttpServletRequest request){
		try{
			ShiroUser su = super.getLoginUser(request);
			if(role == null){
				msg.setSuccess(false);
				msg.setMessage("角色已被删除。");
				msg.setData("");
				return msg;
			}
			String permissionIds = role.getPermissionIds();
			Long roleId = role.getId();
			String[] permissionIdArray = new String[]{};
			if(roleId != null && permissionIds != null){
				//删除原 角色-权限关系
				rolePermissionService.deleteByRoleId(roleId, request, su.getUserUuid());
				
				//全不选时permissionIds会为空字符串
				if(permissionIds != null && permissionIds.length() > 0){
					permissionIdArray = permissionIds.split(",");
					
					RolePermission rolePermission;
					Permission permission;
					for(String permissionId : permissionIdArray){
						rolePermission = new RolePermission();
						rolePermission.setRoleId(roleId);
						rolePermission.setPermissionId(Long.valueOf(permissionId));
						permission = permissionService.getPermissionById(Long.valueOf(permissionId));
						rolePermission.setPermissionValue(permission.getValue());
						rolePermissionService.insert(rolePermission, request, su.getUserUuid());
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
	 * 查看信息modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="viewModal/{id}", method = RequestMethod.GET)
	public String viewModal(@PathVariable("id") Long id, Model model){
		Role role = roleService.getRoleById(id);
		if(role == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("role", role);
		
		return "/admin/role/roleViewModal";
	}
	
	
	
	/**
	 * 拦截，从数据库中获取完整信息，填充前台为空的数据，保障数据完整性
	 * @param id
	 * @return
	 */
	@ModelAttribute("preloadRole")
	public Role getRole(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return roleService.getRoleById(id);
		}
		return null;
	}
	
	
	/**
	 * 获取整个角色树，一层结构
	 * @param request
	 * @return
	 */
	@RequestMapping("roleTree")
	@ResponseBody
	public List<Tree> findAllTree(ServletRequest request) {
		Map<String, Object> filterParams = new HashMap<String, Object>();
		return roleService.roleTree(filterParams);
	}
}
