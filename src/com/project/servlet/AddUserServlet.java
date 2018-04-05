package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.UserBean;
import com.project.service.IOperateLogService;
import com.project.service.IUserService;
import com.project.service.impl.OperateLogServiceImpl;
import com.project.service.impl.UserServiceImpl;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		String userName = request.getParameter("userName");
		String userPassword = request.getParameter("userPassword");
		String userRName = request.getParameter("userRName");
		String userGrantStr = request.getParameter("userGrant");
		int userGrant = Integer.parseInt(userGrantStr);
		UserBean userBean = new UserBean(0, userName, userPassword, userRName, userGrant);
		IUserService ius = new UserServiceImpl();
		//添加日志
		boolean boo = ius.addUser(userBean);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加用户:"+userName);
		}
		response.getWriter().print(boo);
	}

}
