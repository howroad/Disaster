package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.InsectBean;
import com.project.dao.IInsectDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class InsectDaoImpl implements IInsectDao{
	@Override
	public int addInsect(InsectBean insect) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		IInsectDao ind = session.getMapper(IInsectDao.class);
		return ind.addInsect(insect);
	}
	@Override
	public InsectBean findInsectById(int insId) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IInsectDao ind = session.getMapper(IInsectDao.class);
		return ind.findInsectById(insId);
		
	}
	@Override
	public List<InsectBean> findPageBean(Map<String, Object> sc) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IInsectDao ind = session.getMapper(IInsectDao.class);
		return ind.findPageBean(sc);
	}
	@Override
	public int findCount(Map<String, Object> sc) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IInsectDao ind = session.getMapper(IInsectDao.class);
		return ind.findCount(sc);
	}
}
