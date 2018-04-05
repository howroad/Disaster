package com.project.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckCodeAjaxServlet
 */
@WebServlet("/CheckCodeAjaxServlet")
public class CheckCodeAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCodeAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * AjaxRequest:code
	 * AjaxResponse:1/0
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//请求
		String code = request.getParameter("code");
		String rightCode = (String) request.getSession(false).getAttribute("code");
		//响应
		if(code==null||rightCode==null||!code.equalsIgnoreCase(rightCode)) {
			//验证失败
			response.getWriter().print(false);
		}else {
			//验证成功
			response.getWriter().print(true);
		}
	}
}
