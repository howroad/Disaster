package com.project.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.project.bean.UserBean;
import com.project.service.IOperateLogService;
import com.project.service.impl.OperateLogServiceImpl;
/**
 * 用于监听session销毁,即用户注销
 * @author howroad
 * @Date 2018年4月3日
 * @version 1.0
 */
@WebListener
public class SessionListener implements HttpSessionListener {
	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
	@Override
    public void sessionCreated(HttpSessionEvent se)  { 
    }
	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
	@Override
    public void sessionDestroyed(HttpSessionEvent se)  { 
		//添加日志
		IOperateLogService iols = new OperateLogServiceImpl();
		UserBean user = (UserBean) se.getSession().getAttribute("user");
		iols.addOperateLog(user,"退出了系统");
    }
}
