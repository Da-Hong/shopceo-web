/**
 * 
 */
package com.cn.lazypig.shopceo.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.lazypig.shopceo.domain.BusinessLogin;
import com.cn.lazypig.shopceo.service.BusinessLoginService;

/**
 * @author liuhong
 * 
 */
@Controller
@RequestMapping("/")
public class BusinessLoginController {

	private static Logger logger = Logger.getLogger(BusinessLoginController.class);

	@Resource
	private BusinessLoginService loginService;

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String toLogin() {
		return "login";
	}

	@RequestMapping("/out")
	public String out(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login";
	}

	@RequestMapping("/doLogin")
	@ResponseBody
	public boolean doLogin(BusinessLogin user, HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.info("XXXXXXXXXXXXXXXXXXX-" + user.toString());
		HttpSession session = request.getSession();
		if (user.getRemember()) {
			response.addCookie(new Cookie("shopceo_phone", user.getPhone()));
		} else {
			response.addCookie(new Cookie("shopceo_phone", null));
		}
		BusinessLogin resultUser = loginService.getLoginByBL(user);
		if (resultUser != null) {
			// 登录成功，保存当前用户至session
			session.setAttribute("user", resultUser);
			return true;
		}
		return false;
	}

	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// 从session中获取当前用户
		BusinessLogin nowUser = (BusinessLogin) session.getAttribute("user");
		// 前台展示当前用户名
		String phone = nowUser.getPhone();
		model.addAttribute("nowuser", phone);
		if ("admin".equals(phone)) {
			return "index";
		} else {
			return "login/index";
		}
	}

}
