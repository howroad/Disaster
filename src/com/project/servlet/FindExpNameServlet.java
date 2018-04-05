package com.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ExpertBean;
import com.project.service.IExpertService;
import com.project.service.impl.ExpertServiceImpl;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class FindExpNameServlet
 * @author 赵子墨
 */
@WebServlet("/FindExpNameServlet")
public class FindExpNameServlet extends HttpServlet {
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
		int dlogType = Integer.parseInt(request.getParameter("dlogType"));
		String expSpecial = dlogType == 1 ? "虫害防治" : (dlogType == 2 ? "鼠害防治" : "森林病害防治");
		List<ExpertBean> expList = es.findAllExpert(expSpecial);
		response.getWriter().println(JSONArray.fromObject(expList));
	}

}
