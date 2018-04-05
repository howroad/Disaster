package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ExpertBean;
import com.project.bean.UserBean;
import com.project.service.IExpertService;
import com.project.service.IOperateLogService;
import com.project.service.impl.ExpertServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;
import com.project.util.UploadUtil;

/**
 * Servlet implementation class AddExpServlet
 * @author 赵子墨
 */
@WebServlet("/AddExpServlet")
public class AddExpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IExpertService es = new ExpertServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UploadUtil util = new UploadUtil(request, getServletContext());
		util.upload();
		ExpertBean expert = new ExpertBean();
		expert.setExpPic(util.getParameter("expPic"));
		expert.setExpAddress(util.getParameter("expAddress"));
		expert.setExpBirth(util.getParameter("expBirth"));
		expert.setExpCompany(util.getParameter("expCompany"));
		expert.setExpEmail(util.getParameter("expEmail"));
		expert.setExpGender(util.getParameter("expGender"));
		expert.setExpName(util.getParameter("expName"));
		expert.setExpOffice(util.getParameter("expOffice"));
		expert.setExpSpecial(util.getParameter("expSpecial"));
		expert.setExpTel(util.getParameter("expTel"));
		boolean boo = es.addExpert(expert);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加专家:"+expert.getExpName());
		}
		response.getWriter().println(boo);
	}

}
