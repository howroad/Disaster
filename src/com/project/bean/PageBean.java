/**
 * 
 */
package com.project.bean;

import java.util.List;

/**
 * @author howroad
 * @Date 2018年1月16日
 * @version 1.0
 * @version 1.1 准备删除无参构造器
 */
public class PageBean<T> {
	private List<T> list;
	private int pageNo;
	private int pageSize;
	private int totalPage;
	private int totalRecord;
	public PageBean(List<T> list, int pageNo, int pageSize, int totalRecord) {
		this.list = list;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		this.totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
	}
	public boolean hasPrev(int pageNo) {
		return pageNo > 1;
	}
	public boolean hasNext(int pageNo) {
		return pageNo < this.totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	@Override
	public String toString() {
		return "PageBean [list=" + list + ", pageNo=" + pageNo + ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", totalRecord=" + totalRecord + "]";
	}
}
