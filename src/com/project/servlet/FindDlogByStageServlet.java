package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.DisasterLogBean;
import com.project.bean.PageBean;
import com.project.service.IDisasterLogService;
import com.project.service.impl.DisasterLogServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindDlogByStageServlet
 * @author 赵子墨
 */
@WebServlet("/FindDlogByStageServlet")
public class FindDlogByStageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		pageNo = (pageNo == null || pageNo.equals("undefined")) ? "1" : pageNo;
		pageSize = (pageSize == null || pageSize.equals("undefined")) ? "5" : pageSize;
		PageBean<DisasterLogBean> page = dls.findPageBeanNeedExp(Integer.parseInt(pageNo), Integer.parseInt(pageSize));
		response.getWriter().println(JSONObject.fromObject(page));
	}

}
