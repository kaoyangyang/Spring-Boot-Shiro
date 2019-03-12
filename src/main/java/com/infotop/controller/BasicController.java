package com.infotop.controller;

import com.infotop.common.coreUtils.ShiroUser;
import com.infotop.common.coreUtils.UserUtil;
import com.infotop.service.sys.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

/**  
 * 基础控制类
 */
public class BasicController {
	
	protected Message msg = new Message();

	@Autowired
	protected UserService userService;
	
	public static ShiroUser getLoginUser(HttpServletRequest request) {
		return UserUtil.getLoginUser(request);
	}
	
	
	
	/**
	 * 返回信息
	 * 
	 * 2016年9月28日下午3:10:17
	 */
	public class Message{
		public boolean success;
		public String message;
		public Object data;
		public boolean isSuccess() {
			return success;
		}
		public void setSuccess(boolean success) {
			this.success = success;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public Object getData() {
			return data;
		}
		public void setData(Object data) {
			this.data = data;
		}
	}
}
