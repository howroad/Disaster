/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.MouseBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IMouseDao {
	/**
	 * 添加鼠害
	 * @param mouse 鼠害
	 * @return 受影响行数
	 */
	public int addMouse(MouseBean mouse);
	/**
	 * 鼠害id查询鼠害
	 * @param mouId 鼠害id
	 * @return MouseBean对象
	 */
	public MouseBean findMouseById(int mouId);
	/**
	 * 分页模糊查询鼠害
	 * @param mouse 查询条件
	 * @return MouseBean集合
	 */
	public List<MouseBean> findPageBean(Map<String, Object> mouse);
	/**
	 * 分页模糊查询总数
	 * @param mouse 查询条件
	 * @return 总数
	 */
	public int findCount(Map<String, Object> mouse);
}
