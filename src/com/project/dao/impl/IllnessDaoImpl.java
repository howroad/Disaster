package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.IllnessBean;
import com.project.dao.IIllnessDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class IllnessDaoImpl implements IIllnessDao{
	@Override
	public int addIllness(IllnessBean illness) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		IIllnessDao ind = session.getMapper(IIllnessDao.class);
		return ind.addIllness(illness);
	}
	@Override
	public IllnessBean findIllnessById(int illId) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IIllnessDao ind = session.getMapper(IIllnessDao.class);
		return ind.findIllnessById(illId);
	}
	@Override
	public List<IllnessBean> findPageBean(Map<String, Object> sa) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IIllnessDao ind = session.getMapper(IIllnessDao.class);
		return ind.findPageBean(sa);
	}
	@Override
	public int findCount(Map<String, Object> sa) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IIllnessDao ind = session.getMapper(IIllnessDao.class);
		return ind.findCount(sa);
	}
}
