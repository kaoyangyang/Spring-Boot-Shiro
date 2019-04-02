package com.infotop.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author Dengjb
 * @since 2019-03-12
 */
@ApiModel("圈子")
@Data
public class Circle extends Model<Circle> {

    private static final long serialVersionUID = 1L;

    /**
     * 圈子ID
     */
    @ApiModelProperty(value = "id")
	private String id;
    /**
     * 圈子名称
     */
    @ApiModelProperty(value = "圈子名称")
	private String name;
    /**
     * 圈子类型
     */
    @ApiModelProperty(value = "圈子类型")
	private String type;
    /**
     * 圈子头像小图
     */
    @ApiModelProperty(value = "圈子头像小图")
	@TableField("sm_pic")
	private String smPic;
    /**
     * 圈子头像中图
     */
    @ApiModelProperty(value = "圈子头像中图")
	@TableField("mid_pic")
	private String midPic;
    /**
     * 圈子头像大图
     */
    @ApiModelProperty(value = "圈子头像大图")
	@TableField("lg_pic")
	private String lgPic;
    /**
     * 圈子描述
     */
    @ApiModelProperty(value = "圈子描述")
	private String introduction;
    /**
     * 内容权限:1公开,0仅圈内可见
     */
    @ApiModelProperty(value = "内容权限:1公开,0仅圈内可见")
	@TableField("cotent_status")
	private Integer cotentStatus;
    /**
     * 加入方式:0,任何人,1需审批,3邀请加入
     */
    @ApiModelProperty(value = "加入方式:0,任何人,1需审批,3邀请加入")
	@TableField("join_status")
	private Integer joinStatus;
    /**
     * 圈子话题:1开启,0关闭
     */
    @ApiModelProperty(value = "圈子话题:1开启,0关闭")
	@TableField("topic_status")
	private Integer topicStatus;
    /**
     * 上传权限:0圈内成员,1管理员
     */
    @ApiModelProperty(value = "上传权限:0圈内成员,1管理员")
	@TableField("upload_status")
	private Integer uploadStatus;
    /**
     * 下载权限:0,圈内成员,2仅管理员,3任何人
     */
    @ApiModelProperty(value = "圈子名称")
	@TableField("download_status")
	private Integer downloadStatus;


	@ApiModelProperty(value = "creat_user_id")
	@TableField("creat_user_id")
	private String creatUserId;
    /**
     * 圈子状态:0未审核,1什么通过,2未通过
     */
    @ApiModelProperty(value = "圈子状态:0未审核,1什么通过,2未通过")
	private Integer status;
    /**
     * 成员数量
     */
    @ApiModelProperty(value = "成员数量")
	@TableField("member_nums")
	private Integer memberNums;
    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间")
	@TableField("creat_time")
	private Date creatTime;



	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
