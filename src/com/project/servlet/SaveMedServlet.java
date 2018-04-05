package com.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.bean.MedicineBean;
import com.project.bean.StockoutDetalBean;
import com.project.service.IMedicineService;
import com.project.service.impl.MedicineServiceImpl;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SaveMedServlet
 * @author 赵子墨
 */
@WebServlet("/SaveMedServlet")
public class SaveMedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IMedicineService ms = new MedicineServiceImpl();
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
		String[] medIdArr = request.getParameter("arr").split(",");
		Set<Integer> set = new HashSet<Integer>();
		for (String string : medIdArr) {
			if("0".equals(string)){continue;}
			set.add(Integer.parseInt(string));
		}
		HttpSession session = request.getSession(false);
		List<StockoutDetalBean> sdtlList = new ArrayList<StockoutDetalBean>();
		List<MedicineBean> medList = new ArrayList<MedicineBean>();
		MedicineBean med = null;
		StockoutDetalBean sdtl = null;
		for (Integer integer : set) {
			med = ms.findMedById(integer);
			sdtl = new StockoutDetalBean();
			medList.add(med);
			sdtl.setSdtlMed(med);
			sdtlList.add(sdtl);
		}
		session.setAttribute("sdtlList", sdtlList);
		response.getWriter().println(JSONArray.fromObject(medList));
	}

}
