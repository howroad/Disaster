package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.StockoutLogBean;
import com.project.dao.IStockoutDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class StockoutDaoImpl implements IStockoutDao {
	@Override
	public List<StockoutLogBean> findPageBean(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSqlSession();
		IStockoutDao stockout = session.getMapper(IStockoutDao.class);
		return stockout.findPageBean(map);
	}
	@Override
	public int add(StockoutLogBean slog) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession(true);
		IStockoutDao sd = sqlsession.getMapper(IStockoutDao.class);
		return sd.add(slog);
	}
	@Override
	public StockoutLogBean findStockoutById(int id) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		IStockoutDao sd = sqlsession.getMapper(IStockoutDao.class);
		return sd.findStockoutById(id);
	}
	@Override
	public int totalPage(Map<String, Object> map) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		IStockoutDao sd = sqlsession.getMapper(IStockoutDao.class);
		return sd.totalPage(map);
	}
}
