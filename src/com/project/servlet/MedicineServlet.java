package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.MedicineBean;
import com.project.bean.PageBean;
import com.project.service.IMedicineService;
import com.project.service.impl.MedicineServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class MedicineServlet
 */
@WebServlet("/MedicineServlet")
public class MedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IMedicineService imds = new MedicineServiceImpl();

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
		
		String pages =request.getParameter("page");
		String medname =request.getParameter("medName");
		String meddisaster =request.getParameter("meddis");
		String medtype =request.getParameter("medType");
		
		int meddis = Integer.parseInt(meddisaster);
		int pageNo = pages == null?1:Integer.parseInt(pages);
		int medtyp = Integer.parseInt(medtype);
		PageBean<MedicineBean> page = imds.findPageBean(pageNo, 5, medname, meddis, medtyp);
		
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		json = JSONObject.fromObject(page);
		out.println(json);
	}

}
