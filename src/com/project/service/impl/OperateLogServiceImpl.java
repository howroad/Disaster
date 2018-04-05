package com.project.service.impl;

import java.util.HashMap;
import java.util.Map;

import com.project.bean.OperateLogBean;
import com.project.bean.PageBean;
import com.project.bean.UserBean;
import com.project.dao.IOperateLogDao;
import com.project.dao.impl.OperateLogDaoImpl;
import com.project.service.IOperateLogService;
/**
 * 
 * @author 赵子墨
 *
 */
public class OperateLogServiceImpl implements IOperateLogService{
	private IOperateLogDao iold = new OperateLogDaoImpl();
	@Override
	public boolean addOperateLog(UserBean user,String ologAction) {
		OperateLogBean olog = new OperateLogBean(0, ologAction, "", user);
		return iold.addOlog(olog)>0;
	}
	@Override
	public PageBean<OperateLogBean> findPageBean(int pageNo, int pageSize, String startDate, String endDate) {
		Map<String,Object> map = new HashMap<String,Object>(16);
		map.put("start", (pageNo-1)*pageSize);
		map.put("size", pageSize);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return new PageBean<>(iold.findOlogList(map), pageNo, pageSize, iold.ologCount(map));
	}
}
