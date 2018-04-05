/**
 * 
 */
package com.project.bean;

import java.io.Serializable;

/**
 * @author howroad
 * @Date 2018年3月30日
 * @version 1.1	修正了Forest字段
 */
@SuppressWarnings("serial")
public class AreaBean implements Serializable{
	private int areaId;
	private String areaName;
	private String areaForest;
	private String areaAdv;
	private int areaLand;
	private ClassBean areaClass;
	public AreaBean() {
		super();
	}
	public AreaBean(int areaId, String areaName, String areaForest, String areaAdv, int areaLand, ClassBean areaClass) {
		super();
		this.areaId = areaId;
		this.areaName = areaName;
		this.areaForest = areaForest;
		this.areaAdv = areaAdv;
		this.areaLand = areaLand;
		this.areaClass = areaClass;
	}
	public int getAreaId() {
		return areaId;
	}
	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getAreaForest() {
		return areaForest;
	}
	public void setAreaForest(String areaForest) {
		this.areaForest = areaForest;
	}
	public String getAreaAdv() {
		return areaAdv;
	}
	public void setAreaAdv(String areaAdv) {
		this.areaAdv = areaAdv;
	}
	public int getAreaLand() {
		return areaLand;
	}
	public void setAreaLand(int areaLand) {
		this.areaLand = areaLand;
	}
	public ClassBean getAreaClass() {
		return areaClass;
	}
	public void setAreaClass(ClassBean areaClass) {
		this.areaClass = areaClass;
	}
	@Override
	public String toString() {
		return "AreaBean [areaId=" + areaId + ", areaName=" + areaName + ", areaForest=" + areaForest + ", areaAdv="
				+ areaAdv + ", areaLand=" + areaLand +", areaClass=" + areaClass+ "]";
	}
}
