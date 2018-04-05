/**
 * 
 */
package com.project.service;

import java.util.List;

import com.project.bean.AreaBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.1 添加了备注
 */
public interface IAreaService {
	/**
	 * 根据条件返回需要的pageBean
	 * @param pageNo 当前页码
	 * @param pageSize 每页显示条数
	 * @param areaName 查询条件:区域名称
	 * @param areaForest 查询条件:林种
	 * @param clsName 查询条件:小班名称
	 * @return 复合条件的pageBean
	 */
	public PageBean<AreaBean> findPageBean(int pageNo,int pageSize,String areaName,String areaForest,String clsName);
	/**
	 * 添加区域
	 * @param area 封装好的AreaBean
	 * @return 成功返回true,否则返回false
	 */
	public boolean addArea(AreaBean area);
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
}
