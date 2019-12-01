package com.xafdy.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginIntecepter implements HandlerInterceptor {
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		//完成之后执行
		//System.out.println("完成之后执行： afterCompletion ");
	}
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		//处理完毕之后执行
		//System.out.println("处理完毕之后执行:  postHandle");
	}
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object obj) throws Exception {
		//处理之前执行 //1.判断session里有没有保存用户  2.判断uri路径
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		HttpSession session=request.getSession();
		Object object = (Object)session.getAttribute("user");
		String uri=request.getRequestURI();
		if (uri.endsWith("logon.html")||uri.endsWith("userLogon") || uri.endsWith("logon") || uri.endsWith("register.html") ||
				uri.endsWith("addStudent.html")  ||	uri.endsWith("userLogon.html")  || uri.endsWith("css") || uri.endsWith("js")) {
			//访问登录页面时，直接访问
			return true; 
		}else if (object!=null) {
			//用户已经登录了，session中有用户的信息，可以访问系统资源
			return true;
		}else {
			//其他情况，不允许访问下的内容  跳转到登录页面
			response.sendRedirect(request.getContextPath()+"/logon.html");
		}
		return false;
	}

}
