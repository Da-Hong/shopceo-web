package com.cn.lazypig.shopceo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cn.lazypig.shopceo.domain.BusinessLogin;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		BusinessLogin user = (BusinessLogin) request.getSession().getAttribute("user");
		String path = request.getContextPath();
		if (StringUtils.isEmpty(user) || StringUtils.isEmpty(user.getPhone())) {
			response.sendRedirect(path + "/login.html");
			return false;
		}
		return true;
	}

}
