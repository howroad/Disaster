/**
 * 
 */
package com.project.service;

import com.project.bean.MouseBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IMouseService {
	/**
	 * 添加鼠害表
	 * @param mouse 传入需要添加的MouseBean
	 * @return 是否成功
	 */
	public boolean addMouse(MouseBean mouse);
	/**
	 * 查询鼠害表
	 * @param mouId 传入需要查询的鼠害表id
	 * @return   返回MouseBean
	 */
	public MouseBean findMouseById(int mouId);
	/**
	 * 显示、分页以及模糊查询后的FindMouse
	 * @param pageNo 传入页面page
	 * @param pageSize  传入条数size
	 * @param mouName 传入鼠害名称
	 * @return 返回PageBean
	 */
	public PageBean<MouseBean> findPageBean(int pageNo,int pageSize,String mouName);
}
