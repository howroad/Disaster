package com.project.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.StockoutDetalBean;
import com.project.bean.StockoutLogBean;
import com.project.dao.IStockoutDetalDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class StockoutDetalDaoImpl implements IStockoutDetalDao {
	@Override
	public List<StockoutDetalBean> fingpageBean(StockoutLogBean slog) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		IStockoutDetalDao stockout = sqlsession.getMapper(IStockoutDetalDao.class);
		return stockout.fingpageBean(slog);
	}
	@Override
	public int add(List<StockoutDetalBean> sdtlList) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession(true);
		IStockoutDetalDao stockout = sqlsession.getMapper(IStockoutDetalDao.class);
		return stockout.add(sdtlList);
	}
}
