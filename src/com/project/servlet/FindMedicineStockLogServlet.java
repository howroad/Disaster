package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.StockoutDetalBean;
import com.project.bean.StockoutLogBean;
import com.project.dao.IStockoutDetalDao;
import com.project.dao.impl.StockoutDetalDaoImpl;
import com.project.service.IStockoutService;
import com.project.service.impl.StockoutServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindMedicineStockLogServlet
 */
@WebServlet("/FindMedicineStockLogServlet")
public class FindMedicineStockLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IStockoutService isks = new StockoutServiceImpl(); 
	private IStockoutDetalDao iskd = new StockoutDetalDaoImpl();
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
		
		int slogId = Integer.parseInt(request.getParameter("inp"));
		StockoutLogBean bean = isks.findStockoutById(slogId);
		List<StockoutDetalBean> sdetal = iskd.fingpageBean(bean);
		System.out.println(sdetal.size());
		bean.setSdtlList(sdetal);
		
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		json = JSONObject.fromObject(bean);
		System.out.println(json);
		out.println(json);
	}

}
