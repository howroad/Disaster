/**
 * 
 */
package com.project.dao;

import java.util.List;

import com.project.bean.StockoutDetalBean;
import com.project.bean.StockoutLogBean;

/**
 * @author howroad
 * @Date 2018年3月30日
 * @version 1.0
 */
public interface IStockoutDetalDao {
	/**
	 * 查询所有出库详情
	 * @param solg 出库详情
	 * @return StockoutDetalBean对象
	 */
	public List<StockoutDetalBean> fingpageBean(StockoutLogBean solg);
	/**
	 * 批量添加出库详情
	 * @param sdtlList StockoutDetalBean集合
	 * @return 受影响行数
	 */
	public int add(List<StockoutDetalBean> sdtlList);
}
