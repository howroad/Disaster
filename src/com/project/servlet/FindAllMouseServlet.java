package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.MouseBean;
import com.project.bean.PageBean;
import com.project.service.IMouseService;
import com.project.service.impl.MouseServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindAllMouse
 */
@WebServlet("/FindAllMouseServlet")
public class FindAllMouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IMouseService is = new MouseServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		String mouName = request.getParameter("mouName");
		int page = Integer.parseInt(pageNo);
		int size = Integer.parseInt(pageSize);
		mouName = mouName==null?"":mouName;
		PageBean<MouseBean> bean = is.findPageBean(page, size, mouName);
		PrintWriter out = response.getWriter();
		JSONObject obj = JSONObject.fromObject(bean);
		out.println(obj);
	}

}
