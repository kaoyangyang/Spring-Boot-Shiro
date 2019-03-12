package com.infotop.utils;

import com.infotop.thrift.basic.client.BasicDataClient;
import com.infotop.thrift.basic.common.OrgRole;
import com.infotop.thrift.basic.common.SchoolRole;
import com.infotop.thrift.basic.common.StudentParent;
import com.infotop.thrift.basic.common.UserDetail;
import com.infotop.util.JSONUtils;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.thrift.TException;

import java.io.Serializable;
import java.util.List;

public class ShiroUser implements Serializable {
		private static final long serialVersionUID = -1373760761780840081L;
		private String userUuid;
		private String loginName;
		private String jxtLoginName;
		private String name;
		private String nickname;	//昵称
		private List<String> userTypelist;
		private List<SchoolRole> schoolRoleList;
		private List<OrgRole> orgRoleList;
		private List<StudentParent> spList;
		private String status;	//状态 0：正常；	1：封禁；
		private String largeAvatar;
		private String avatar;	//头像
		private String smallAvatar;
		private String sysCodes;
		private String phone;
		private String provinceCode; //升级省平台的区划字段
		private String cityCode; //升级省平台的区划字段
		private String districtCode; //升级省平台的区划字段
		public ShiroUser(String userUuid, String loginName, String jxtLoginName, List<String> userTypelist, List<SchoolRole> schoolRoleList, List<OrgRole> orgRoleList,
		                 List<StudentParent> spList, String sysCodes, String status, String avatar, String largeAvatar,
		                 String smallAvatar, String nickname, String name, String phone,
		                 String provinceCode, String cityCode, String districtCode) {
			this.userUuid = userUuid;
			this.loginName = loginName;
			this.jxtLoginName = jxtLoginName;
			this.userTypelist = userTypelist;
			this.schoolRoleList = schoolRoleList;
			this.orgRoleList = orgRoleList;
			this.spList = spList;
			this.sysCodes = sysCodes;
			this.status = status;
			this.avatar = avatar;
			this.largeAvatar = largeAvatar;
			this.smallAvatar = smallAvatar;
			this.nickname = nickname;
			this.name = name;
			this.phone = phone;
			this.provinceCode = provinceCode; //升级省平台的区划字段
			this.cityCode = cityCode; //升级省平台的区划字段
			this.districtCode = districtCode; //升级省平台的区划字段
		}
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public List<SchoolRole> getSchoolRoleList() {
			if(this.schoolRoleList==null){
				try {
					UserDetail visitorDetail=JSONUtils.convertJsonStr2UserDetail(BasicDataClient.findUserByUserUuidOrLoginName(this.userUuid,1));
					this.schoolRoleList = visitorDetail.getSchoolRoleList();
				} catch (TException e) {
					e.printStackTrace();
				}
			}
			return schoolRoleList;
		}
		public void setSchoolRoleList(List<SchoolRole> schoolRoleList) {
			this.schoolRoleList = schoolRoleList;
		}
		public List<OrgRole> getOrgRoleList() {
			return orgRoleList;
		}
		public void setOrgRoleList(List<OrgRole> orgRoleList) {
			this.orgRoleList = orgRoleList;
		}
		public List<StudentParent> getSpList() {
			return spList;
		}
		public void setSpList(List<StudentParent> spList) {
			this.spList = spList;
		}
		public String getUserUuid() {
			return userUuid;
		}
		public void setUserUuid(String userUuid) {
			this.userUuid = userUuid;
		}
		public String getLoginName() {
			return loginName;
		}
		public void setLoginName(String loginName) {
			this.loginName = loginName;
		}
		public String getJxtLoginName() {
			return jxtLoginName;
		}
		public void setJxtLoginName(String jxtLoginName) {
			this.jxtLoginName = jxtLoginName;
		}
		public List<String> getUserTypelist() {
			return userTypelist;
		}
		public void setUserTypelist(List<String> userTypelist) {
			this.userTypelist = userTypelist;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getAvatar() {
			return avatar;
		}
		public void setAvatar(String avatar) {
			this.avatar = avatar;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
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
		public String getSysCodes() {
			return sysCodes;
		}
		public void setSysCodes(String sysCodes) {
			this.sysCodes = sysCodes;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public String getProvinceCode() {
			return provinceCode;
		}
		public void setProvinceCode(String provinceCode) {
			this.provinceCode = provinceCode;
		}
		public String getCityCode() {
			return cityCode;
		}
		public void setCityCode(String cityCode) {
			this.cityCode = cityCode;
		}
		public String getDistrictCode() {
			return districtCode;
		}
		public void setDistrictCode(String districtCode) {
			this.districtCode = districtCode;
		}
		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出.
		 */
		@Override
		public String toString() {
			return loginName;
		}

		/**
		 * 重载equals,只计算loginName;
		 */
		@Override
		public int hashCode() {
			return HashCodeBuilder.reflectionHashCode(this, "loginName");
		}

		/**
		 * 重载equals,只比较loginName
		 */
		@Override
		public boolean equals(Object obj) {
			return EqualsBuilder.reflectionEquals(this, obj, "loginName");
		}
	}