package com.project.dao.impl;

import java.util.List;

import com.project.bean.ConsultationDetalBean;
import com.project.dao.IConsultationDetalDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class ConsultationDetalDaoImpl implements IConsultationDetalDao{
	private Class<IConsultationDetalDao> clazz = IConsultationDetalDao.class;
	@Override
	public int add(List<ConsultationDetalBean> list) {
		return MyBatisUtil.getSqlSession(true).getMapper(clazz).add(list);
	}
}
