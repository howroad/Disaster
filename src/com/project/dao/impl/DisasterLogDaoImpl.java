/**
 * 
 */
package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.DisasterLogBean;
import com.project.dao.IDisasterLogDao;
import com.project.util.MyBatisUtil;

/**
 * @author howroad
 * @Date 2018年4月1日
 * @version 1.0
 */
public class DisasterLogDaoImpl implements IDisasterLogDao {
	private IDisasterLogDao dlogDao = null;
	public DisasterLogDaoImpl() {
		dlogDao=MyBatisUtil.getSqlSession(true).getMapper(IDisasterLogDao.class);
	}
	public DisasterLogDaoImpl(SqlSession session) {
		dlogDao=session.getMapper(IDisasterLogDao.class);
	}
	@Override
	public List<DisasterLogBean> findList(Map<String, Object> map) {
		return dlogDao.findList(map);
	}
	@Override
	public int countList(Map<String, Object> map) {
		return dlogDao.countList(map);
	}
	@Override
	public int add(DisasterLogBean dlog) {
		return dlogDao.add(dlog);
	}
	@Override
	public DisasterLogBean findDlogById(int dlogId) {
		return dlogDao.findDlogById(dlogId);
	}
	@Override
	public int updateDlogStage(int dlogId) {
		return dlogDao.updateDlogStage(dlogId);
	}
	@Override
	public int update(DisasterLogBean dlog) {
		return dlogDao.update(dlog);
	}
}
