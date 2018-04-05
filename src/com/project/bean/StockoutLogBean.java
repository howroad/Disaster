/**
 * 
 */
package com.project.bean;

import java.io.Serializable;
import java.util.List;

/**
 * @author howroad
 * @Date 2018年3月30日
 * @version 1.0
 */
@SuppressWarnings("serial")
public class StockoutLogBean implements Serializable{
	private int slogId;
	private String slogDate;
	private ClassBean slogClass;
	private UserBean slogUser;
	private List<StockoutDetalBean> sdtlList;
	public StockoutLogBean() {
		super();
	}
	public StockoutLogBean(int slogId, String slogDate, ClassBean slogClass, UserBean slogUser,
			List<StockoutDetalBean> sdtlList) {
		super();
		this.slogId = slogId;
		this.slogDate = slogDate;
		this.slogClass = slogClass;
		this.slogUser = slogUser;
		this.sdtlList = sdtlList;
	}
	public int getSlogId() {
		return slogId;
	}
	public void setSlogId(int slogId) {
		this.slogId = slogId;
	}
	public String getSlogDate() {
		return slogDate;
	}
	public void setSlogDate(String slogDate) {
		this.slogDate = slogDate;
	}
	public ClassBean getSlogClass() {
		return slogClass;
	}
	public void setSlogClass(ClassBean slogClass) {
		this.slogClass = slogClass;
	}
	public UserBean getSlogUser() {
		return slogUser;
	}
	public void setSlogUser(UserBean slogUser) {
		this.slogUser = slogUser;
	}
	public List<StockoutDetalBean> getSdtlList() {
		return sdtlList;
	}
	public void setSdtlList(List<StockoutDetalBean> sdtlList) {
		this.sdtlList = sdtlList;
	}
	@Override
	public String toString() {
		return "StockoutLogBean [slogId=" + slogId + ", slogDate=" + slogDate + ", slogClass=" + slogClass
				+ ", slogUser=" + slogUser;
	}
}
