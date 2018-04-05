/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.InsectBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IInsectDao {
	/**
	 * 添加虫害
	 * @param insect 虫害
	 * @return 影响行数
	 */
	public int addInsect(InsectBean insect);
	/**
	 * 根据id查看虫害信息
	 * @param insId 虫害id
	 * @return InsectBean对象
	 */
	public InsectBean findInsectById(int insId);
	/**
	 * 模糊分页查询虫害
	 * @param sc 查询条件
	 * @return InsectBean集合
	 */
	public List<InsectBean> findPageBean(Map<String, Object> sc);
	/**
	 * 模糊查询虫害总数
	 * @param sc 查询条件
	 * @return 总数
	 */
	public int findCount(Map<String, Object> sc);
}
