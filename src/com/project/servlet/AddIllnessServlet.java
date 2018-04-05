package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.IllnessBean;
import com.project.bean.UserBean;
import com.project.service.IIllnessService;
import com.project.service.IOperateLogService;
import com.project.service.impl.IllnessServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;
import com.project.util.UploadUtil;

/**
 * Servlet implementation class AddIllnessServlet
 */
@WebServlet("/AddIllnessServlet")
public class AddIllnessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IIllnessService is = new IllnessServiceImpl();
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
		IllnessBean illness = new IllnessBean();
		illness.setIllName(util.getParameter("illName"));
		illness.setIllCause(util.getParameter("illCause"));
		illness.setIllStatus(util.getParameter("illStatus"));
		illness.setIllLaw(util.getParameter("illLaw"));
		illness.setIllPic(util.getParameter("illPic"));
		illness.setIllCure(util.getParameter("illCure"));
		illness.setIllHarm(util.getParameter("illHarm"));
		//添加日志
		boolean boo = is.addIllness(illness);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加病害:"+illness.getIllName());
		}
		response.getWriter().println(boo);
	}

}
