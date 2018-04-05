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
public class InsectBean implements Serializable{
	private int insId;
	private String insName;
	private String insMaster;
	private String insBreed;
	private String insEnemy;
	private String insChildPic;
	private String insOldPic;
	private String insCure;
	private String insHarm;
	public InsectBean() {
		super();
	}
	public InsectBean(int insId, String insName, String insMaster, String insBreed, String insEnemy, String insChildPic,
			String insOldPic, String insCure, String insHarm) {
		super();
		this.insId = insId;
		this.insName = insName;
		this.insMaster = insMaster;
		this.insBreed = insBreed;
		this.insEnemy = insEnemy;
		this.insChildPic = insChildPic;
		this.insOldPic = insOldPic;
		this.insCure = insCure;
		this.insHarm = insHarm;
	}
	public int getInsId() {
		return insId;
	}
	public void setInsId(int insId) {
		this.insId = insId;
	}
	public String getInsName() {
		return insName;
	}
	public void setInsName(String insName) {
		this.insName = insName;
	}
	public String getInsMaster() {
		return insMaster;
	}
	public void setInsMaster(String insMaster) {
		this.insMaster = insMaster;
	}
	public String getInsBreed() {
		return insBreed;
	}
	public void setInsBreed(String insBreed) {
		this.insBreed = insBreed;
	}
	public String getInsEnemy() {
		return insEnemy;
	}
	public void setInsEnemy(String insEnemy) {
		this.insEnemy = insEnemy;
	}
	public String getInsChildPic() {
		return insChildPic;
	}
	public void setInsChildPic(String insChildPic) {
		this.insChildPic = insChildPic;
	}
	public String getInsOldPic() {
		return insOldPic;
	}
	public void setInsOldPic(String insOldPic) {
		this.insOldPic = insOldPic;
	}
	public String getInsCure() {
		return insCure;
	}
	public void setInsCure(String insCure) {
		this.insCure = insCure;
	}
	public String getInsHarm() {
		return insHarm;
	}
	public void setInsHarm(String insHarm) {
		this.insHarm = insHarm;
	}
	@Override
	public String toString() {
		return "InsectBean [insId=" + insId + ", insName=" + insName + ", insMaster=" + insMaster + ", insBreed="
				+ insBreed + ", insEnemy=" + insEnemy + ", insChildPic=" + insChildPic + ", insOldPic=" + insOldPic
				+ ", insCure=" + insCure + ", insHarm=" + insHarm + "]";
	}
}
