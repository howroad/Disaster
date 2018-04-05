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
 * Servlet implementation class DelUserServlet
 */
@WebServlet("/DelUserServlet")
public class DelUserServlet extends HttpServlet {
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
		String userIdStr = request.getParameter("userId");
		int userId = userIdStr==null||userIdStr.length()==0?0:Integer.parseInt(userIdStr);
		IUserService ius = new UserServiceImpl();
		//添加日志
		String userNameTemp = ius.findUserById(userId).getUserName();
		boolean boo = ius.deleteUser(userId);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"删除用户:"+userNameTemp);
		}
		response.getWriter().print(boo);
	}

}
