package com.infotop.controller.sys;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.infotop.common.coreUtils.DateTimeUtil;
import com.infotop.common.coreUtils.OperationUtil;
import com.infotop.common.coreUtils.ShiroUser;
import com.infotop.controller.BasicController;
import com.infotop.entity.sys.Permission;
import com.infotop.service.sys.PermissionService;
import com.infotop.service.sys.UserService;
import com.infotop.utils.DataGrid;
import com.infotop.utils.Tree;
import org.apache.commons.lang3.StringUtils;
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
 * 权限管理控制类
 */
@Controller
@RequestMapping("/admin/permission")
public class PermissionController extends BasicController{

	@Autowired
	private UserService userService;
	
	@Autowired
	private PermissionService permissionService;
	
	/**
	 * 权限树展示页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("")
	public String list(HttpServletRequest request, Model model){
		
		return "/admin/permission/permissionTreeList";
	}
	
	
	/**
	 * 查询权限信息树
	 * @param
	 * @param request
	 * @return
	 */
	@RequestMapping("findTreeList")
	@ResponseBody
	public List<Tree> findTreeList(
		ServletRequest request) {
		String pid = request.getParameter("id");
		pid = StringUtils.isBlank(pid)?"0":pid;
		Map<String, Object> filterParams = new HashMap<String, Object>();
		filterParams.put("pid", pid);
		return permissionService.permissionTree(filterParams);
	}
	
	/**
	 * 获取整个权限树
	 * @param request
	 * @return
	 */
	@RequestMapping("findAllTree")
	@ResponseBody
	public List<Tree> findAllTree(ServletRequest request) {
		Map<String, Object> filterParams = new HashMap<String, Object>();
		return permissionService.permissionTree(filterParams);
	}
	
	/**
	 * 新增权限modal
	 * @param model
	 * @return
	 */
	@RequestMapping("insertFormModal/{pid}")
	public String insertFormModal(Model model,
	                              @PathVariable("pid") String pid, HttpServletRequest request){
		pid = StringUtils.isBlank(pid)?"0":pid;	//为空则默认为0，即根节点
		Permission entity = new Permission();
		entity.setSort(0);
		//获取父权限节点的信息做关联
		Permission parentNode = permissionService.getPermissionById(Long.valueOf(pid));
		if(parentNode != null){
			entity.setPuuid(parentNode.getUuid());
		}
		
		entity.setPid(Long.valueOf(pid));
		model.addAttribute("permission", entity);
		model.addAttribute("action", "insert");
		return "/admin/permission/permissionFormModal";
	}
	
	
	/**
	 * 插入权限信息
	 * @param
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	@ResponseBody
	public Message insert(@Validated Permission permission, HttpServletRequest request, Model model){
		Message msg = new Message();
		try{
			//添加创建信息
			ShiroUser su = super.getLoginUser(request);
			permission.setUuid(OperationUtil.getUUID());
			permission.setCreatedid(su.getUserUuid().toString());
			permission.setCreatedtime(DateTimeUtil.nowTimeStr());
			permission.setCreatedid(OperationUtil.getIpAddr(request));
			
			int result = permissionService.insert(permission);	
			if(result == 0){	//SQL执行失败
				msg.setSuccess(false);
				msg.setMessage("保存失败！");
				msg.setData(permission);
				return msg;
			}
			
			msg.setSuccess(true);
			msg.setMessage("保存成功！");
			msg.setData(permission);
		}catch(Exception e){
			msg.setSuccess(false);
			msg.setMessage("保存失败！");
		}
		
		return msg;
	}
	
	/**
	 * 检验是否有相同二级分类的兄弟节点
	 * @param
	 * @param
	 * @param id
	 * @return
	 */
	@RequestMapping(value="checkValue")
	@ResponseBody
	public boolean checkValue(@RequestParam(value="value") String value,
			@RequestParam(value="id", defaultValue="-1") Long id){
		if(!StringUtils.isBlank(value)){
			List<Permission> brothers = null;
			Map<String, Object> filterParams = new HashMap<String, Object>();
			filterParams.put("value", value);
			
			//数据库中1. 不存在相同值的节点；2. 存在但是是其本身；这两者都可以验证通过，否则视为已存在相同权限值节点。
			brothers = permissionService.getPermissions(filterParams);
			if((brothers != null && brothers.size() <= 0)){
				msg.setSuccess(true);
				msg.setMessage("检验成功。");
				return true;
			}else if(brothers != null && brothers.size() == 1){
				if(brothers.get(0).getId().longValue() == id.longValue()){
					msg.setSuccess(true);
					msg.setMessage("检验成功。");
					return true;
				}
			}
			
			msg.setSuccess(false);
			msg.setMessage("已存在相同权限值的节点，无法重复添加！");
			return false;
		}else{
			msg.setSuccess(false);
			msg.setMessage("权限值不能为空。");
			return false;
		}
		
	}
	
	/**
	 * 更新页面的modal
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "updateFormModal/{id}", method = RequestMethod.GET)
	public String updateFormModal(@PathVariable("id") Long id, Model model){
		Permission entity = permissionService.getPermissionById(id);
		if(entity == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("permission", entity);
		model.addAttribute("action", "update");
		return "/admin/permission/permissionFormModal";
	}
	
	/**
	 * 更新权限信息
	 * @param
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST )
	@ResponseBody
	public Message update(@Validated @ModelAttribute("preloadPermission") Permission permission,
			HttpServletRequest request) {
		try{
			ShiroUser su = super.getLoginUser(request);
			permission.setUpdatedid(su.getUserUuid().toString());
			permission.setUpdatedtime(DateTimeUtil.nowTimeStr());
			permission.setUpdatedip(OperationUtil.getIpAddr(request));
			
			permissionService.updatePermission(permission);
			msg.setSuccess(true);
			msg.setMessage("更新成功");
			msg.setData(permission);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	/**
	 * 获取权限列表数据
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
		
		//ObjectMapper mapper = new ObjectMapper();
		//查询本页结果
		//查询总数	
		//查询本页结果
		List<Permission> permissions = permissionService.getPermissions(searchParams);
		//查询总数	
		Long total = permissionService.getPermissionsCount(searchParams);
	
		try{
			result.setTotal(total);  
			result.setRows(permissions);  
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
	@ModelAttribute("preloadPermission")
	public Permission getUser(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return permissionService.getPermissionById(id);
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
		Permission entity = permissionService.getPermissionById(id);
		if(entity == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("permission", entity);
		
		return "/admin/permission/permissionViewModal";
	}
	
	
	/**
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(@RequestParam(value = "ids") List<Long> ids){
		try{
			int result = permissionService.deleteByIds(ids);
			if(result == 0){
				msg.setSuccess(true);
				msg.setMessage("删除成功！");
				msg.setData("");
				return msg;
			}else if(result == 2){
				msg.setSuccess(false);
				msg.setMessage("删除失败！该节点下存在子节点，不能删除。");
				msg.setData("");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		msg.setSuccess(false);
		msg.setMessage("删除失败！");
		msg.setData("");
		return msg;
	}
}
