package com.infotop.utils;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * Created  on 18-6-29 上午8:55.
 * 作者: Dengjiabin
 * 说明:
 */
@ApiModel("返回结果")
public class Result<T> {
	@ApiModelProperty(value = "状态码")
	private Integer code;
	@ApiModelProperty(value = "消息描述")
	private String msg;
	@ApiModelProperty(value = "返回实体")
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
