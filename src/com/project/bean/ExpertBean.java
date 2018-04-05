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
public class ExpertBean implements Serializable{
	private int expId;
	private String expName;
	private String expGender;
	private String expBirth;
	private String expPic;
	private String expSpecial;
	private String expOffice;
	private String expTel;
	private String expCompany;
	private String expAddress;
	private String expEmail;
	private int expExsit;
	public ExpertBean() {
		super();
	}
	public ExpertBean(int expId, String expName, String expGender, String expBirth, String expPic, String expSpecial,
			String expOffice, String expTel, String expCompany, String expAddress, String expEmail, int expExsit) {
		super();
		this.expId = expId;
		this.expName = expName;
		this.expGender = expGender;
		this.expBirth = expBirth;
		this.expPic = expPic;
		this.expSpecial = expSpecial;
		this.expOffice = expOffice;
		this.expTel = expTel;
		this.expCompany = expCompany;
		this.expAddress = expAddress;
		this.expEmail = expEmail;
		this.expExsit = expExsit;
	}
	public int getExpId() {
		return expId;
	}
	public void setExpId(int expId) {
		this.expId = expId;
	}
	public String getExpName() {
		return expName;
	}
	public void setExpName(String expName) {
		this.expName = expName;
	}
	public String getExpGender() {
		return expGender;
	}
	public void setExpGender(String expGender) {
		this.expGender = expGender;
	}
	public String getExpBirth() {
		return expBirth;
	}
	public void setExpBirth(String expBirth) {
		this.expBirth = expBirth;
	}
	public String getExpPic() {
		return expPic;
	}
	public void setExpPic(String expPic) {
		this.expPic = expPic;
	}
	public String getExpSpecial() {
		return expSpecial;
	}
	public void setExpSpecial(String expSpecial) {
		this.expSpecial = expSpecial;
	}
	public String getExpOffice() {
		return expOffice;
	}
	public void setExpOffice(String expOffice) {
		this.expOffice = expOffice;
	}
	public String getExpTel() {
		return expTel;
	}
	public void setExpTel(String expTel) {
		this.expTel = expTel;
	}
	public String getExpCompany() {
		return expCompany;
	}
	public void setExpCompany(String expCompany) {
		this.expCompany = expCompany;
	}
	public String getExpAddress() {
		return expAddress;
	}
	public void setExpAddress(String expAddress) {
		this.expAddress = expAddress;
	}
	public String getExpEmail() {
		return expEmail;
	}
	public void setExpEmail(String expEmail) {
		this.expEmail = expEmail;
	}
	public int getExpExsit() {
		return expExsit;
	}
	public void setExpExsit(int expExsit) {
		this.expExsit = expExsit;
	}
	@Override
	public String toString() {
		return "ExpertBean [expId=" + expId + ", expName=" + expName + ", expGender=" + expGender + ", expBirth="
				+ expBirth + ", expPic=" + expPic + ", expSpecial=" + expSpecial + ", expOffice=" + expOffice
				+ ", expTel=" + expTel + ", expCompany=" + expCompany + ", expAddress=" + expAddress + ", expEmail="
				+ expEmail + ", expExsit=" + expExsit + "]";
	}
}
