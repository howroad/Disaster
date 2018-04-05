/**
 * 
 */
package com.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.bean.ExpertBean;

/**
 * @author 赵子墨
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IExpertDao {
	/**
	 * 分页模糊查询
	 * @param start 开始位置
	 * @param pageSize 查询条数
	 * @param expName 专家名子
	 * @param expSpecial 专家专长
	 * @param expCompany 工作单位
	 * @return ExpertBean集合
	 */
	public List<ExpertBean> findAllByPage(@Param("start")int start, @Param("pageSize")int pageSize, 
			@Param("expName")String expName, @Param("expSpecial")String expSpecial, @Param("expCompany")String expCompany);
	/**
	 * 根据id查询
	 * @param expId 专家id
	 * @return ExpertBean对象
	 */
	public ExpertBean findById(int expId);
	/**
	 * 查询所有
	 * @param expSpecial 专家专长
	 * @return 所有ExpertBean
	 */
	public List<ExpertBean> findAll(String expSpecial);
	/**
	 * 添加数据
	 * @param expert ExpertBean对象
	 * @return 大于0成功，否则失败
	 */
	public int add(ExpertBean expert);
	/**
	 * 更新数据
	 * @param expert ExpertBean对象
	 * @return 大于0成功，否则失败
	 */
	public int update(ExpertBean expert);
	/**
	 * 根据专家id修改专家存在状态
	 * @param expId 专家id
	 * @return 大于0成功，否则失败
	 */
	public int updateExsit(int expId);
	/**
	 * 查找数据数量
	 * @param expName 专家名子
	 * @param expSpecial 专家专长
	 * @param expCompany 工作单位
	 * @return 总条数
	 */
	public int findCount(@Param("expName")String expName, @Param("expSpecial")String expSpecial, @Param("expCompany")String expCompany);
}
