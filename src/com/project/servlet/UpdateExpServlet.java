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
 * Servlet implementation class UpdateExpServlet
 * @author 赵子墨
 */
@WebServlet("/UpdateExpServlet")
public class UpdateExpServlet extends HttpServlet {
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
		ExpertBean expert = new ExpertBean();
		expert.setExpId(Integer.parseInt(request.getParameter("expId")));
		expert.setExpTel(request.getParameter("expTel"));
		expert.setExpOffice(request.getParameter("expOffice"));
		expert.setExpCompany(request.getParameter("expCompany"));
		expert.setExpEmail(request.getParameter("expEmail"));
		
		//添加日志
		boolean boo = es.updateExpert(expert);;
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"修改了专家:"+es.findExpertById(Integer.parseInt(request.getParameter("expId"))).getExpName()+"的信息");
		}
		response.getWriter().print(boo);
	}

}
