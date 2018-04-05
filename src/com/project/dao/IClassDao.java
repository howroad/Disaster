/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.ClassBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IClassDao {
	/**
	 * 根据查询条件查询班级
	 * @param map 查询条件
	 * @return 查询集合
	 */
	public List<ClassBean> findList(Map<String,Object> map);
	/**
	 * 根据查询条件查询记录数目
	 * @param map 查询条件
	 * @return 记录数目
	 */
	public int countList(Map<String,Object> map);
	/**
	 * 添加班级
	 * @param cls 班级Bean
	 * @return 成功返回true
	 */
	public int add(ClassBean cls);
	/**
	 * 根据ID查找班级
	 * @param clsId 班级ID
	 * @return 班级Bean
	 */
	public ClassBean findClassById(int clsId);
	/**
	 * 修改班级
	 * @param cls 班级Bean
	 * @return 成功返回true
	 */
	public int update(ClassBean cls);
	/**
	 * 获得所有班级
	 * @return
	 */
	public List<ClassBean> findAllClass();
	/**
	 * 根据区域Id查找班级
	 * @param areaId 区域ID
	 * @return 班级Bean
	 */
	public ClassBean findClassByAreaId(int areaId);
}
