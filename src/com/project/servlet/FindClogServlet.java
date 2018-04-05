package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.DisasterLogBean;
import com.project.service.IConsultationLogService;
import com.project.service.IDisasterLogService;
import com.project.service.impl.ConsultationLogServiceImpl;
import com.project.service.impl.DisasterLogServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindClogServlet
 * @author 赵子墨
 */
@WebServlet("/FindClogServlet")
public class FindClogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IConsultationLogService cls = new ConsultationLogServiceImpl();
	private IDisasterLogService dls = new DisasterLogServiceImpl();
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
		int dlogId = Integer.parseInt(request.getParameter("dlogId"));
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		DisasterLogBean dlog = dls.findDlogById(dlogId);
		dlog.setClogList(cls.findPageBean(pageNo, 10, dlogId).getList());
		response.getWriter().println(JSONObject.fromObject(dlog));
	}

}
