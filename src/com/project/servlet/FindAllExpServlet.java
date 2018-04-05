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
 * Servlet implementation class FindAllExpServlet
 * @author 赵子墨
 */
@WebServlet("/FindAllExpServlet")
public class FindAllExpServlet extends HttpServlet {
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
		String expName = request.getParameter("expName");
		String expSpecial = request.getParameter("expSpecial");
		String expCompany = request.getParameter("expCompany");
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		expName = (expName == null || expName.equals("undefined")) ? "" : expName;
		expSpecial = (expSpecial == null || expSpecial.equals("undefined")) ? "" : expSpecial;
		expCompany = (expCompany == null || expCompany.equals("undefined")) ? "" : expCompany;
		pageNo = (pageNo == null || pageNo.equals("undefined")) ? "1" : pageNo;
		pageSize = (pageSize == null || pageSize.equals("undefined")) ? "5" : pageSize;
		response.getWriter().println(JSONObject.fromObject(es.findPageBean(Integer.parseInt(pageNo), Integer.parseInt(pageSize), expName, expSpecial, expCompany)));
	}

}
