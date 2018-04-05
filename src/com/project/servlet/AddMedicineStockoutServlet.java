package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ClassBean;
import com.project.service.IClassService;
import com.project.service.impl.ClassServiceImpl;

import net.sf.json.JSONArray;



/**
 * Servlet implementation class AddMedicineStockoutServlet
 */
@WebServlet("/AddMedicineStockoutServlet")
public class AddMedicineStockoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IClassService icss = new ClassServiceImpl();
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
		
		List<ClassBean> bean = icss.findAllClass();
		PrintWriter out = response.getWriter();
		JSONArray json = new JSONArray();
		json = JSONArray.fromObject(bean);
		out.println(json);
	}

}
