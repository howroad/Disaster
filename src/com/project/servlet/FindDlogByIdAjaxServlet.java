package com.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.DisasterLogBean;
import com.project.service.IDisasterLogService;
import com.project.service.impl.DisasterLogServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindDlogByIdAjaxServlet
 */
@WebServlet("/FindDlogByIdAjaxServlet")
public class FindDlogByIdAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * ajax根据Id获得dlog
	 * 请求:dlogId
	 * 响应:obj
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dlogIdStr = request.getParameter("dlogId");
		int dlogId = dlogIdStr==null||dlogIdStr.length()==0?0:Integer.parseInt(dlogIdStr);
		IDisasterLogService idls = new DisasterLogServiceImpl();
		DisasterLogBean dlog = idls.findDlogById(dlogId);
		JSONObject obj = JSONObject.fromObject(dlog);
		response.getWriter().print(obj);
	}

}
