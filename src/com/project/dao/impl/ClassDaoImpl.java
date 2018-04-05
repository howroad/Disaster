/**
 * 
 */
package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.ClassBean;
import com.project.dao.IClassDao;
import com.project.util.MyBatisUtil;

/**
 * @author howroad
 * @Date 2018年4月1日
 * @version 1.0
 */
public class ClassDaoImpl implements IClassDao {
	private IClassDao clsDao = null;
	public ClassDaoImpl() {
		clsDao=MyBatisUtil.getSqlSession(true).getMapper(IClassDao.class);
	}
	public ClassDaoImpl(SqlSession session) {
		clsDao = session.getMapper(IClassDao.class);
	}
	@Override
	public List<ClassBean> findList(Map<String, Object> map) {
		return clsDao.findList(map);
	}
	@Override
	public int countList(Map<String, Object> map) {
		return clsDao.countList(map);
	}
	@Override
	public int add(ClassBean cls) {
		return clsDao.add(cls);
	}
	@Override
	public ClassBean findClassById(int clsId) {
		return clsDao.findClassById(clsId);
	}
	@Override
	public int update(ClassBean cls) {
		return clsDao.update(cls);
	}
	@Override
	public List<ClassBean> findAllClass() {
		return clsDao.findAllClass();
	}
	@Override
	public ClassBean findClassByAreaId(int areaId) {
		return clsDao.findClassByAreaId(areaId);
	}
}
