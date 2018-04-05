/**
 * 
 */
package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.bean.StockoutLogBean;

/**
 * @author howroad
 * @Date 2018年3月18日
 * @version 1.0
 */
public interface IStockoutDao {
	/**
	 * 模糊分页查询出库信息
	 * @param map 查询条件
	 * @return StockoutLogBean集合
	 */
	public List<StockoutLogBean> findPageBean(Map<String,Object> map); 
	/**
	 * 添加出库信息
	 * @param slog 出库信息
	 * @return 受影响行数
	 */
	public int add(StockoutLogBean slog);
	/**
	 * 根据id查询出库信息
	 * @param id 出库id
	 * @return StockoutLogBean对象
	 */
	public StockoutLogBean findStockoutById(int id);
	/**
	 * 模糊查询总数
	 * @param map 查询条件
	 * @return 总数
	 */
	public int totalPage(Map<String,Object> map); 
}
