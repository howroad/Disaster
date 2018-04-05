package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.IllnessBean;
import com.project.bean.PageBean;
import com.project.dao.IIllnessDao;
import com.project.dao.impl.IllnessDaoImpl;
import com.project.service.IIllnessService;
/**
 * 
 * @author 赵子墨
 *
 */
public class IllnessServiceImpl implements IIllnessService{
	private IIllnessDao ind = new IllnessDaoImpl();
	@Override
	public boolean addIllness(IllnessBean illness) {
		return ind.addIllness(illness) > 0;
	}
	@Override
	public IllnessBean findIllnessById(int illId) {
		return ind.findIllnessById(illId);
	}
	@Override
	public PageBean<IllnessBean> findPageBean(int pageNo, int pageSize, String illName, String illStatus) {
		Map<String, Object> sa = new HashMap<String, Object>(16);
		sa.put("pageNo",(pageNo-1)*pageSize);
		sa.put("pageSize", pageSize);
		sa.put("illName", illName);
		sa.put("illStatus", illStatus);
		List<IllnessBean> list = ind.findPageBean(sa);
		return new PageBean<>(list, pageNo, pageSize, ind.findCount(sa));
	}
}
