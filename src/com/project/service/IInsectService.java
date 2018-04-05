/**
 * 
 */
package com.project.service;

import com.project.bean.InsectBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IInsectService {
	/**
	 * 添加虫害表
	 * @param insect  传入需要添加的InsectBean
	 * @return 是否成功
	 */
	public boolean addInsect(InsectBean insect);
	/**
	 * 查询虫害表
	 * @param insId  传入需要查询的虫害表id
	 * @return  返回InsectBean
	 */
	public InsectBean findInsectById(int insId);
	/**
	 * 显示、分页以及模糊查询后的FindInsect
	 * @param pageNo  传入页面page
	 * @param pageSize   传入显示条数size
	 * @param insName 传入害虫名insName
	 * @param insMaster 传入寄主insMaster
	 * @return 返回  PageBean
	 */
	public PageBean<InsectBean> findPageBean(int pageNo,int pageSize,String insName,String insMaster);
}
