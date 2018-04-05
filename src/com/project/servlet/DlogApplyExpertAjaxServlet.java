package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.UserBean;
import com.project.service.IDisasterLogService;
import com.project.service.IOperateLogService;
import com.project.service.impl.DisasterLogServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

/**
 * Servlet implementation class DlogApplyExpertAjaxServlet
 */
@WebServlet("/DlogApplyExpertAjaxServlet")
public class DlogApplyExpertAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Ajax灾害事件申请专家会商（根据dlogId修改dlogStage）
	 * 请求：dlogId
	 * 响应：正确true，错误false
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dlogIdStr = request.getParameter("dlogId");
		int dlogId = dlogIdStr==null||dlogIdStr.length()==0?0:Integer.parseInt(dlogIdStr);
		IDisasterLogService idls = new DisasterLogServiceImpl();
		//添加日志
		boolean boo = idls.updateDlogStage(dlogId);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"对事件:"+idls.findDlogById(dlogId).getDlogName()+"申请专家会商");
		}
		response.getWriter().print(boo);
	}

}
