package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.PageBean;
import com.project.bean.StockoutLogBean;
import com.project.service.IStockoutService;
import com.project.service.impl.StockoutServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class MedicineStockoutServlet
 */
@WebServlet("/MedicineStockoutServlet")
public class MedicineStockoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IStockoutService isks = new StockoutServiceImpl();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String pages =request.getParameter("page");
		String startdate =request.getParameter("startdate");
		String overdate =request.getParameter("overdate");
		String classname =request.getParameter("classname");
		int pagenum = pages == null?1:Integer.parseInt(pages);
		
		PageBean<StockoutLogBean> page = isks.findPageBean(pagenum, 5, startdate, overdate, classname);
		
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		json = JSONObject.fromObject(page);
		out.println(json);
	}
}
