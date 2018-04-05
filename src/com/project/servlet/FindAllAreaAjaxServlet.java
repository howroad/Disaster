package com.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.AreaBean;
import com.project.service.IAreaService;
import com.project.service.impl.AreaServiceImpl;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class FindAllAreaAjaxServlet
 */
@WebServlet("/FindAllAreaAjaxServlet")
public class FindAllAreaAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 获得所有区域
	 * 请求:无
	 * 响应:List
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IAreaService ias = new AreaServiceImpl();
		List<AreaBean> list = ias.findAllArea();
		JSONArray olist = JSONArray.fromObject(list);
		response.getWriter().print(olist);
	}

}
