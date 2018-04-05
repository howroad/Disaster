/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.MedicineBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IMedicineDao {
	/**
	 * 模糊分页查询物品数据
	 * @param map 查询条件
	 * @return MedicineBean集合
	 */
	public List<MedicineBean> findPageBean(Map<String,Object> map);
	/**
	 * 添加药品信息
	 * @param medicine 药品
	 * @return 受影响行数
	 */
	public int add(MedicineBean medicine); 
	/**
	 * 模糊查询总数
	 * @param map 查询条件
	 * @return 总数
	 */
	public int totalPage(Map<String,Object> map);
	/**
	 * 根据id查询药品
	 * @param medId 物品id
	 * @return MedicineBean对象
	 */
	public MedicineBean findMedById(int medId);
}
