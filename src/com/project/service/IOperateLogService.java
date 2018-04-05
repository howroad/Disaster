/**
 * 
 */
package com.project.service;

import com.project.bean.OperateLogBean;
import com.project.bean.PageBean;
import com.project.bean.UserBean;

/**
 * @author howroad
 * @Date 2018年3月18日
 * @version 1.0
 */
public interface IOperateLogService {
	/**
	 * 日志信息，每有用户登录一次系统，记录一条数据
	 * @param user 用户
	 * @param ologAction 操作信息
	 * @see 监听器
	 * @return 是否成功
	 */
	public boolean addOperateLog(UserBean user,String ologAction);
	/**
	 * 根据输入的日志起止日期查询满足条件的日志记录
	 * @param pageNo 起始位置
	 * @param pageSize 显示条数
	 * @param startDate 查询日志的起始日期
	 * @param endDate 查询日志的结束日期
	 * @return 返回满足条件的日志记录pageBean
	 */
	public PageBean<OperateLogBean> findPageBean(int pageNo,int pageSize,String startDate,String endDate);
}
