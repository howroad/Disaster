package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.InsectBean;
import com.project.bean.UserBean;
import com.project.service.IInsectService;
import com.project.service.IOperateLogService;
import com.project.service.impl.InsectServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;
import com.project.util.UploadUtil;

/**
 * Servlet implementation class AddInsectServlet
 */
@WebServlet("/AddInsectServlet")
public class AddInsectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IInsectService is = new InsectServiceImpl();
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
		InsectBean insect = new InsectBean();
		insect.setInsName(util.getParameter("insName"));
		insect.setInsMaster(util.getParameter("insMaster"));
		insect.setInsBreed(util.getParameter("insBreed"));
		insect.setInsEnemy(util.getParameter("insEnemy"));
		insect.setInsChildPic(util.getParameter("insChildPic"));
		insect.setInsOldPic(util.getParameter("insOldPic"));
		insect.setInsCure(util.getParameter("insCure"));
		insect.setInsHarm(util.getParameter("insHarm"));
		//添加日志
		boolean boo = is.addInsect(insect);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加虫害:"+insect.getInsName());
		}
		response.getWriter().println(boo);
	}

}
