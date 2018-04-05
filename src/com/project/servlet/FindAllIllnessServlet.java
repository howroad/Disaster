package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.IllnessBean;
import com.project.bean.PageBean;
import com.project.service.IIllnessService;
import com.project.service.impl.IllnessServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class FindAllIllnessServlet
 */
@WebServlet("/FindAllIllnessServlet")
public class FindAllIllnessServlet extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String pageNo = request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		String illName = request.getParameter("illName");
		String illStatus = request.getParameter("illStatus");
		int page = Integer.parseInt(pageNo);
		int size = Integer.parseInt(pageSize);
		illName = illName==null?"":illName;
		illStatus = illStatus==null?"":illStatus;
		PageBean<IllnessBean> bean = is.findPageBean(page, size, illName, illStatus);
		PrintWriter out = response.getWriter();
		JSONObject obj = JSONObject.fromObject(bean);
		out.println(obj);
	}

}
