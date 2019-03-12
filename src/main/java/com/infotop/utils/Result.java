package com.infotop.utils;

/**
 * Created  on 18-6-29 上午8:55.
 * 作者: Dengjiabin
 * 说明:
 */

public class Result<T> {
	private Integer code;
	private String msg;
	private T data;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
