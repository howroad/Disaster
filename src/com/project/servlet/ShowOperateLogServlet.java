package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.OperateLogBean;
import com.project.bean.PageBean;
import com.project.service.IOperateLogService;
import com.project.service.impl.OperateLogServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class ShowOperateLogServlet
 */
@WebServlet("/ShowOperateLogServlet")
public class ShowOperateLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		response.setContentType("Content-Type;charset=utf-8");
		String pageNoStr = request.getParameter("pageNo");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int pageNo = pageNoStr==null||pageNoStr.length()==0?1:Integer.parseInt(pageNoStr);
		IOperateLogService iols = new OperateLogServiceImpl();
		PageBean<OperateLogBean> ologBean = iols.findPageBean(pageNo, 5, startDate, endDate);
		JSONObject obj = JSONObject.fromObject(ologBean);
		response.getWriter().print(obj);
	}

}
