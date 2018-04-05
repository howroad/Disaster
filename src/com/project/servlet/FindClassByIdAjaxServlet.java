package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ClassBean;
import com.project.service.IClassService;
import com.project.service.impl.ClassServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindClassByIdAjaxServlet
 */
@WebServlet("/FindClassByIdAjaxServlet")
public class FindClassByIdAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * FindClassById
	 * 请求:clsId
	 * 响应:ClassBean
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clsIdStr = request.getParameter("clsId");
		int clsId = clsIdStr==null||clsIdStr.length()==0?0:Integer.parseInt(clsIdStr);
		IClassService ics = new ClassServiceImpl();
		ClassBean clazz = ics.findClassById(clsId);
		JSONObject obj = JSONObject.fromObject(clazz);
		response.getWriter().print(obj);
	}

}
