package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.MouseBean;
import com.project.dao.IMouseDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class MouseDaoImpl implements IMouseDao{
	@Override
	public int addMouse(MouseBean mouse) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		IMouseDao ind = session.getMapper(IMouseDao.class);
		return ind.addMouse(mouse);
	}
	@Override
	public MouseBean findMouseById(int mouId) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IMouseDao ind = session.getMapper(IMouseDao.class);
		return ind.findMouseById(mouId);
	}
	@Override
	public List<MouseBean> findPageBean(Map<String, Object> mouse) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IMouseDao ind = session.getMapper(IMouseDao.class);
		return ind.findPageBean(mouse);
	}
	@Override
	public int findCount(Map<String, Object> mouse) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IMouseDao ind = session.getMapper(IMouseDao.class);
		return ind.findCount(mouse);
	}
}
