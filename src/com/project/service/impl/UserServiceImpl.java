package com.project.service.impl;

import java.util.HashMap;
import java.util.Map;

import com.project.bean.PageBean;
import com.project.bean.UserBean;
import com.project.dao.IUserDao;
import com.project.dao.impl.UserDaoImpl;
import com.project.service.IUserService;
/**
 * 
 * @author 赵子墨
 *
 */
public class UserServiceImpl implements IUserService {
	private IUserDao dao = new UserDaoImpl();
	@Override
	public PageBean<UserBean> findPageBean(int pageNo, int pageSize, int userGrant) {
		Map<String,Object> map = new HashMap<String,Object>(16);
		map.put("start", (pageNo-1)*pageSize);
		map.put("size", pageSize);
		map.put("userGrant", userGrant);
		return new PageBean<UserBean>(dao.findList(map),pageNo,pageSize,dao.count(map));
	}
	@Override
	public boolean addUser(UserBean user) {
		return dao.addUser(user)>0;
	}
	@Override
	public boolean deleteUser(int userId) {
		return dao.deleteUser(userId)>0;
	}
	@Override
	public boolean updateUser(UserBean user) {
		return dao.updateUser(user)>0;
	}
	@Override
	public UserBean findUserById(int userId) {
		return dao.findUserById(userId);
	}
	@Override
	public UserBean login(String userName, String userPwd) {
		Map<String,String> map = new HashMap<String,String>(16);
		map.put("userName", userName);
		map.put("userPwd", userPwd);
		return dao.findUserByNameAndPwd(map);
	}
}
