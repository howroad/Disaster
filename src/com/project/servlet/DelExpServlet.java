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

/**
 * Servlet implementation class DelExpServlet
 * @author 赵子墨
 */
@WebServlet("/DelExpServlet")
public class DelExpServlet extends HttpServlet {
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
		int expId = Integer.parseInt(request.getParameter("expId"));
		ExpertBean expert = es.findExpertById(expId);
		//添加日志
		boolean boo = es.deleteExpert(expId);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"删除专家:"+expert.getExpName());
		}
		response.getWriter().println(boo);
	}

}
