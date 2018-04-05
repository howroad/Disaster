/**
 * 
 */
package com.project.service.impl;

import java.util.HashMap;
import java.util.Map;

import com.project.bean.DisasterLogBean;
import com.project.bean.PageBean;
import com.project.dao.IDisasterLogDao;
import com.project.dao.impl.DisasterLogDaoImpl;
import com.project.service.IDisasterLogService;

/**
 * @author howroad
 * @Date 2018年4月1日
 * @version 1.0
 */
public class DisasterLogServiceImpl implements IDisasterLogService {
	private IDisasterLogDao dlogDao = new DisasterLogDaoImpl();
	@Override
	public PageBean<DisasterLogBean> findPageBean(int pageNo, int pageSize, String dlogName, int dlogStage,
			String areaName, String startDate, String endDate) {
		Map<String,Object> map = new HashMap<String,Object>(16);
		map.put("start", (pageNo-1)*pageSize);
		map.put("size", pageSize);
		map.put("dlogName", dlogName);
		map.put("dlogStage", dlogStage);
		map.put("areaName", areaName);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return new PageBean<DisasterLogBean>(dlogDao.findList(map),pageNo,pageSize,dlogDao.countList(map));
	}
	@Override
	public boolean addDlog(DisasterLogBean dlog) {
		return dlogDao.add(dlog)>0;
	}
	@Override
	public DisasterLogBean findDlogById(int dlogId) {
		return dlogDao.findDlogById(dlogId);
	}
	@Override
	public boolean updateDlogStage(int dlogId) {
		return dlogDao.updateDlogStage(dlogId)>0;
	}
	@Override
	public boolean updateDlog(DisasterLogBean dlog) {
		return dlogDao.update(dlog)>0;
	}
	@Override
	public PageBean<DisasterLogBean> findPageBeanNeedExp(int pageNo, int pageSize) {
		Map<String,Object> map = new HashMap<String,Object>(16);
		map.put("start", (pageNo-1)*pageSize);
		map.put("size", pageSize);
		map.put("dlogStage", 3);
		return new PageBean<DisasterLogBean>(dlogDao.findList(map),pageNo,pageSize,dlogDao.countList(map));
	}
}
