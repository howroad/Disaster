package com.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.bean.ClassBean;
import com.project.bean.StockoutDetalBean;
import com.project.bean.StockoutLogBean;
import com.project.bean.UserBean;
import com.project.service.IClassService;
import com.project.service.IOperateLogService;
import com.project.service.IStockoutService;
import com.project.service.impl.ClassServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;
import com.project.service.impl.StockoutServiceImpl;

/**
 * Servlet implementation class AddSlogServlet
 * @author 赵子墨
 */
@WebServlet("/AddSlogServlet")
public class AddSlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IStockoutService ss = new StockoutServiceImpl();
	private IClassService cs = new ClassServiceImpl();
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
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		List<StockoutDetalBean> sdtlList = (List<StockoutDetalBean>) session.getAttribute("sdtlList");
		UserBean user = (UserBean) session.getAttribute("user");
		ClassBean cls = cs.findClassById(Integer.parseInt(request.getParameter("classId")));
		StockoutLogBean slog = new StockoutLogBean();
		slog.setSdtlList(sdtlList);
		slog.setSlogUser(user);
		slog.setSlogClass(cls);
		boolean boo = ss.addStockoutLog(slog);
		if(boo) {
			//记录日志
			IOperateLogService iols = new OperateLogServiceImpl();
			iols.addOperateLog(user, "领取了物品");
		}
		session.removeAttribute("sdtlList");
		response.getWriter().println(boo);
	}

}
