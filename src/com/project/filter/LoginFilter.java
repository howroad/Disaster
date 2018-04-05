package com.project.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.bean.UserBean;

/**
 * 过滤器
 * @author howroad
 * @Date 2018年4月3日
 * @version 1.0
 */
public class LoginFilter implements Filter {
	private String charset=null;
	private String[] strArr ;
	/**
	 * @see Filter#destroy()
	 */
	@Override
	public void destroy() {
	}
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest)request;
		HttpServletResponse resp =(HttpServletResponse)response;
		//三件套
		req.setCharacterEncoding(charset);
		resp.setCharacterEncoding(charset);
		resp.setContentType("text/html;charset="+charset);
		//获得客户访问url
		String url=new String(req.getRequestURI());
		//判断该URL是否在这几个URL里面
		for (String string : strArr) {
			if(url.contains(string)){
				chain.doFilter(req, resp);
				return;
			}
		}
		//如果有session对象,且session中有user记录才可以登陆
		UserBean user =  (UserBean) req.getSession(false).getAttribute("user");
		if(req.getSession(false) != null && user != null) {
			//添加登陆记录
			chain.doFilter(req, resp);
		}else {
			resp.sendRedirect("/Disaster/html/login.html");
		}
	}
	/**
	 * 获得文件中的charset值，本项目为utf-8
	 */
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		charset=fConfig.getInitParameter("charset");
		strArr = fConfig.getInitParameter("nocheck").split(",");
	}
}
