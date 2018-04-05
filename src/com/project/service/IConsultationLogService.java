/**
 * 
 */
package com.project.service;

import com.project.bean.ConsultationLogBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IConsultationLogService {
	/**
	 * 分页显示会商记录
	 * @param pageNo 当前页
	 * @param pageSize 每页显示数
	 * @param dlogId 灾情id
	 * @return PageBean对象
	 */
	public PageBean<ConsultationLogBean> findPageBean(int pageNo, int pageSize, int dlogId);
	/**
	 * 添加会商记录并添加会商详情
	 * @param clog 会商记录
	 * @return true为成功否则失败
	 */
	public boolean addClog(ConsultationLogBean clog);
}
