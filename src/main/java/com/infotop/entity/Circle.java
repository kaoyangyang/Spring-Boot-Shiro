package com.infotop.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;

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
public class Circle extends Model<Circle> {

    private static final long serialVersionUID = 1L;

    /**
     * 圈子ID
     */
	private String id;
    /**
     * 圈子名称
     */
	private String name;
    /**
     * 圈子类型
     */
	private String type;
    /**
     * 圈子头像小图
     */
	@TableField("sm_pic")
	private String smPic;
    /**
     * 圈子头像中图
     */
	@TableField("mid_pic")
	private String midPic;
    /**
     * 圈子头像大图
     */
	@TableField("lg_pic")
	private String lgPic;
    /**
     * 圈子描述
     */
	private String introduction;
    /**
     * 内容权限:1公开,0仅圈内可见
     */
	@TableField("cotent_status")
	private Integer cotentStatus;
    /**
     * 加入方式:0,任何人,1需审批,3邀请加入
     */
	@TableField("join_status")
	private Integer joinStatus;
    /**
     * 圈子话题:1开启,0关闭
     */
	@TableField("topic_status")
	private Integer topicStatus;
    /**
     * 上传权限:0圈内成员,1管理员
     */
	@TableField("upload_status")
	private Integer uploadStatus;
    /**
     * 下载权限:0,圈内成员,2仅管理员,3任何人
     */
	@TableField("download_status")
	private Integer downloadStatus;
	@TableField("creat_user_id")
	private String creatUserId;
    /**
     * 圈子状态:0未审核,1什么通过,2未通过
     */
	private Integer status;
    /**
     * 成员数量
     */
	@TableField("member_nums")
	private Integer memberNums;
    /**
     * 创建时间
     */
	@TableField("creat_time")
	private Date creatTime;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSmPic() {
		return smPic;
	}

	public void setSmPic(String smPic) {
		this.smPic = smPic;
	}

	public String getMidPic() {
		return midPic;
	}

	public void setMidPic(String midPic) {
		this.midPic = midPic;
	}

	public String getLgPic() {
		return lgPic;
	}

	public void setLgPic(String lgPic) {
		this.lgPic = lgPic;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public Integer getCotentStatus() {
		return cotentStatus;
	}

	public void setCotentStatus(Integer cotentStatus) {
		this.cotentStatus = cotentStatus;
	}

	public Integer getJoinStatus() {
		return joinStatus;
	}

	public void setJoinStatus(Integer joinStatus) {
		this.joinStatus = joinStatus;
	}

	public Integer getTopicStatus() {
		return topicStatus;
	}

	public void setTopicStatus(Integer topicStatus) {
		this.topicStatus = topicStatus;
	}

	public Integer getUploadStatus() {
		return uploadStatus;
	}

	public void setUploadStatus(Integer uploadStatus) {
		this.uploadStatus = uploadStatus;
	}

	public Integer getDownloadStatus() {
		return downloadStatus;
	}

	public void setDownloadStatus(Integer downloadStatus) {
		this.downloadStatus = downloadStatus;
	}

	public String getCreatUserId() {
		return creatUserId;
	}

	public void setCreatUserId(String creatUserId) {
		this.creatUserId = creatUserId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getMemberNums() {
		return memberNums;
	}

	public void setMemberNums(Integer memberNums) {
		this.memberNums = memberNums;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
