package com.infotop.enums;

/**
 * Created  on 18-6-29 上午10:15.
 * 作者: Dengjb
 * 说明:
 */

public enum ResultENum {

	UNKNOW_CODE(-1,"未知错误"),
	SUCCESS(0,"成功"),
	PRIMARY_CODE(101,"小于10岁"),
	NORMAL_CODE(100,"小于16岁,大于10岁");
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
