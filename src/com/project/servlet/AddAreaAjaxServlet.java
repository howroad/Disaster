package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.AreaBean;
import com.project.bean.UserBean;
import com.project.service.IAreaService;
import com.project.service.IOperateLogService;
import com.project.service.impl.AreaServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

/**
 * Servlet implementation class AddAreaAjaxServlet
 */
@WebServlet("/AddAreaAjaxServlet")
public class AddAreaAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 接受ajax请求，添加Area
	 * 请求：areaName,areaForest,areaAdv,areaLand
	 * 响应：成功返回true，否则false
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接受请求
		String areaName = request.getParameter("areaName");
		String areaForest = request.getParameter("areaForest");
		String areaAdv = request.getParameter("areaAdv");
		String areaLandStr = request.getParameter("areaLand");
		int areaLand = Integer.parseInt(areaLandStr);
		//响应
		AreaBean area = new AreaBean(0,areaName,areaForest,areaAdv,areaLand,null);
		IAreaService ias = new AreaServiceImpl();
		boolean boo = ias.addArea(area);
		if(boo) {
			//记录日志
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加区域:"+areaName);
		}
		response.getWriter().print(boo);
	}

}
