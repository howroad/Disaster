package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.IllnessBean;
import com.project.service.IIllnessService;
import com.project.service.impl.IllnessServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindIllnessServlet
 */
@WebServlet("/FindIllnessServlet")
public class FindIllnessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IIllnessService is = new IllnessServiceImpl();
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
		
		IllnessBean ins = is.findIllnessById(Integer.parseInt(request.getParameter("illId")));
		response.getWriter().println(JSONObject.fromObject(ins));
	}

}
