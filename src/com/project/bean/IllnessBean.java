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
public class IllnessBean implements Serializable{
	private int illId;
	private String illName;
	private String illCause;
	private String illStatus;
	private String illLaw;
	private String illPic;
	private String illCure;
	private String illHarm;
	public IllnessBean() {
		super();
	}
	public IllnessBean(int illId, String illName, String illCause, String illStatus, String illLaw, String illPic,
			String illCure, String illHarm) {
		super();
		this.illId = illId;
		this.illName = illName;
		this.illCause = illCause;
		this.illStatus = illStatus;
		this.illLaw = illLaw;
		this.illPic = illPic;
		this.illCure = illCure;
		this.illHarm = illHarm;
	}
	public int getIllId() {
		return illId;
	}
	public void setIllId(int illId) {
		this.illId = illId;
	}
	public String getIllName() {
		return illName;
	}
	public void setIllName(String illName) {
		this.illName = illName;
	}
	public String getIllCause() {
		return illCause;
	}
	public void setIllCause(String illCause) {
		this.illCause = illCause;
	}
	public String getIllStatus() {
		return illStatus;
	}
	public void setIllStatus(String illStatus) {
		this.illStatus = illStatus;
	}
	public String getIllLaw() {
		return illLaw;
	}
	public void setIllLaw(String illLaw) {
		this.illLaw = illLaw;
	}
	public String getIllPic() {
		return illPic;
	}
	public void setIllPic(String illPic) {
		this.illPic = illPic;
	}
	public String getIllCure() {
		return illCure;
	}
	public void setIllCure(String illCure) {
		this.illCure = illCure;
	}
	public String getIllHarm() {
		return illHarm;
	}
	public void setIllHarm(String illHarm) {
		this.illHarm = illHarm;
	}
	@Override
	public String toString() {
		return "IllnessBean [illId=" + illId + ", illName=" + illName + ", illCause=" + illCause + ", illStatus="
				+ illStatus + ", illLaw=" + illLaw + ", illPic=" + illPic + ", illCure=" + illCure + ", illHarm="
				+ illHarm + "]";
	}
}
