package com.cn.lazypig.shopceo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.lazypig.shopceo.domain.AdToBizEntity;
import com.cn.lazypig.shopceo.domain.BusinessLogin;
import com.cn.lazypig.shopceo.service.AdToBizService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/adtobiz")
public class AdToBizController {

	private static Logger logger = Logger.getLogger(AdToBizController.class);

	@Resource
	private AdToBizService adToBizService;

	@RequestMapping("/toHandle")
	public String toHandle(HttpServletRequest request, AdToBizEntity reqAtb, Model model) {
		int pageNo = 1;
		int pageSi = 10;
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		if (!StringUtils.isEmpty(pageNumber)) {
			pageNo = Integer.parseInt(pageNumber);
		}
		if (!StringUtils.isEmpty(pageSize)) {
			pageSi = Integer.parseInt(pageSize);
		}
		// 紧跟在这个方法后的第一个Mybatis查询方法会被进行分页
		PageHelper.startPage(pageNo, pageSi);
		List<AdToBizEntity> atbs = adToBizService.getAdToBizList(reqAtb);
		// 用PageInfo对结果进行包装
		PageInfo<AdToBizEntity> pageInfo = new PageInfo<AdToBizEntity>(atbs);
		// 分页结果
		model.addAttribute("page", pageInfo);
		model.addAttribute("pageUrl", "adtobiz/toHandle");
		// 查询条件
		model.addAttribute("searchatbform", reqAtb);
		return "adtobiz/toHandle";
	}
	
	@RequestMapping("/toUserHandle")
	public String toUserHandle(HttpServletRequest request, AdToBizEntity reqAtb, Model model) {
		int pageNo = 1;
		int pageSi = 10;
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		if (!StringUtils.isEmpty(pageNumber)) {
			pageNo = Integer.parseInt(pageNumber);
		}
		if (!StringUtils.isEmpty(pageSize)) {
			pageSi = Integer.parseInt(pageSize);
		}
		HttpSession session = request.getSession();
		// 从session中获取当前用户
		BusinessLogin nowUser = (BusinessLogin) session.getAttribute("user");
		reqAtb.setBizid(nowUser.getBusinessid());
		// 紧跟在这个方法后的第一个Mybatis查询方法会被进行分页
		PageHelper.startPage(pageNo, pageSi);
		List<AdToBizEntity> atbs = adToBizService.getAdToBizList(reqAtb);
		// 用PageInfo对结果进行包装
		PageInfo<AdToBizEntity> pageInfo = new PageInfo<AdToBizEntity>(atbs);
		// 分页结果
		model.addAttribute("page", pageInfo);
		model.addAttribute("pageUrl", "adtobiz/toUserHandle");
		// 查询条件
		model.addAttribute("searchatbform", reqAtb);
		return "adtobiz/toUserHandle";
	}
	
	@RequestMapping("/toAddHandle")
	public String toAddHandle() {
		return "adtobiz/toAddHandle";
	}
	
	@RequestMapping("/toUserAddHandle")
	public String toUserAddHandle(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// 从session中获取当前用户
		BusinessLogin nowUser = (BusinessLogin) session.getAttribute("user");
		String businessid = nowUser.getBusinessid();
		model.addAttribute("businessid", "admin".equals(businessid) ? "" : businessid);
		return "adtobiz/toUserAddHandle";
	}

	@ResponseBody
	@RequestMapping("/handle")
	public AdToBizEntity handle(AdToBizEntity atb) {
		return adToBizService.addAdToBiz(atb);
	}
	
	@ResponseBody
	@RequestMapping("/editHandle")
	public int editHandle(AdToBizEntity adb) {
		return adToBizService.editAdToBiz(adb);
	}

	@ResponseBody
	@RequestMapping("/removead2b")
	public int removead2b(@RequestParam("pid") int pid) {
		return adToBizService.removeAdToBizById(pid);
	}

}
