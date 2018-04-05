/**
 * 
 */
package com.project.bean;

import java.io.Serializable;

/**
 * @author howroad
 * @Date 2018年3月30日
 * @version 1.1 修正了PNUM的数据类型
 */
@SuppressWarnings("serial")
public class ClassBean implements Serializable{
	private int clsId;
	private String clsName;
	private String clsPerson;
	private String clsTel;
	private int clsPNum;
	private String clsDate;
	private AreaBean clsArea;
	public ClassBean() {
		super();
	}
	public ClassBean(int clsId, String clsName, String clsPerson, String clsTel, int clsPNum, String clsDate,
			AreaBean clsArea) {
		super();
		this.clsId = clsId;
		this.clsName = clsName;
		this.clsPerson = clsPerson;
		this.clsTel = clsTel;
		this.clsPNum = clsPNum;
		this.clsDate = clsDate;
		this.clsArea = clsArea;
	}
	public int getClsId() {
		return clsId;
	}
	public void setClsId(int clsId) {
		this.clsId = clsId;
	}
	public String getClsName() {
		return clsName;
	}
	public void setClsName(String clsName) {
		this.clsName = clsName;
	}
	public String getClsPerson() {
		return clsPerson;
	}
	public void setClsPerson(String clsPerson) {
		this.clsPerson = clsPerson;
	}
	public String getClsTel() {
		return clsTel;
	}
	public void setClsTel(String clsTel) {
		this.clsTel = clsTel;
	}
	public int getClsPNum() {
		return clsPNum;
	}
	public void setClsPNum(int clsPNum) {
		this.clsPNum = clsPNum;
	}
	public String getClsDate() {
		return clsDate;
	}
	public void setClsDate(String clsDate) {
		this.clsDate = clsDate;
	}
	public AreaBean getClsArea() {
		return clsArea;
	}
	public void setClsArea(AreaBean clsArea) {
		this.clsArea = clsArea;
	}
	@Override
	public String toString() {
		return "ClassBean [clsId=" + clsId + ", clsName=" + clsName + ", clsPerson=" + clsPerson + ", clsTel=" + clsTel
				+ ", clsPNum=" + clsPNum + ", clsDate=" + clsDate + ", clsArea=" + clsArea + "]";
	}
}
