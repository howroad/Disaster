package com.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.bean.StockoutDetalBean;

/**
 * Servlet implementation class UpdateSdtlServlet
 * @author 赵子墨
 */
@WebServlet("/UpdateSdtlServlet")
public class UpdateSdtlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		int id = Integer.parseInt(request.getParameter("id"));
		String count = request.getParameter("goodsCount");
		if(count==null||count.length()==0){
			return;
		}
		int goodsCount = Integer.parseInt(count);
		HttpSession session = request.getSession(false);
		List<StockoutDetalBean> sdtlList = (List<StockoutDetalBean>) session.getAttribute("sdtlList");
		for(StockoutDetalBean sdtl : sdtlList) {
			if(sdtl.getSdtlMed().getMedId() == id) {
				sdtl.setSdtlNum(goodsCount);
				break;
			}
		}
	}

}
