/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.DisasterLogBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IDisasterLogDao {
	/**
	 * 根据查询条件来查找复合条件的记录
	 * @param map 查询条件
	 * @return 集合
	 */
	public List<DisasterLogBean> findList(Map<String,Object> map);
	/**
	 * 根据查询条件来查询复合条件的所有的记录的条数
	 * @param map 查询条件
	 * @return 记录总数
	 */
	public int countList(Map<String,Object> map);
	/**
	 * 根据灾情事件记录添加事件
	 * @param dlog dlgBean
	 * @return 成功返回true
	 */
	public int add(DisasterLogBean dlog);
	/**
	 * 根据ID查询灾情事件表
	 * @param dlogId ID
	 * @return 封装的DLOGBean
	 */
	public DisasterLogBean findDlogById(int dlogId);
	/**
	 * 修改灾情状态为无法解决,申请专家会商(0)
	 * @param dlogId ID
	 * @return 成功返回true
	 */
	public int updateDlogStage(int dlogId);
	/**
	 * 修改灾情状态和防治方案
	 * @param dlog 封装的DLGBean
	 * @return 成功返回true
	 */
	public int update(DisasterLogBean dlog);
}
