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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * request:username,password,grant
	 * response:
	 * 		成功->session存入user,ShowMainServlet
	 * 		失败->用户名/密码错误;权限不足;
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理请求
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//String grantStr = request.getParameter("grant");
		//int grant = Integer.parseInt(grantStr);
		//操作
		IUserService ius = new UserServiceImpl();
		UserBean user = ius.login(username, password);
		System.out.println(user);
		//响应
		if(user==null) {
			//用户名或密码错误
			request.getSession().setAttribute("message", "用户名或密码错误!");
			//响应错误页面
			response.sendRedirect("/Disaster/jsp/message.jsp");
			return;
		}else {
			//成功登陆
			//存入user到session
			request.getSession().setAttribute("user", user);
			//记录日志
			IOperateLogService iols = new OperateLogServiceImpl();
			iols.addOperateLog(user,"登陆系统");
			//响应ShowMainServlet
			response.sendRedirect("/Disaster/jsp/index.jsp");
		}
//		if(grant==user.getUserGrant()||user.getUserGrant()==5) {
//
//		}else {
//			//权限不足
//			request.getSession().setAttribute("message", "权限错误");
//			//响应错误页面
//			response.sendRedirect("/Disaster/jsp/message.jsp");
//		}
	}

}
