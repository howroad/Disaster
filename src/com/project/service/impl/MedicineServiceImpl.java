package com.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.bean.MedicineBean;
import com.project.bean.PageBean;
import com.project.dao.IMedicineDao;
import com.project.dao.impl.MedicineDaoImpl;
import com.project.service.IMedicineService;
/**
 * 
 * @author 赵子墨
 *
 */
public class MedicineServiceImpl implements IMedicineService {
	private IMedicineDao imdd = new MedicineDaoImpl();
	@Override
	public PageBean<MedicineBean> findPageBean(int pageNo, int pageSize, String medName, int medDisaster, int medType) {
		Map<String,Object> map = new HashMap<String,Object>(16);
		map.put("pageNo", (pageNo-1)*pageSize);
		map.put("pageSize", pageSize);
		map.put("medName", medName);
		map.put("medDisaster", medDisaster);
		map.put("medType", medType);
		List<MedicineBean> list = imdd.findPageBean(map);
		int totalPage = imdd.totalPage(map);
		PageBean<MedicineBean> page = new PageBean<MedicineBean>(list,pageNo,pageSize,totalPage);	
		return page;
	}
	@Override
	public boolean addMedicine(MedicineBean medicine) {
		return imdd.add(medicine) > 0;
	}
	@Override
	public MedicineBean findMedById(int medId) {
		return imdd.findMedById(medId);
	}
}
