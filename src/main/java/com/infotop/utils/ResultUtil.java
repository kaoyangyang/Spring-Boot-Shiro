package com.infotop.utils;


import com.infotop.enums.ResultENum;

/**
 * Created  on 18-6-29 上午9:09.
 * 作者: LiuLiHao
 * 说明:
 */

public class ResultUtil {
	public static Result success(Object object){
		Result result = new Result();
		result.setData(object);
		result.setMsg("成功");
		result.setCode(200);
		return result;
	}
	public static Result error(Integer code ,String msg){
		Result result = new Result();
		result.setMsg(msg);
		result.setCode(code);
		return result;
	}
	public static Result error(ResultENum resultENum){
		Result result = new Result();
		result.setMsg(resultENum.getMsg());
		result.setCode(resultENum.getCode());
		return result;
	}
	public static Result success(){
		return success(null);
	}
}
