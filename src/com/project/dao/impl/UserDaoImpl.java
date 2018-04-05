package com.project.dao.impl;

import java.util.List;
import java.util.Map;

import com.project.bean.UserBean;
import com.project.dao.IUserDao;
import com.project.util.MyBatisUtil;
/**
 * 
 * @author 赵子墨
 *
 */
public class UserDaoImpl implements IUserDao {
	private IUserDao dao = MyBatisUtil.getSqlSession(true).getMapper(IUserDao.class);
	@Override
	public List<UserBean> findList(Map<String, Object> map) {
		return dao.findList(map);
	}
	@Override
	public int count(Map<String, Object> map) {
		return dao.count(map);
	}
	@Override
	public int addUser(UserBean user) {
		return dao.addUser(user);
	}
	@Override
	public int deleteUser(int userId) {
		return dao.deleteUser(userId);
	}
	@Override
	public int updateUser(UserBean user) {
		return dao.updateUser(user);
	}
	@Override
	public UserBean findUserById(int userId) {
		return dao.findUserById(userId);
	}
	@Override
	public UserBean findUserByNameAndPwd(Map<String,String> map) {
		return dao.findUserByNameAndPwd(map);
	}
}
