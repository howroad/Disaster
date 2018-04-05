/**
 * 
 */
package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.ClassBean;
import com.project.bean.PageBean;
import com.project.dao.IClassDao;
import com.project.dao.impl.ClassDaoImpl;
import com.project.service.IClassService;

/**
 * @author howroad
 * @Date 2018年4月1日
 * @version 1.0
 */
public class ClassServiceImpl implements IClassService{
	private IClassDao clsDao = new ClassDaoImpl();
	@Override
	public PageBean<ClassBean> findPageBean(int pageNo, int pageSize, String clsName, String areaName) {
		Map<String,Object> map =new HashMap<>(16);
		map.put("clsName", clsName);
		map.put("areaName",areaName);
		map.put("start", (pageNo-1)*pageSize);
		map.put("size", pageSize);
		return new PageBean<ClassBean>(clsDao.findList(map),pageNo,pageSize,clsDao.countList(map));
	}
	@Override
	public boolean addClass(ClassBean cls) {
		return clsDao.add(cls)>0;
	}
	@Override
	public ClassBean findClassById(int clsId) {
		return clsDao.findClassById(clsId);
	}
	@Override
	public boolean updateClass(ClassBean cls) {
		return clsDao.update(cls)>0;
	}
	@Override
	public List<ClassBean> findAllClass() {
		return clsDao.findAllClass();
	}
	@Override
	public ClassBean findClassByAreaId(int areaId) {
		return clsDao.findClassByAreaId(areaId);
	}
}
