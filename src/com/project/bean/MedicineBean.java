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
public class MedicineBean implements Serializable{
	private int medId;
	private String medName;
	private int medDisaster;
	private int medType;
	private String medUse;
	private int medStock;
	public MedicineBean() {
		super();
	}
	public MedicineBean(int medId, String medName, int medDisaster, int medType, String medUse, int medStock) {
		super();
		this.medId = medId;
		this.medName = medName;
		this.medDisaster = medDisaster;
		this.medType = medType;
		this.medUse = medUse;
		this.medStock = medStock;
	}
	public int getMedId() {
		return medId;
	}
	public void setMedId(int medId) {
		this.medId = medId;
	}
	public String getMedName() {
		return medName;
	}
	public void setMedName(String medName) {
		this.medName = medName;
	}
	public int getMedDisaster() {
		return medDisaster;
	}
	public void setMedDisaster(int medDisaster) {
		this.medDisaster = medDisaster;
	}
	public int getMedType() {
		return medType;
	}
	public void setMedType(int medType) {
		this.medType = medType;
	}
	public String getMedUse() {
		return medUse;
	}
	public void setMedUse(String medUse) {
		this.medUse = medUse;
	}
	public int getMedStock() {
		return medStock;
	}
	public void setMedStock(int medStock) {
		this.medStock = medStock;
	}
	@Override
	public String toString() {
		return "MedicineBean [medId=" + medId + ", medName=" + medName + ", medDisaster=" + medDisaster + ", medType="
				+ medType + ", medUse=" + medUse + ", medStock=" + medStock + "]";
	}
}
