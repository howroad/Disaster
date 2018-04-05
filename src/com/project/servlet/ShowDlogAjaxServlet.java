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
 * Servlet implementation class ShowDlogAjaxServlet
 */
@WebServlet("/ShowDlogAjaxServlet")
public class ShowDlogAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Ajax显示pageBean
	 * 请求:dlogName,dlogStage,areaName,startDate,endDate
	 * 响应:pageBean
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//请求
		String pageNoStr = request.getParameter("pageNo");
		String dlogName = request.getParameter("dlogName");
		String dlogStageStr= request.getParameter("dlogStage");
		String areaName = request.getParameter("areaName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		int dlogStage = Integer.parseInt(dlogStageStr);
		int pageNo = pageNoStr==null||pageNoStr.length()==0?1:Integer.parseInt(pageNoStr);
		int pageSize = 5;
		//处理
		IDisasterLogService idls = new DisasterLogServiceImpl();
		PageBean<DisasterLogBean> pb = idls.findPageBean(pageNo, pageSize, dlogName, dlogStage, areaName, startDate, endDate);
		JSONObject obj = JSONObject.fromObject(pb);
		//响应
		response.getWriter().print(obj);
				
	}

}
