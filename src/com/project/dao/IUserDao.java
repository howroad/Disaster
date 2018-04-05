/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.UserBean;

/**
 * @author howroad
 * @Date 2018年3月18日
 * @version 1.0
 */
public interface IUserDao {
	/**
	 * 查询所有用户
	 * @param map 查询条件
	 * @return UserBean集合
	 */
	public List<UserBean> findList(Map<String,Object> map);
	/**
	 * 查询总数
	 * @param map 查询条件
	 * @return 总数
	 */
	public int count(Map<String,Object> map);
	/**
	 * 添加用户
	 * @param user 用户
	 * @return 受影响行数
	 */
	public int addUser(UserBean user);
	/**
	 * 删除用户
	 * @param userId 用户id
	 * @return 受影响行数
	 */
	public int deleteUser(int userId);
	/**
	 * 修改用户信息
	 * @param user 用户
	 * @return 受影响行数
	 */
	public int updateUser(UserBean user);
	/**
	 * 根据id查询用户
	 * @param userId 用户id
	 * @return UserBean对象
	 */
	public UserBean findUserById(int userId);
	/**
	 * 根据用户名密码查询用户
	 * @param map 查询条件
	 * @return UserBean对象
	 */
	public UserBean findUserByNameAndPwd(Map<String,String> map);
}
