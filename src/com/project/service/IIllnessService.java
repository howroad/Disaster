/**
 * 
 */
package com.project.service;

import com.project.bean.IllnessBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IIllnessService {
	/**
	 *  添加病害表
	 * @param illness  传入需要添加的IllnessBean
	 * @return 是否成功
	 */
	public boolean addIllness(IllnessBean illness);
	/**
	 *  查询病害表
	 * @param illId 传入病害表的id
	 * @return    返回IllnessBean
	 */
	public IllnessBean findIllnessById(int illId);
	/**
	 * 显示、分页以及模糊查询后的FindIllness
	 * @param pageNo  传入页面page
	 * @param pageSize  传入显示条数size
	 * @param illName  传入病害名称illName
	 * @param illStatus  传入发病状况illStatus
	 * @return   返回pageBean
	 */
	public PageBean<IllnessBean> findPageBean(int pageNo,int pageSize,String illName,String illStatus);
}
