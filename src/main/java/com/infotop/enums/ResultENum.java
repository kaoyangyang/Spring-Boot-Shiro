package com.infotop.enums;

/**
 * Created  on 18-6-29 上午10:15.
 * 作者: Dengjb
 * 说明:
 */

public enum ResultENum {

	UNKNOW_CODE(-1,"未知错误"),
	SUCCESS(0,"成功"),
	FAILD_CODE(4001,"查询失败"),
	UNNORMAL_CODE(4002,"数据异常");
	private Integer code;
	private String msg;
	 ResultENum(Integer code, String msg){
		this.code = code;
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}
}
