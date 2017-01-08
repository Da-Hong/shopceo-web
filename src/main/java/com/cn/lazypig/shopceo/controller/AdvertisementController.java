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

import com.cn.lazypig.shopceo.domain.AdvertisementEntity;
import com.cn.lazypig.shopceo.domain.BusinessLogin;
import com.cn.lazypig.shopceo.service.AdvertisementService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 商户管理控制器
 * 
 * @author MY
 *
 */
@Controller
@RequestMapping("/ad")
public class AdvertisementController {

	private static Logger logger = Logger.getLogger(AdvertisementController.class);

	@Resource
	private AdvertisementService advertisementService;

	/**
	 * 新增广告
	 */
	@ResponseBody
	@RequestMapping("/create")
	public AdvertisementEntity create(HttpServletRequest request, AdvertisementEntity adv) {
		if (adv.getOwnerid() == null) {
			adv.setOwnerid("-10086");// -10086 代表系统生成
		}
		return advertisementService.addAdvertise(adv);
	}
	
	@ResponseBody
	@RequestMapping("/edit")
	public int edit(HttpServletRequest request, AdvertisementEntity adv) {
		return advertisementService.editAdvertise(adv);
	}

	@ResponseBody
	@RequestMapping("/remove")
	public int remove(@RequestParam("pid") int id) {
		return advertisementService.removeAdvertiseById(id);
	}

	@RequestMapping("/toCreate")
	public String toCreate() {
		return "advertise/toCreate";
	}
	
	@RequestMapping("/toUserCreate")
	public String toUserCreate(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// 从session中获取当前用户
		BusinessLogin nowUser = (BusinessLogin) session.getAttribute("user");
		String businessid = nowUser.getBusinessid();
		model.addAttribute("businessid", "admin".equals(businessid) ? "" : businessid);
		return "advertise/toUserCreate";
	}

	@RequestMapping("/toQuery")
	public String toQuery(HttpServletRequest request, AdvertisementEntity reqAdv, Model model) {
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
//		if (StringUtils.isEmpty(reqAdv.getOwnerid())) {
//			HttpSession session = request.getSession();
//			// 从session中获取当前用户
//			BusinessLogin nowUser = (BusinessLogin) session.getAttribute("user");
//			reqAdv.setOwnerid(nowUser.getBusinessid());
//		}
		// 紧跟在这个方法后的第一个Mybatis查询方法会被进行分页
		PageHelper.startPage(pageNo, pageSi);
		List<AdvertisementEntity> advs = advertisementService.getAdvertiseList(reqAdv);
		// 用PageInfo对结果进行包装
		PageInfo<AdvertisementEntity> pageInfo = new PageInfo<AdvertisementEntity>(advs);
		// 分页结果
		model.addAttribute("page", pageInfo);
		model.addAttribute("pageUrl", "ad/toQuery");
		// 查询条件
		model.addAttribute("searchadform", reqAdv);
		return "advertise/toQuery";
	}
	
}
