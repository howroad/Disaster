package com.project.service.impl;

import java.util.List;

import com.project.bean.ExpertBean;
import com.project.bean.PageBean;
import com.project.dao.IExpertDao;
import com.project.dao.impl.ExpertDaoImpl;
import com.project.service.IExpertService;
/**
 * 
 * @author 赵子墨
 *
 */
public class ExpertServiceImpl implements IExpertService {
	private IExpertDao ed = new ExpertDaoImpl();
	@Override
	public PageBean<ExpertBean> findPageBean(int pageNo, int pageSize, String expName, String expSpecial,
			String expCompany) {
		List<ExpertBean> expList = ed.findAllByPage((pageNo - 1) * pageSize, pageSize, expName, expSpecial, expCompany);
		return new PageBean<ExpertBean>(expList, pageNo, pageSize, ed.findCount(expName, expSpecial, expCompany));
	}
	@Override
	public ExpertBean findExpertById(int expId) {
		return ed.findById(expId);
	}
	@Override
	public boolean deleteExpert(int expId) {
		return ed.updateExsit(expId) > 0;
	}
	@Override
	public boolean updateExpert(ExpertBean expert) {
		return ed.update(expert) > 0;
	}
	@Override
	public boolean addExpert(ExpertBean expert) {
		return ed.add(expert) > 0;
	}
	@Override
	public List<ExpertBean> findAllExpert(String expSpecial) {
		return ed.findAll(expSpecial);
	}
}
