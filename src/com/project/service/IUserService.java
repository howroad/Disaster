/**
 * 
 */
package com.project.service;

import com.project.bean.PageBean;
import com.project.bean.UserBean;

/**
 * @author howroad
 * @Date 2018年3月18日
 * @version 1.0
 */
public interface IUserService {
	/**
	 * 根据pageNo，pageSize，userGrant得到所有满足条件的用户信息
	 * @param pageNo 页码
	 * @param pageSize 每页显示的信息条数
	 * @param userGrant 用户的权限等级
	 * @return 返回一个pageBean
	 */
	public PageBean<UserBean> findPageBean(int pageNo,int pageSize,int userGrant);
	/**
	 * 添加新用户，成功返回1
	 * @param userBean 需要添加的UserBean
	 * @return 添加成功返回1
	 */
	public boolean addUser(UserBean user);
	/**
	 * 删除用户，删除成功返回1
	 * @param userId 需要删除的用户id
	 * @return 删除成功返回1
	 */
	public boolean deleteUser(int userId);
	/**
	 * 修改用户信息
	 * @param userBean 修改后的UserBean 
	 * @return 修改成功返回1
	 */
	public boolean updateUser(UserBean user);
	/**
	 * 根据id查询用户
	 * @param userId 用户id
	 * @return UserBean对象
	 */
	public UserBean findUserById(int userId);
	/**
	 * 登录验证
	 * @param userName 用户名
	 * @param userPwd 密码
	 * @return UserBean对象
	 */
	public UserBean login(String userName,String userPwd);
}
