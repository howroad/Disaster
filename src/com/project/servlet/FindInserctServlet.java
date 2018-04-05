package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.InsectBean;
import com.project.service.IInsectService;
import com.project.service.impl.InsectServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindInserctServlet
 */
@WebServlet("/FindInserctServlet")
public class FindInserctServlet extends HttpServlet {
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
		
		InsectBean ins = is.findInsectById(Integer.parseInt(request.getParameter("insId")));
		response.getWriter().println(JSONObject.fromObject(ins));
	}

}
