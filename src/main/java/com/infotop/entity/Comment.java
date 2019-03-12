package com.infotop.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

/**
 * Created  on 2018/10/24 9:22.
 * 作者: Dengjb
 * 说明:
 */
@Data
@TableName("comment")
public class Comment {


		@TableId(type = IdType.AUTO)
		private Integer id;
		@TableField
		private String content;


	@TableField("user_id")
		private String userId;
}
