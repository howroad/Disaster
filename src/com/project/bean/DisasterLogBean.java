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
public class DisasterLogBean implements Serializable{
	private int dlogId;
	private String dlogName;
	private String dlogPic;
	private String dlogDate;
	private int dlogType;
	private int dlogStage;
	private String dlogDesc;
	private int dlogFound;
	private String dlogLoss;
	private String dlogInfluence;
	private String dlogPlan;
	private AreaBean dlogArea;
	private List<ConsultationLogBean> clogList;
	public DisasterLogBean() {
		super();
	}
	public DisasterLogBean(int dlogId, String dlogName, String dlogPic, String dlogDate, int dlogType, int dlogStage,
			String dlogDesc, int dlogFound, String dlogLoss, String dlogInfluence, String dlogPlan, AreaBean dlogArea,
			List<ConsultationLogBean> clogList) {
		super();
		this.dlogId = dlogId;
		this.dlogName = dlogName;
		this.dlogPic = dlogPic;
		this.dlogDate = dlogDate;
		this.dlogType = dlogType;
		this.dlogStage = dlogStage;
		this.dlogDesc = dlogDesc;
		this.dlogFound = dlogFound;
		this.dlogLoss = dlogLoss;
		this.dlogInfluence = dlogInfluence;
		this.dlogPlan = dlogPlan;
		this.dlogArea = dlogArea;
		this.clogList = clogList;
	}
	public int getDlogId() {
		return dlogId;
	}
	public void setDlogId(int dlogId) {
		this.dlogId = dlogId;
	}
	public String getDlogName() {
		return dlogName;
	}
	public void setDlogName(String dlogName) {
		this.dlogName = dlogName;
	}
	public String getDlogPic() {
		return dlogPic;
	}
	public void setDlogPic(String dlogPic) {
		this.dlogPic = dlogPic;
	}
	public String getDlogDate() {
		return dlogDate;
	}
	public void setDlogDate(String dlogDate) {
		this.dlogDate = dlogDate;
	}
	public int getDlogType() {
		return dlogType;
	}
	public void setDlogType(int dlogType) {
		this.dlogType = dlogType;
	}
	public int getDlogStage() {
		return dlogStage;
	}
	public void setDlogStage(int dlogStage) {
		this.dlogStage = dlogStage;
	}
	public String getDlogDesc() {
		return dlogDesc;
	}
	public void setDlogDesc(String dlogDesc) {
		this.dlogDesc = dlogDesc;
	}
	public int getDlogFound() {
		return dlogFound;
	}
	public void setDlogFound(int dlogFound) {
		this.dlogFound = dlogFound;
	}
	public String getDlogLoss() {
		return dlogLoss;
	}
	public void setDlogLoss(String dlogLoss) {
		this.dlogLoss = dlogLoss;
	}
	public String getDlogInfluence() {
		return dlogInfluence;
	}
	public void setDlogInfluence(String dlogInfluence) {
		this.dlogInfluence = dlogInfluence;
	}
	public String getDlogPlan() {
		return dlogPlan;
	}
	public void setDlogPlan(String dlogPlan) {
		this.dlogPlan = dlogPlan;
	}
	public AreaBean getDlogArea() {
		return dlogArea;
	}
	public void setDlogArea(AreaBean dlogArea) {
		this.dlogArea = dlogArea;
	}
	public List<ConsultationLogBean> getClogList() {
		return clogList;
	}
	public void setClogList(List<ConsultationLogBean> clogList) {
		this.clogList = clogList;
	}
	@Override
	public String toString() {
		return "DisasterLogBean [dlogId=" + dlogId + ", dlogName=" + dlogName + ", dlogPic=" + dlogPic + ", dlogDate="
				+ dlogDate + ", dlogType=" + dlogType + ", dlogStage=" + dlogStage + ", dlogDesc=" + dlogDesc
				+ ", dlogFound=" + dlogFound + ", dlogLoss=" + dlogLoss + ", dlogInfluence=" + dlogInfluence
				+ ", dlogPlan=" + dlogPlan + ", dlogArea=" + dlogArea + ", clogList=" + clogList + "]";
	}
}
