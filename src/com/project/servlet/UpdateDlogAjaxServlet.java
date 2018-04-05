package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.DisasterLogBean;
import com.project.bean.UserBean;
import com.project.service.IDisasterLogService;
import com.project.service.IOperateLogService;
import com.project.service.impl.DisasterLogServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

/**
 * Servlet implementation class UpdateDlogAjaxServlet
 */
@WebServlet("/UpdateDlogAjaxServlet")
public class UpdateDlogAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * 修改dlog的dlogStage和dlogPlan
	 * 请求:dlogId,dlogStage,dlogPlan
	 * 响应:成功true,失败flase
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得请求
		String dlogIdStr = request.getParameter("dlogId");
		String dlogStageStr = request.getParameter("dlogStage");
		String dlogPlan = request.getParameter("dlogPlan");
		int dlogId = dlogIdStr==null||dlogIdStr.length()==0?0:Integer.parseInt(dlogIdStr);
		int dlogStage = dlogStageStr==null||dlogStageStr.length()==0?0:Integer.parseInt(dlogStageStr);
		//封装到DlogBean
		DisasterLogBean dlog = new DisasterLogBean(dlogId, null, null, null, 0, dlogStage, null, 0, null, null, dlogPlan, null, null);
		//修改
		IDisasterLogService idls = new DisasterLogServiceImpl();
		//添加日志
		boolean boo = idls.updateDlog(dlog);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"修改了灾情:"+idls.findDlogById(dlogId).getDlogName()+"的信息");
		}
		//响应
		response.getWriter().print(boo);
	}

}
