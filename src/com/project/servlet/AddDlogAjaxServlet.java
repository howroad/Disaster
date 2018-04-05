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
import com.project.util.LuUploadUtil;

/**
 * Servlet implementation class AddDlogAjaxServlet
 */
@WebServlet("/AddDlogAjaxServlet")
public class AddDlogAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * Ajax添加Dlog事件
	 * 请求:dlogName,dlogDate,dlogStage,dlogDesc,areaId,dlogLoss,dlogPlan,dlogPic,dlogType,dlogFound,clsId,dlogInfluence
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DisasterLogBean dlog = new LuUploadUtil<DisasterLogBean>(request){}.getBean();
		System.out.println(dlog);
		IDisasterLogService idls = new DisasterLogServiceImpl();
		boolean boo = idls.addDlog(dlog);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加灾害事件:"+dlog.getDlogName());
		}
		response.getWriter().print(boo);
	}

}
