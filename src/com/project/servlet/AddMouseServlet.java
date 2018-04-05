package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.MouseBean;
import com.project.bean.UserBean;
import com.project.service.IMouseService;
import com.project.service.IOperateLogService;
import com.project.service.impl.MouseServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;
import com.project.util.UploadUtil;

/**
 * Servlet implementation class AddMouseServlet
 */
@WebServlet("/AddMouseServlet")
public class AddMouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IMouseService ms = new MouseServiceImpl();
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
		UploadUtil util = new UploadUtil(request, getServletContext());
		util.upload();
		MouseBean mouse = new MouseBean();
		mouse.setMouName(util.getParameter("mouName"));
		mouse.setMouFood(util.getParameter("mouFood"));
		mouse.setMouBreed(util.getParameter("mouBreed"));
		mouse.setMouEnemy(util.getParameter("mouEnemy"));
		mouse.setMouPic(util.getParameter("mouPic"));
		mouse.setMouCure(util.getParameter("mouCure"));
		mouse.setMouHarm(util.getParameter("mouHarm"));
		//添加日志
		boolean boo = ms.addMouse(mouse);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加鼠害:"+mouse.getMouName());
		}
		response.getWriter().println(boo);
	}

}
