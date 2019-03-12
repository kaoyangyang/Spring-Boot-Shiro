package com.infotop.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

/**
 * Created  on 2018/7/5 10:39.
 * 作者: Dengjb
 * 说明:
 */
@Data
@TableName("girl")

public class Girl {
	@TableId(type = IdType.AUTO)
private Integer id;
	@TableField
private Integer age;


	@TableField
private String name;
	@TableField
	private String password;
	@TableField
	private String url;
	@TableField
	private String clickNum;
	@TableField
	private String addTime;


}
