/**
 * 
 */
package com.project.dao;

import java.util.List;

import com.project.bean.ConsultationDetalBean;

/**
 * @author howroad
 * @Date 2018年3月30日
 * @version 1.0
 */
public interface IConsultationDetalDao {
	/**
	 * 批量添加会商详情
	 * @param list 详情集合
	 * @return 大于0成功，否则失败
	 */
	public int add(List<ConsultationDetalBean> list);
}
