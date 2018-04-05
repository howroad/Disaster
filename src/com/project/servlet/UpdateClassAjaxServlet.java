package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ClassBean;
import com.project.bean.UserBean;
import com.project.service.IClassService;
import com.project.service.IOperateLogService;
import com.project.service.impl.ClassServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

/**
 * Servlet implementation class UpdateClassAjaxServlet
 */
@WebServlet("/UpdateClassAjaxServlet")
public class UpdateClassAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 修改小班信息
	 * 请求：clsPerson,clsTel,clsId
	 * 响应：成功true，失败false
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clsPerson = request.getParameter("clsPerson");
		String clsTel = request.getParameter("clsTel");
		String clsIdStr = request.getParameter("clsId");
		int clsId = clsIdStr==null||clsIdStr.length()==0?0:Integer.parseInt(clsIdStr);
		ClassBean clazz = new ClassBean(clsId, null, clsPerson, clsTel, 0, null, null);
		IClassService ics = new ClassServiceImpl();
		//添加日志
		boolean boo = ics.updateClass(clazz);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"修改了小班:"+ics.findClassById(clsId).getClsName()+"的信息");
		}
		response.getWriter().print(boo);
	}

}
