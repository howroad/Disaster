package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.MedicineBean;
import com.project.bean.UserBean;
import com.project.service.IMedicineService;
import com.project.service.IOperateLogService;
import com.project.service.impl.MedicineServiceImpl;
import com.project.service.impl.OperateLogServiceImpl;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class MedicineAddServlet
 */
@WebServlet("/MedicineAddServlet")
public class MedicineAddServlet extends HttpServlet {
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
		
		String medname = request.getParameter("medname");
		String meddis = request.getParameter("meddisaster");
		String medtype = request.getParameter("medtype");
		String meduse = request.getParameter("meduse");
		String mednumber = request.getParameter("mednumber");
		
		MedicineBean med = new MedicineBean();
		med.setMedName(medname);
		med.setMedDisaster(Integer.parseInt(meddis));
		med.setMedType(Integer.parseInt(medtype));
		med.setMedStock(Integer.parseInt(mednumber));
		med.setMedUse(meduse);
		
		PrintWriter out = response.getWriter();
		//添加日志
		boolean boo = imds.addMedicine(med);
		if(boo) {
			IOperateLogService iols = new OperateLogServiceImpl();
			UserBean user = (UserBean) request.getSession().getAttribute("user");
			iols.addOperateLog(user,"添加了药品:"+medname);
		}
		JSONObject json = new JSONObject(boo);
		out.println(json);
		
		
	}

}
