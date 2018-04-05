/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.AreaBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IAreaDao {
	/**
	 * 根据Map条件查询所有区域
	 * @param map 查询条件
	 * @return List集合
	 */
	public List<AreaBean> findList(Map<String,Object> map);
	/**
	 * 根据Map条件查询所有记录的条数
	 * @param map 查询条件
	 * @return 记录总数
	 */
	public int countList(Map<String,Object> map);
	/**
	 * 增加地区
	 * @param area 封装的地区Bean
	 * @return 成功返回1,并将主键设置到area,失败返回0
	 */
	public int add(AreaBean area);
	/**
	 * 查询没有小班的所有的区域
	 * @return List集合
	 */
	public List<AreaBean> findAreaNoClass();
	/**
	 * 查询所有的区域
	 * @return List集合
	 */
	public List<AreaBean> findAllArea();
	/**
	 * 根据area的Id查找
	 * @param areaId ID
	 * @return 封装的区域Bean
	 */
	public AreaBean findAreaById(int areaId);
}
