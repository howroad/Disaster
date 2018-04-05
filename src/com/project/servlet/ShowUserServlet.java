package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.PageBean;
import com.project.bean.UserBean;
import com.project.service.IUserService;
import com.project.service.impl.UserServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/ShowUserServlet")
public class ShowUserServlet extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("Content-Type;charset=utf-8");
		String pageNoStr = request.getParameter("pageNo");
		String userGrantStr = request.getParameter("userGrant");
		int pageNo = pageNoStr==null||pageNoStr.length()==0?1:Integer.parseInt(pageNoStr);
		int userGrant = userGrantStr==null||userGrantStr.length()==0?0:Integer.parseInt(userGrantStr);
		IUserService ius = new UserServiceImpl();
		PageBean<UserBean> userBean = ius.findPageBean(pageNo, 5, userGrant);
		JSONObject obj = JSONObject.fromObject(userBean);
		response.getWriter().print(obj);
	}

}
