/**
 * 
 */
package com.project.bean;

import java.io.Serializable;

/**
 * @author howroad
 * @Date 2018年3月30日
 * @version 1.0
 */
@SuppressWarnings("serial")
public class OperateLogBean implements Serializable{
	private int ologId;
	private String ologAction;
	private String ologTime;
	private UserBean ologUser;
	public OperateLogBean() {
		super();
	}
	public OperateLogBean(int ologId, String ologAction, String ologTime, UserBean ologUser) {
		super();
		this.ologId = ologId;
		this.ologAction = ologAction;
		this.ologTime = ologTime;
		this.ologUser = ologUser;
	}
	public int getOlogId() {
		return ologId;
	}
	public void setOlogId(int ologId) {
		this.ologId = ologId;
	}
	public String getOlogAction() {
		return ologAction;
	}
	public void setOlogAction(String ologAction) {
		this.ologAction = ologAction;
	}
	public String getOlogTime() {
		return ologTime;
	}
	public void setOlogTime(String ologTime) {
		this.ologTime = ologTime;
	}
	public UserBean getOlogUser() {
		return ologUser;
	}
	public void setOlogUser(UserBean ologUser) {
		this.ologUser = ologUser;
	}
	@Override
	public String toString() {
		return "OperateLogBean [ologId=" + ologId + ", ologAction=" + ologAction + ", ologTime=" + ologTime
				+ ", ologUser=" + ologUser + "]";
	}
}
