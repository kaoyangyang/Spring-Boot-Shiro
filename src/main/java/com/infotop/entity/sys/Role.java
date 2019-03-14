package com.infotop.entity.sys;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 角色表
 * 数据库表：sys_role
 * 
 * 2016年10月17日上午9:57:37
 */
@TableName("sys_role")
public class Role {
    private Long id;	
    private String uuid;
    private String name;	//角色名称
    private String remark;	//角色备注信息
    private String createdid;     //创建人id
    private String createdtime;     //创建时间
    private String createdip;     //创建人IP
    private String updatedid;     //修改人id
    private String updatedtime;     //修改时间
    private String updatedip;		//修改人IP
	@TableField(exist = false)
    private String permissionIds;	//权限ids，用于转换使用

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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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

	public String getPermissionIds() {
		return permissionIds;
	}

	public void setPermissionIds(String permissionIds) {
		this.permissionIds = permissionIds;
	}
    
}