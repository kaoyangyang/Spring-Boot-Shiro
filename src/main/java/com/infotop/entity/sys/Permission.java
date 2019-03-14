package com.infotop.entity.sys;

import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 权限表
 * 数据库表:sys_permission
 * 
 * 2016年10月17日上午10:39:32
 */
@TableName("sys_permission")
public class Permission {
    private Long id;
    private String uuid;
    private String name;	//权限名称
    private String value;	//权限值
    private Long pid;	//节点父id
    private String puuid;	//节点父uuid
    private String permissionType;	//权限类型
    private Integer sort;	//排序号
    private String remark;	//备注
    private String createdid;     //
    private String createdtime;     //
    private String createdip;     //
    private String updatedid;     //
    private String updatedtime;     //
    private String updatedip;     //

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
        this.uuid = uuid == null ? null : uuid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getPuuid() {
        return puuid;
    }

    public void setPuuid(String puuid) {
        this.puuid = puuid == null ? null : puuid.trim();
    }

    public String getPermissionType() {
        return permissionType;
    }

    public void setPermissionType(String permissionType) {
        this.permissionType = permissionType == null ? null : permissionType.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

	public String getCreatedid() {
		return createdid;
	}

	public void setCreatedid(String createdid) {
		this.createdid = createdid;
	}

	public String getCreatedtime() {
		return createdtime;
	}

	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}

	public String getCreatedip() {
		return createdip;
	}

	public void setCreatedip(String createdip) {
		this.createdip = createdip;
	}

	public String getUpdatedid() {
		return updatedid;
	}

	public void setUpdatedid(String updatedid) {
		this.updatedid = updatedid;
	}

	public String getUpdatedtime() {
		return updatedtime;
	}

	public void setUpdatedtime(String updatedtime) {
		this.updatedtime = updatedtime;
	}

	public String getUpdatedip() {
		return updatedip;
	}

	public void setUpdatedip(String updatedip) {
		this.updatedip = updatedip;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}