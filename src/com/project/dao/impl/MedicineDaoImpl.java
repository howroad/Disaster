package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.bean.MedicineBean;
import com.project.dao.IMedicineDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class MedicineDaoImpl implements IMedicineDao {
	@Override
	public List<MedicineBean> findPageBean(Map<String, Object> map) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		IMedicineDao medicinedao = sqlsession.getMapper(IMedicineDao.class);
		return medicinedao.findPageBean(map);
	}
	@Override
	public int add(MedicineBean medicine) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession(true);
		IMedicineDao medicinedao = sqlsession.getMapper(IMedicineDao.class);
		return medicinedao.add(medicine);
	}
	@Override
	public int totalPage(Map<String, Object> map) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession();
		IMedicineDao medicinedao = sqlsession.getMapper(IMedicineDao.class);
		return medicinedao.totalPage(map);
	}
	@Override
	public MedicineBean findMedById(int medId) {
		SqlSession sqlsession = MyBatisUtil.getSqlSession(true);
		IMedicineDao medicinedao = sqlsession.getMapper(IMedicineDao.class);
		return medicinedao.findMedById(medId);
	}
}
