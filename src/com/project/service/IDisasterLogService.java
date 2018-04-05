/**
 * 
 */
package com.project.service;

import com.project.bean.DisasterLogBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.1	添加了备注
 */
public interface IDisasterLogService {
	/**
	 * 根据条件搜索灾情事件
	 * @param pageNo 当前页
	 * @param pageSize 每页的记录条数
	 * @param dlogName 事件名称
	 * @param dlogStage 灾情状态
	 * @param areaName 区域名称
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return
	 */
	public PageBean<DisasterLogBean> findPageBean(int pageNo,int pageSize,String dlogName,int dlogStage,String areaName,String startDate,String endDate);
	/**
	 * 根据灾情事件记录添加事件
	 * @param dlog dlgBean
	 * @return 成功返回true
	 */
	public boolean addDlog(DisasterLogBean dlog);
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
	public boolean updateDlogStage(int dlogId);
	/**
	 * 修改灾情状态和防治方案
	 * @param dlog 封装的DLGBean
	 * @return 成功返回true
	 */
	public boolean updateDlog(DisasterLogBean dlog);
	/**
	 * 查询需要专家会商的灾情事件
	 * @param pageNo 当前页码
	 * @param pageSize 每页记录数目
	 * @return
	 */
	public PageBean<DisasterLogBean> findPageBeanNeedExp(int pageNo,int pageSize);
}
