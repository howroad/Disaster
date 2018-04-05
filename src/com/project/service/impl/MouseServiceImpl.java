package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.MouseBean;
import com.project.bean.PageBean;
import com.project.dao.IMouseDao;
import com.project.dao.impl.MouseDaoImpl;
import com.project.service.IMouseService;
/**
 * 
 * @author 赵子墨
 *
 */
public class MouseServiceImpl implements IMouseService{
	private IMouseDao ind = new MouseDaoImpl();
	@Override
	public boolean addMouse(MouseBean mouse) {
		return ind.addMouse(mouse)>0;
	}
	@Override
	public MouseBean findMouseById(int mouId) {
		return ind.findMouseById(mouId);
	}
	@Override
	public PageBean<MouseBean> findPageBean(int pageNo, int pageSize, String mouName) {
		Map<String, Object> sa = new HashMap<String, Object>(16);
		sa.put("pageNo",(pageNo-1)*pageSize);
		sa.put("pageSize", pageSize);
		sa.put("mouName", mouName);
		List<MouseBean> list = ind.findPageBean(sa);
		return new PageBean<MouseBean>(list, pageNo, pageSize, ind.findCount(sa));
	}
}
