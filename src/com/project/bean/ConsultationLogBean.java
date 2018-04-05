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
public class ConsultationLogBean implements Serializable{
	private int clogId;
	private String clogDate;
	private String clogResult;
	private DisasterLogBean dlog;
	private List<ConsultationDetalBean> cdtlList;
	private String expNames;
	public ConsultationLogBean() {
		super();
	}
	public ConsultationLogBean(int clogId, String clogDate, String clogResult, DisasterLogBean dlog,
			List<ConsultationDetalBean> cdtlList) {
		super();
		this.clogId = clogId;
		this.clogDate = clogDate;
		this.clogResult = clogResult;
		this.dlog = dlog;
		this.cdtlList = cdtlList;
	}
	public int getClogId() {
		return clogId;
	}
	public void setClogId(int clogId) {
		this.clogId = clogId;
	}
	public String getClogDate() {
		return clogDate;
	}
	public void setClogDate(String clogDate) {
		this.clogDate = clogDate;
	}
	public String getClogResult() {
		return clogResult;
	}
	public void setClogResult(String clogResult) {
		this.clogResult = clogResult;
	}
	public DisasterLogBean getDlog() {
		return dlog;
	}
	public void setDlog(DisasterLogBean dlog) {
		this.dlog = dlog;
	}
	public List<ConsultationDetalBean> getCdtlList() {
		return cdtlList;
	}
	public void setCdtlList(List<ConsultationDetalBean> cdtlList) {
		this.cdtlList = cdtlList;
	}
	public String getExpNames() {
		return expNames;
	}
	public void setExpNames(String expNames) {
		this.expNames = expNames;
	}
	@Override
	public String toString() {
		return "ConsultationLogBean [clogId=" + clogId + ", clogDate=" + clogDate + ", clogResult=" + clogResult
				+ ", dlog=" + dlog + ", cdtlList=" + cdtlList + ", expNames=" + expNames + "]";
	}
}	
