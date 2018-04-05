/**
 * 
 */
package com.project.service;

import com.project.bean.PageBean;
import com.project.bean.StockoutLogBean;

/**
 * @author howroad
 * @Date 2018年3月18日
 * @version 1.0
 */
public interface IStockoutService {
	/**
	 * 获得分页，以及模糊查询后的StockoutLogBean集合
	 * @param pageNo 当前页数
	 * @param pageSize 一共显示几条内容
	 * @param startDate 模糊查询输入的起始日期
	 * @param overDate 模糊查询输入的结束日期
	 * @param clsName 模糊查询输入的领用小班
	 * @return PageBean
	 */
	public PageBean<StockoutLogBean> findPageBean(int pageNo, int pageSize,String startDate,String overDate, String clsName);
	/**
	 * 添加出库信息
	 * @param stockoutlog 传入你需要添加的StockoutLogBean
	 * @return 是否成功
	 */
	public boolean addStockoutLog(StockoutLogBean stockoutlog);
	/**
	 * 查询出库信息
	 * @param slogId 传入需要查询的信息的id
	 * @return StockoutLogBean
	 */
	public StockoutLogBean findStockoutById(int slogId);
}
