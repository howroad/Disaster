package com.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.ConsultationDetalBean;
import com.project.bean.ConsultationLogBean;
import com.project.bean.DisasterLogBean;
import com.project.bean.UserBean;
import com.project.service.IConsultationLogService;
import com.project.service.IDisasterLogService;
import com.project.service.IExpertService;
import com.project.service.IOperateLogService;
import com.project.service.impl.ConsultationLogServiceImpl;
import com.project.service.impl.DisasterLogServiceImpl;
import com.project.service.impl.ExpertServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

/**
 * Servlet implementation class AddClogServlet
 * @author 赵子墨
 */
@WebServlet("/AddClogServlet")
public class AddClogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IConsultationLogService cls = new ConsultationLogServiceImpl();
	private IExpertService es = new ExpertServiceImpl();
	private IDisasterLogService dls = new DisasterLogServiceImpl();
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
		String expIdArr = request.getParameter("expIdArr");
		String clogResult = request.getParameter("clogResult");
		String dlogId = request.getParameter("dlogId");
		String[] expId = expIdArr.split(",");
		List<ConsultationDetalBean> cdtlList = new ArrayList<ConsultationDetalBean>();
		ConsultationDetalBean cdtl = null;
		for (int i = 0; i < expId.length; i++) {
			cdtl = new ConsultationDetalBean();
			cdtl.setCdtlExp(es.findExpertById(Integer.parseInt(expId[i])));
			cdtlList.add(cdtl);
		}
		DisasterLogBean dlog = dls.findDlogById(Integer.parseInt(dlogId));
		ConsultationLogBean clog = new ConsultationLogBean(0, null, clogResult, dlog, cdtlList);
		boolean boo = cls.addClog(clog);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"对灾害事件:"+dlog.getDlogName()+",添加专家会商信息");
		}
		response.getWriter().println(boo);
	}

}
