package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ClassBean;
import com.project.bean.PageBean;
import com.project.service.IClassService;
import com.project.service.impl.ClassServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class ShowClassAjaxServlet
 */
@WebServlet("/ShowClassAjaxServlet")
public class ShowClassAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * ajax动态加载小班pageBean
	 * 请求:clsName,areaName，pageNo
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//请求
		String clsName = request.getParameter("clsName");
		String areaName = request.getParameter("areaName");
		String pageNoStr = request.getParameter("pageNo");
		int pageNo = pageNoStr==null||pageNoStr.length()==0?1:Integer.parseInt(pageNoStr);
		int pageSize = 5;
		//处理请求
		IClassService ics = new ClassServiceImpl();
		PageBean<ClassBean> pb = ics.findPageBean(pageNo, pageSize, clsName, areaName);
		JSONObject obj = JSONObject.fromObject(pb);
		//响应
		response.getWriter().print(obj);
	}

}
