package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.InsectBean;
import com.project.bean.PageBean;
import com.project.service.IInsectService;
import com.project.service.impl.InsectServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindAllInserctServlet
 */
@WebServlet("/FindAllInserctServlet")
public class FindAllInserctServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IInsectService is = new InsectServiceImpl();
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
		
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		String insName = request.getParameter("insName");
		String insMaster = request.getParameter("insMaster");
		int page = Integer.parseInt(pageNo);
		int size = Integer.parseInt(pageSize);
		insName = insName==null?"":insName;
		insMaster = insMaster==null?"":insMaster;
		PageBean<InsectBean> bean = is.findPageBean(page, size, insName, insMaster);
		PrintWriter out = response.getWriter();
		JSONObject obj = JSONObject.fromObject(bean);
		out.println(obj);
	}

}
