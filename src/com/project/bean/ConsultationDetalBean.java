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
public class ConsultationDetalBean implements Serializable{
	private int cdtlId;
	private ExpertBean cdtlExp;
	private ConsultationLogBean cdtlClog;
	public ConsultationDetalBean() {
		super();
	}
	public ConsultationDetalBean(int cdtlId, ExpertBean cdtlExp, ConsultationLogBean cdtlClog) {
		super();
		this.cdtlId = cdtlId;
		this.cdtlExp = cdtlExp;
		this.cdtlClog = cdtlClog;
	}
	public int getCdtlId() {
		return cdtlId;
	}
	public void setCdtlId(int cdtlId) {
		this.cdtlId = cdtlId;
	}
	public ExpertBean getCdtlExp() {
		return cdtlExp;
	}
	public void setCdtlExp(ExpertBean cdtlExp) {
		this.cdtlExp = cdtlExp;
	}
	public ConsultationLogBean getCdtlClog() {
		return cdtlClog;
	}
	public void setCdtlClog(ConsultationLogBean cdtlClog) {
		this.cdtlClog = cdtlClog;
	}
	@Override
	public String toString() {
		return "ConsultationDetalBean [cdtlId=" + cdtlId + ", cdtlExp=" + cdtlExp + ", cdtlClog=" + cdtlClog + "]";
	}
}
