/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.IllnessBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IIllnessDao {
	/**
	 * 添加病害
	 * @param illness 病害
	 * @return 影响行数
	 */
	public int addIllness(IllnessBean illness);
	/**
	 * 根据id查看病害信息
	 * @param illId 病害id
	 * @return IllnessBean对象
	 */
	public IllnessBean findIllnessById(int illId);
	/**
	 * 模糊分页查询病害
	 * @param sa 查询条件
	 * @return IllnessBean集合
	 */
	public List<IllnessBean> findPageBean(Map<String, Object> sa);
	/**
	 * 模糊查询病害总数
	 * @param sa 查询条件
	 * @return 总数
	 */
	public int findCount(Map<String, Object> sa);
}
