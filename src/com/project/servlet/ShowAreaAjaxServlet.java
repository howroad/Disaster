package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.AreaBean;
import com.project.bean.PageBean;
import com.project.service.IAreaService;
import com.project.service.impl.AreaServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class ShowAreaAjaxServlet
 */
@WebServlet("/ShowAreaAjaxServlet")
public class ShowAreaAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 请求：pageNo,pageSize,areaName,areaForest,clsName
	 * 响应：PageBean
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//请求参数
		String areaName = request.getParameter("areaName");
		String areaForest = request.getParameter("areaForest");
		String clsName = request.getParameter("clsName");
		String pageNoStr = request.getParameter("pageNo");
		int pageNo = pageNoStr==null||pageNoStr.length()==0?1:Integer.parseInt(pageNoStr);
		int pageSize = 5;
		//处理请求
		IAreaService ias = new AreaServiceImpl();
		PageBean<AreaBean> pb = ias.findPageBean(pageNo, pageSize, areaName, areaForest, clsName);
		JSONObject obj = JSONObject.fromObject(pb);
		//响应
		response.getWriter().print(obj);
	}

}
