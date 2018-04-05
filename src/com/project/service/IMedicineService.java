/**
 * 
 */
package com.project.service;

import com.project.bean.MedicineBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IMedicineService {
	/**
	 * 获得分页，以及模糊查询后的MedicineBean的集合
	 * @param pageNo 当前页数
	 * @param pageSize 一共显示几条数据
	 * @param medName 输入需要模糊查询的药剂名称
	 * @param medDisaster 输入需要模糊查询的防治类型
	 * @param medType 输入需要模糊查询的类别
	 * @return PageBean
	 */
	public PageBean<MedicineBean> findPageBean(int pageNo ,int pageSize,String medName,int medDisaster,int medType); 
	/**
	 * 添加药剂信息
	 * @param medicine 传入一个MedicineBean
	 * @return 是否成功
	 */
	public boolean addMedicine(MedicineBean medicine);
	/**
	 * 根据Id查找
	 * @param medId id
	 * @return 药品
	 */
	public MedicineBean findMedById(int medId);
}
