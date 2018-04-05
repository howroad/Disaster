package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import com.project.bean.OperateLogBean;
import com.project.dao.IOperateLogDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class OperateLogDaoImpl implements IOperateLogDao{
	private IOperateLogDao iold = MyBatisUtil.getSqlSession(true).getMapper(IOperateLogDao.class);
	@Override
	public List<OperateLogBean> findOlogList(Map<String, Object> map) {
		return iold.findOlogList(map);
	}
	@Override
	public int ologCount(Map<String, Object> map) {
		return iold.ologCount(map);
	}
	@Override
	public int addOlog(OperateLogBean olog) {
		return iold.addOlog(olog);
	}
}
