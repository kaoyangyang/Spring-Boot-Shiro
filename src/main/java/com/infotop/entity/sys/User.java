package com.infotop.entity.sys;


import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 用户表
 * 数据库表：sys_user
 * 
 * 2016年10月17日上午10:53:59
 */
public class User {
    private Long id;
    private String uuid;	//uuid，唯一标识符
    private String loginName;	//登录账号
    private String password;	//密码
    private String salt;		//
    private String theme;		//主题
    private Integer type;			//用户类型，1学员、2教师、3管理员、超级管理员
    private String status;		//用户状态，0：使用中；1：删除（假删除）
    private String email;		//用户email
    private String phone;		//用户联系方式
    private String createdTime;	//创建时间
    private String updatedTime;
    private String createdIp;
    private String updatedIp;
    
    private String payPassword;	//付款密码
    private String payPasswordSalt;	//付款密码盐
    private String lastLoginTime;	//最后一次登录时间
    private String lastLoginIp;		//最后一次登录IP
    private String idnumber;		//身份证号
    
    private String plainPassword;	//修改密码时使用
    private String roleIds;			//赋权时作为临时字段获取角色id
    private String nickname;		//昵称
    private String largeAvatar;			//头像
    private String smallAvatar;		//小头像
    private String middleAvatar;	//中头像
    
    
    //用于新增教师用户时向个人信息表中传递数据
    private String realname;	//与个人信息表字段对应
    private String signature;	//与个人信息表字段对应
    
    private String verficationCode;	//临时数据，用于校验短信验证码
    
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName == null?null:loginName.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null?null:password.trim();
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt == null?null:salt.trim();
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme == null?null:theme.trim();
	}
	
	public Integer getType() {
		return type;
	}
	
	public void setType(Integer type) {
		this.type = type;
	}
	
	
	// 不持久化到数据库，也不显示在Restful接口的属性.
	@JsonIgnore
	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}
	public String getUpdatedTime() {
		return updatedTime;
	}
	public void setUpdatedTime(String updatedTime) {
		this.updatedTime = updatedTime;
	}
	public String getCreatedIp() {
		return createdIp;
	}
	public void setCreatedIp(String createdIp) {
		this.createdIp = createdIp;
	}
	public String getUpdatedIp() {
		return updatedIp;
	}
	public void setUpdatedIp(String updatedIp) {
		this.updatedIp = updatedIp;
	}
	public String getPayPassword() {
		return payPassword;
	}
	public void setPayPassword(String payPassword) {
		this.payPassword = payPassword;
	}
	public String getPayPasswordSalt() {
		return payPasswordSalt;
	}
	public void setPayPasswordSalt(String payPasswordSalt) {
		this.payPasswordSalt = payPasswordSalt;
	}
	public String getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getLastLoginIp() {
		return lastLoginIp;
	}
	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getVerficationCode() {
		return verficationCode;
	}
	public void setVerficationCode(String verficationCode) {
		this.verficationCode = verficationCode;
	}
	public String getLargeAvatar() {
		return largeAvatar;
	}
	public void setLargeAvatar(String largeAvatar) {
		this.largeAvatar = largeAvatar;
	}
	public String getSmallAvatar() {
		return smallAvatar;
	}
	public void setSmallAvatar(String smallAvatar) {
		this.smallAvatar = smallAvatar;
	}
	public String getMiddleAvatar() {
		return middleAvatar;
	}
	public void setMiddleAvatar(String middleAvatar) {
		this.middleAvatar = middleAvatar;
	}
}