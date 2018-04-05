package com.project.service;

import java.util.List;

import com.project.bean.ExpertBean;
import com.project.bean.PageBean;

/**
 * @author howroad
 * @Date 2018年3月17日
 * @version 1.0
 */
public interface IExpertService {
	/**
	 * 分页+模糊查询多个专家信息封装为PageBean
	 * @param pageNo 当前页数
	 * @param pageSize 每页显示条数
	 * @param expName 专家名
	 * @param expSpecial 专家专长
	 * @param expCompany 工作单位
	 * @return PageBean对象
	 */
	public PageBean<ExpertBean> findPageBean(int pageNo, int pageSize, String expName, String expSpecial, String expCompany);
	/**
	 * 根据专家id查找专家信息
	 * @param expId 专家id
	 * @return ExpertBean对象
	 */
	public ExpertBean findExpertById(int expId);
	/**
	 * 根据专家id删除专家
	 * @param expId 专家id
	 * @return true为删除成功，否则失败
	 */
	public boolean deleteExpert(int expId);
	/**
	 * 修改专家信息
	 * @param expert 专家对象
	 * @return true为修改成功，否则失败
	 */
	public boolean updateExpert(ExpertBean expert);
	/**
	 * 添加专家
	 * @param expert 专家对象
	 * @return true为添加成功，否则失败
	 */
	public boolean addExpert(ExpertBean expert);
	/**
	 * 根据专家专长查询专家
	 * @param expSpecial 专长
	 * @return 专家集合
	 */
	public List<ExpertBean> findAllExpert(String expSpecial);
}
