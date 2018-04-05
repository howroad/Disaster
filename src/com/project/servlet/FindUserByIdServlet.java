package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.UserBean;
import com.project.service.IUserService;
import com.project.service.impl.UserServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindUserByIdServlet
 */
@WebServlet("/FindUserByIdServlet")
public class FindUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * ajax根据userId查找user
	 * 请求：需要userId
	 * 响应：Jsonobj
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userIdStr = request.getParameter("userId");
		int userId = userIdStr==null||userIdStr.length()==0?0:Integer.parseInt(userIdStr);
		IUserService ius = new UserServiceImpl();
		UserBean user = ius.findUserById(userId);
		//把UserBean转换成JSON类型的字符串
		JSONObject obj = JSONObject.fromObject(user);
		response.getWriter().print(obj);
	}

}
