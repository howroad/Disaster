package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.AreaBean;
import com.project.bean.ClassBean;
import com.project.bean.UserBean;
import com.project.service.IClassService;
import com.project.service.IOperateLogService;
import com.project.service.impl.ClassServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

/**
 * Servlet implementation class AddClassAjaxServlet
 */
@WebServlet("/AddClassAjaxServlet")
public class AddClassAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 接受ajax请求，添加Class
	 * 请求：clsName,clsPerson,clstel,clsPNum,areaId
	 * 响应：成功返回true，否则false
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//请求
		String clsName = request.getParameter("clsName");
		String clsPerson = request.getParameter("clsPerson");
		String clsTel = request.getParameter("clsTel");
		String clsPnumStr = request.getParameter("clsPNum");
		String areaIdStr = request.getParameter("areaId");
		int clsPNum = clsPnumStr==null||clsPnumStr.length()==0?0:Integer.parseInt(clsPnumStr);
		int areaId = areaIdStr==null||areaIdStr.length()==0?0:Integer.parseInt(areaIdStr);
		//处理请求
		ClassBean clazz = new ClassBean(0, clsName, clsPerson, clsTel, clsPNum, null, new AreaBean(areaId, null, null, null, 0, null));
		IClassService ics = new ClassServiceImpl();
		boolean boo = ics.addClass(clazz);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加班级"+clsName);
		}
		//响应
		response.getWriter().print(boo);
	}

}
