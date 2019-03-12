package com.infotop.utils;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 部分操作时使用到的方法
 * 
 * 2016年10月7日下午1:56:06
 */
public class OperationUtil {

	/**
	 * 生成uuid
	 * @return
	 */
	public static String getUUID(){
		UUID uuid = UUID.randomUUID();
	    return uuid.toString();
	}
	
	
	/**
	 * 获取客户端IP
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
       String ip = request.getHeader("x-forwarded-for"); 
       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
           ip = request.getHeader("Proxy-Client-IP"); 
       } 
       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
           ip = request.getHeader("WL-Proxy-Client-IP"); 
       } 
       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
           ip = request.getRemoteAddr(); 
       } 
       return ip; 
   } 
	
	/**
	 * 获取路径url (http:xxxx:8080/xxProjectName/)
	 * @param request
	 * @return
	 */
	public static String getHttpUrl(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append(request.getScheme() + "://");
		sb.append(request.getServerName() + ":" );
		sb.append(request.getServerPort());
		sb.append(request.getContextPath() + "/"); 
		return sb.toString();
	}
	
	/**
	 * 判断内容是否包含中文以及中文标点
	 * @param str
	 * @return
	 */
	public static boolean checkChinese(String str){
		boolean result = false;
		Pattern p = Pattern.compile("[\u4E00-\u9FA5]|[^\\x00-\\xff]");
		Matcher m = p.matcher(str);
		if(m.find()){
			result = true;
		}
		
		return result;
	}
	
	/**
	 * 根据传入的正则规则校验被校验值是否正确
	 * @param regex 正则规则
	 * @param str 被校验值
	 * @return
	 */
	public static boolean validateRegex(String regex, String str){
		str = str == null?"":str;
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(str);
		if(m.find()){
			return true;
		}
		
		return false;
	}
	
}
