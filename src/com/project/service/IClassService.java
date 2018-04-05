/**
 * 
 */
package com.project.service;

import java.util.List;

import com.project.bean.ClassBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.1 添加了备注
 */
public interface IClassService {
	/**
	 * 根据需要查询班级pageBean
	 * @param pageNo 当前页码
	 * @param pageSize 页数
	 * @param clsName 班级名字
	 * @param areaName 区域名字
	 * @return
	 */
	public PageBean<ClassBean> findPageBean(int pageNo,int pageSize,String clsName,String areaName);
	/**
	 * 添加班级
	 * @param cls 班级Bean
	 * @return 成功返回true
	 */
	public boolean addClass(ClassBean cls);
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
	public boolean updateClass(ClassBean cls);
	/**
	 * 获得所有班级
	 * @return
	 */
	public List<ClassBean> findAllClass();
	/**
	 * 根据区域Id查询班级
	 * @param areaId 区域Id
	 * @return 班级Bean
	 */
	public ClassBean findClassByAreaId(int areaId);
}
