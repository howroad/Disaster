package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.PageBean;
import com.project.bean.StockoutDetalBean;
import com.project.bean.StockoutLogBean;
import com.project.dao.IStockoutDao;
import com.project.dao.IStockoutDetalDao;
import com.project.dao.impl.StockoutDaoImpl;
import com.project.dao.impl.StockoutDetalDaoImpl;
import com.project.service.IStockoutService;

public class StockoutServiceImpl implements IStockoutService {

	private IStockoutDao stkd = new StockoutDaoImpl();
	private IStockoutDetalDao sdd = new StockoutDetalDaoImpl();
	@Override
	public PageBean<StockoutLogBean> findPageBean(int pageNo, int pageSize,String startDate,String overDate, String clsName) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pageNo", (pageNo-1)*pageSize);
		map.put("pageSize", pageSize);
		map.put("startDate", startDate);
		map.put("overDate", overDate);
		map.put("clsName", clsName);
		List<StockoutLogBean> list = stkd.findPageBean(map);
		return new PageBean<StockoutLogBean>(list, pageNo, pageSize, stkd.totalPage(map));
	}

	@Override
	public boolean addStockoutLog(StockoutLogBean stockoutlog) {
		stkd.add(stockoutlog);
		List<StockoutDetalBean> sdtlList = stockoutlog.getSdtlList();
		for (StockoutDetalBean stockoutDetalBean : sdtlList) {
			stockoutDetalBean.setSdtlSlog(stockoutlog);
		}
		return sdd.add(sdtlList) > 0;
	}

	@Override
	public StockoutLogBean findStockoutById(int slogId) {
		return stkd.findStockoutById(slogId);
	}

}
