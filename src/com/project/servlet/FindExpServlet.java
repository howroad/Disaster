package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.service.IExpertService;
import com.project.service.impl.ExpertServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindExpServlet
 * @author 赵子墨
 */
@WebServlet("/FindExpServlet")
public class FindExpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IExpertService es = new ExpertServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().println(JSONObject.fromObject(es.findExpertById(Integer.parseInt(request.getParameter("expId")))));
	}

}
