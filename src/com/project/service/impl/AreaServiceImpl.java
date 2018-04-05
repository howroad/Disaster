/**
 * 
 */
package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.AreaBean;
import com.project.bean.PageBean;
import com.project.dao.IAreaDao;
import com.project.dao.impl.AreaDaoImpl;
import com.project.service.IAreaService;

/**
 * @author howroad
 * @Date 2018年3月31日
 * @version 1.0
 */
public class AreaServiceImpl implements IAreaService{
	IAreaDao areaDao = new AreaDaoImpl();
	@Override
	public PageBean<AreaBean> findPageBean(int pageNo, int pageSize, String areaName, String areaForest,
			String clsName) {
		Map<String,Object> map = new HashMap<String,Object>(16);
		map.put("start",(pageNo-1)*pageSize);
		map.put("size", pageSize);
		map.put("areaName",areaName);
		map.put("areaForest",areaForest);
		map.put("clsName", clsName);
		return new PageBean<AreaBean>(areaDao.findList(map), pageNo, pageSize, areaDao.countList(map));
	}
	@Override
	public boolean addArea(AreaBean area) {
		return areaDao.add(area)>0;
	}
	@Override
	public List<AreaBean> findAreaNoClass() {
		return areaDao.findAreaNoClass();
	}
	@Override
	public List<AreaBean> findAllArea() {
		return areaDao.findAllArea();
	}
}
