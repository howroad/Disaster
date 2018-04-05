/**
 * 
 */
package com.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.bean.ConsultationLogBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IConsultationLogDao {
	/**
	 * 分页显示会商记录
	 * @param start 当前页
	 * @param pageSize 每页显示数
	 * @param dlogId 灾情id
	 * @return ConsultationLogBean集合
	 */
	public List<ConsultationLogBean> findAllByPage(@Param("start")int start, @Param("size")int pageSize,@Param("dlogId")int dlogId);
	/**
	 * 添加会商记录
	 * @param clog ConsultationLogBean对象
	 * @return 新生成的主键
	 */
	public int add(ConsultationLogBean clog);
	/**
	 * 根据灾情id获得会商记录数
	 * @param dlogId 灾情id
	 * @return 记录数
	 */
	public int findCount(int dlogId);
}
