package com.project.service.impl;

import java.util.List;

import com.project.bean.ConsultationDetalBean;
import com.project.bean.ConsultationLogBean;
import com.project.bean.PageBean;
import com.project.dao.IConsultationDetalDao;
import com.project.dao.IConsultationLogDao;
import com.project.dao.impl.ConsultationDetalDaoImpl;
import com.project.dao.impl.ConsultationLogDaoImpl;
import com.project.service.IConsultationLogService;
/**
 * 
 * @author 赵子墨
 *
 */
public class ConsultationLogServiceImpl implements IConsultationLogService {
	private IConsultationLogDao cld = new ConsultationLogDaoImpl();
	private IConsultationDetalDao cdd = new ConsultationDetalDaoImpl();
	@Override
	public PageBean<ConsultationLogBean> findPageBean(int pageNo, int pageSize, int dlogId) {
		List<ConsultationLogBean> clogList = cld.findAllByPage((pageNo - 1) * pageSize, pageSize, dlogId);
		return new PageBean<ConsultationLogBean>(clogList, pageNo, pageSize, cld.findCount(dlogId));
	}
	@Override
	public boolean addClog(ConsultationLogBean clog) {
		cld.add(clog);
		List<ConsultationDetalBean> cdtlList = clog.getCdtlList();
		for (ConsultationDetalBean consultationDetalBean : cdtlList) {
			consultationDetalBean.setCdtlClog(clog);
		}
		return cdd.add(cdtlList) > 0;
	}
}
