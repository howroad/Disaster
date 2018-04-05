package com.project.dao.impl;

import java.util.List;

import com.project.bean.ExpertBean;
import com.project.dao.IExpertDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class ExpertDaoImpl implements IExpertDao {
	private Class<IExpertDao> clazz = IExpertDao.class;
	@Override
	public List<ExpertBean> findAllByPage(int start, int pageSize, String expName, String expSpecial, String expCompany) {
		return MyBatisUtil.getSqlSession().getMapper(clazz).findAllByPage(start, pageSize, expName, expSpecial, expCompany);
	}
	@Override
	public ExpertBean findById(int expId) {
		return MyBatisUtil.getSqlSession().getMapper(clazz).findById(expId);
	}
	@Override
	public List<ExpertBean> findAll(String expSpecial) {
		return MyBatisUtil.getSqlSession().getMapper(clazz).findAll(expSpecial);
	}
	@Override
	public int add(ExpertBean expert) {
		return MyBatisUtil.getSqlSession(true).getMapper(clazz).add(expert);
	}
	@Override
	public int update(ExpertBean expert) {
		return MyBatisUtil.getSqlSession(true).getMapper(clazz).update(expert);
	}
	@Override
	public int updateExsit(int expId) {
		return MyBatisUtil.getSqlSession(true).getMapper(clazz).updateExsit(expId);
	}
	@Override
	public int findCount(String expName, String expSpecial, String expCompany) {
		return MyBatisUtil.getSqlSession().getMapper(clazz).findCount(expName, expSpecial, expCompany);
	}
}
