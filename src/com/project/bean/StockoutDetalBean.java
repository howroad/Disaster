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
public class StockoutDetalBean implements Serializable{
	private int sdtlId;
	private int sdtlNum;
	private MedicineBean sdtlMed;
	private StockoutLogBean sdtlSlog;
	public StockoutDetalBean() {
		super();
	}
	public StockoutDetalBean(int sdtlId, int sdtlNum, MedicineBean sdtlMed, StockoutLogBean sdtlSlog) {
		super();
		this.sdtlId = sdtlId;
		this.sdtlNum = sdtlNum;
		this.sdtlMed = sdtlMed;
		this.sdtlSlog = sdtlSlog;
	}
	public int getSdtlId() {
		return sdtlId;
	}
	public void setSdtlId(int sdtlId) {
		this.sdtlId = sdtlId;
	}
	public int getSdtlNum() {
		return sdtlNum;
	}
	public void setSdtlNum(int sdtlNum) {
		this.sdtlNum = sdtlNum;
	}
	public MedicineBean getSdtlMed() {
		return sdtlMed;
	}
	public void setSdtlMed(MedicineBean sdtlMed) {
		this.sdtlMed = sdtlMed;
	}
	public StockoutLogBean getSdtlSlog() {
		return sdtlSlog;
	}
	public void setSdtlSlog(StockoutLogBean sdtlSlog) {
		this.sdtlSlog = sdtlSlog;
	}
	@Override
	public String toString() {
		return "StockoutDetalBean [sdtlId=" + sdtlId + ", sdtlNum=" + sdtlNum + ", sdtlMed=" + sdtlMed + ", sdtlSlog="
				+ sdtlSlog + "]";
	}
}
