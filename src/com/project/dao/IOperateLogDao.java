/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.OperateLogBean;

/**
 * @author howroad
 * @Date 2018年3月18日
 * @version 1.0
 */
public interface IOperateLogDao {
	/**
	 * 模糊分页查询日志
	 * @param map 查询条件
	 * @return OperateLogBean集合
	 */
	public List<OperateLogBean> findOlogList(Map<String,Object> map);
	/**
	 * 模糊查询总数
	 * @param map 查询条件
	 * @return 总数
	 */
	public int ologCount(Map<String,Object> map);
	/**
	 * 添加日志
	 * @param olog 日志对象
	 * @return 受影响行数
	 */
	public int addOlog(OperateLogBean olog);
}
