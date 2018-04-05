package com.project.dao.impl;

import java.util.List;

import com.project.bean.ConsultationLogBean;
import com.project.dao.IConsultationLogDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class ConsultationLogDaoImpl implements IConsultationLogDao {
	private Class<IConsultationLogDao> clazz = IConsultationLogDao.class;
	@Override
	public List<ConsultationLogBean> findAllByPage(int start, int pageSize, int dlogId) {
		return MyBatisUtil.getSqlSession().getMapper(clazz).findAllByPage(start, pageSize, dlogId);
	}
	@Override
	public int add(ConsultationLogBean clog) {
		return MyBatisUtil.getSqlSession(true).getMapper(clazz).add(clog);
	}
	@Override
	public int findCount(int dlogId) {
		return MyBatisUtil.getSqlSession().getMapper(clazz).findCount(dlogId);
	}
}
