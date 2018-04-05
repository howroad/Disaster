package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.InsectBean;
import com.project.bean.PageBean;
import com.project.dao.IInsectDao;
import com.project.dao.impl.InsectDaoImpl;
import com.project.service.IInsectService;
/**
 * 
 * @author 赵子墨
 *
 */
public class InsectServiceImpl implements IInsectService{
	private IInsectDao ind = new InsectDaoImpl();
	@Override
	public boolean addInsect(InsectBean insect) {
		return ind.addInsect(insect)>0;
	}
	@Override
	public InsectBean findInsectById(int insId) {
		return ind.findInsectById(insId);
	}
	@Override
	public PageBean<InsectBean> findPageBean(int pageNo, int pageSize, String insName, String insMaster) {
		Map<String, Object> sa = new HashMap<String, Object>(16);
		sa.put("pageNo",(pageNo-1)*pageSize);
		sa.put("pageSize", pageSize);
		sa.put("insName", insName);
		sa.put("insMaster", insMaster);
		List<InsectBean> list = ind.findPageBean(sa);
		return new PageBean<InsectBean>(list, pageNo, pageSize, ind.findCount(sa));
	}
}
