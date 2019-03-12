package com.infotop.controller.sys;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.infotop.common.coreUtils.ShiroUser;
import com.infotop.controller.BasicController;
import com.infotop.entity.sys.Authority;
import com.infotop.service.sys.AuthorityService;
import com.infotop.utils.DataGrid;
import com.infotop.utils.OperationUtil;
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
 * 权限管理控制类
 */
@Controller
@RequestMapping("/admin/authority")
public class AuthorityController extends BasicController{

	@Autowired
	private AuthorityService authorityService;
	
	
	/**
	 * 展示页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("")
	public String list(HttpServletRequest request, Model model){
		
		return "/admin/authority/authorityList";
	}
	
	
	/**
	 * 新增modal
	 * @param model
	 * @return
	 */
	@RequestMapping("insertFormModal")
	public String insertFormModal(Model model, HttpServletRequest request){
		Authority entity = new Authority();
		model.addAttribute("permission", entity);
		model.addAttribute("action", "insert");
		return "/admin/authority/authorityFormModal";
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
	public Message insert(@Validated Authority authority, HttpServletRequest request, Model model){
		Message msg = new Message();
		try{
			//添加创建信息
			ShiroUser su = super.getLoginUser(request);
			
			authority.setUuid(OperationUtil.getUUID());
			
			int result = authorityService.insert(authority);	
			if(result == 0){	//SQL执行失败
				msg.setSuccess(false);
				msg.setMessage("保存失败！");
				msg.setData(authority);
				return msg;
			}
			
			msg.setSuccess(true);
			msg.setMessage("保存成功！");
			msg.setData(authority);
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
		Authority entity = authorityService.getAuthorityById(id);
		if(entity == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("authority", entity);
		model.addAttribute("action", "update");
		return "/admin/authority/authorityFormModal";
	}
	
	/**
	 * 更新权限信息
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST )
	@ResponseBody
	public Message update(@Validated @ModelAttribute("preloadAuthority") Authority authroity,
			HttpServletRequest request) {
		try{
			ShiroUser su = super.getLoginUser(request);
			
			authorityService.update(authroity);
			msg.setSuccess(true);
			msg.setMessage("更新成功");
			msg.setData(authroity);
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
		List<Authority> authoritys = authorityService.selectAll();
		//查询总数	
		Long total = authorityService.selectAllCount();
		try{
			result.setTotal(total);  
			result.setRows(authoritys);  
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
	@ModelAttribute("preloadAuthority")
	public Authority getAuthority(@RequestParam(value = "id", required = false) Long id) {
		if (id != null) {
			return authorityService.getAuthorityById(id);
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
		Authority entity = authorityService.getAuthorityById(id);
		if(entity == null){
			return "redirect:/error/noEntityModal";
		}
		model.addAttribute("authority", entity);
		
		return "/admin/authority/authorityViewModal";
	}
	
	
	/**
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(@RequestParam(value = "uuids") List<String> uuids){
		try{
			for(String uuid : uuids){
				authorityService.deleteByUuid(uuid);
			}
			msg.setSuccess(true);
			msg.setMessage("删除成功！");
			msg.setData("");
			return msg;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		msg.setSuccess(false);
		msg.setMessage("删除失败！");
		msg.setData("");
		return msg;
	}
	
	
	@RequestMapping("updateAuthority")
	@ResponseBody
	public Message updateAuthority(){
		try{
			int result = authorityService.updateAuthority();
			
			msg.setSuccess(true);
			msg.setMessage("更新成功！");
			msg.setData("");
			return msg;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		msg.setSuccess(false);
		msg.setMessage("更新失败！");
		msg.setData("");
		return msg;
	}
}
