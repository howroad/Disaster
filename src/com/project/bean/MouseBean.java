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
public class MouseBean implements Serializable{
	private int mouId;
	private String mouName;
	private String mouFood;
	private String mouBreed;
	private String mouEnemy;
	private String mouPic;
	private String mouCure;
	private String mouHarm;
	public MouseBean() {
		super();
	}
	public MouseBean(int mouId, String mouName, String mouFood, String mouBreed, String mouEnemy, String mouPic,
			String mouCure, String mouHarm) {
		super();
		this.mouId = mouId;
		this.mouName = mouName;
		this.mouFood = mouFood;
		this.mouBreed = mouBreed;
		this.mouEnemy = mouEnemy;
		this.mouPic = mouPic;
		this.mouCure = mouCure;
		this.mouHarm = mouHarm;
	}
	public int getMouId() {
		return mouId;
	}
	public void setMouId(int mouId) {
		this.mouId = mouId;
	}
	public String getMouName() {
		return mouName;
	}
	public void setMouName(String mouName) {
		this.mouName = mouName;
	}
	public String getMouFood() {
		return mouFood;
	}
	public void setMouFood(String mouFood) {
		this.mouFood = mouFood;
	}
	public String getMouBreed() {
		return mouBreed;
	}
	public void setMouBreed(String mouBreed) {
		this.mouBreed = mouBreed;
	}
	public String getMouEnemy() {
		return mouEnemy;
	}
	public void setMouEnemy(String mouEnemy) {
		this.mouEnemy = mouEnemy;
	}
	public String getMouPic() {
		return mouPic;
	}
	public void setMouPic(String mouPic) {
		this.mouPic = mouPic;
	}
	public String getMouCure() {
		return mouCure;
	}
	public void setMouCure(String mouCure) {
		this.mouCure = mouCure;
	}
	public String getMouHarm() {
		return mouHarm;
	}
	public void setMouHarm(String mouHarm) {
		this.mouHarm = mouHarm;
	}
	@Override
	public String toString() {
		return "MouseBean [mouId=" + mouId + ", mouName=" + mouName + ", mouFood=" + mouFood + ", mouBreed=" + mouBreed
				+ ", mouEnemy=" + mouEnemy + ", mouPic=" + mouPic + ", mouCure=" + mouCure + ", mouHarm=" + mouHarm
				+ "]";
	}
}
