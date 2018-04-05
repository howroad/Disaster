/**
 * 
 */
package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.AreaBean;
import com.project.dao.IAreaDao;
import com.project.util.MyBatisUtil;

/**
 * @author howroad
 * @Date 2018年4月1日
 * @version 1.0
 */
public class AreaDaoImpl implements IAreaDao {
	private IAreaDao areaDao = null;
	public AreaDaoImpl() {
		areaDao=MyBatisUtil.getSqlSession(true).getMapper(IAreaDao.class);
	}
	public AreaDaoImpl(SqlSession session) {
		areaDao=session.getMapper(IAreaDao.class);
	}
	@Override
	public List<AreaBean> findList(Map<String, Object> map) {
		return areaDao.findList(map);
	}
	@Override
	public int countList(Map<String, Object> map) {
		return areaDao.countList(map);
	}
	@Override
	public int add(AreaBean area) {
		return areaDao.add(area);
	}
	@Override
	public List<AreaBean> findAreaNoClass() {
		return areaDao.findAreaNoClass();
	}
	@Override
	public List<AreaBean> findAllArea() {
		return areaDao.findAllArea();
	}
	@Override
	public AreaBean findAreaById(int areaId) {
		return areaDao.findAreaById(areaId);
	}
}
