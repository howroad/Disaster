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
public class UserBean implements Serializable{
	private int userId;
	private String userName;
	private String userPwd;
	private String userRName;
	private int userGrant;
	public UserBean() {
		super();
	}
	public UserBean(int userId, String userName, String userPwd, String userRName, int userGrant) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userRName = userRName;
		this.userGrant = userGrant;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserRName() {
		return userRName;
	}
	public void setUserRName(String userRName) {
		this.userRName = userRName;
	}
	public int getUserGrant() {
		return userGrant;
	}
	public void setUserGrant(int userGrant) {
		this.userGrant = userGrant;
	}
	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", userName=" + userName + ", userPwd=" + userPwd + ", userRName="
				+ userRName + ", userGrant=" + userGrant + "]";
	}
}
