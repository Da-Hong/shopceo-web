package com.cn.lazypig.shopceo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.lazypig.shopceo.domain.Business;
import com.cn.lazypig.shopceo.domain.BusinessLogin;
import com.cn.lazypig.shopceo.service.BusinessLoginService;
import com.cn.lazypig.shopceo.service.BusinessService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 商户管理控制器
 * 
 * @author MY
 *
 */
@Controller
@RequestMapping("/business")
public class BusinessController {
	
	private static Logger logger = Logger.getLogger(BusinessController.class);

	@Resource
	private BusinessService businessService;
	
	@Resource
	private BusinessLoginService businessLoginService;

	/**
	 * 查看商户详情信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/showBusinessDetail")
	public String showBusinessDetail(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		Business business = businessService.getBusinessById(id);
		model.addAttribute("business", business);
		return "business/showBusinessDetail";
	}
	
	/**
	 * 条件查询商户信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/showBusinesses")
	public String showBusinesses(Business reqBs, HttpServletRequest request, Model model) {
		// 默认分页参数
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
		List<Business> businesses = businessService.getBusinessListByBusiness(reqBs);
		//用PageInfo对结果进行包装
		PageInfo<Business> pageInfo = new PageInfo<Business>(businesses);
		// 分页结果
		model.addAttribute("page", pageInfo);
		model.addAttribute("pageUrl", "business/showBusinesses");
		// 查询条件
		model.addAttribute("searchbusinessform", reqBs);
		return "business/showBusinesses";
	}
	
	/**
	 * 条件分页查询商户信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/showPageBusinesses")
	public String showPageBusinesses(Business reqBs, Model model) {
		List<Business> businesses = businessService.getBusinessListByBusiness(reqBs);
		model.addAttribute("businesses", businesses);
		return "business/showAllBusinesses";
	}
	
	/**
	 * 跳转到商户新增页面
	 * @return
	 */
	@RequestMapping("/toAddBusiness")
	public String toAddBusiness() {
		return "business/addBusiness";
	}
	
	/**
	 * 添加商户信息
	 * @param business
	 * @return
	 */
	@RequestMapping("/addBusiness")
	@ResponseBody
	public Map<String, Object> addBusiness(Business business) {
		logger.info(business.getBusinessId()+" "+business.getName());
		int result = businessService.addBusinessSelective(business);
		BusinessLogin record = new BusinessLogin();
		record.setBusinessid(business.getBusinessId());
		record.setEmail(business.getEmail());
		// 手机号必填，密码默认为手机号后六位
		String phone = business.getPhone();
		if (!StringUtils.isEmpty(phone) && phone.length() == 11) {
			record.setPhone(phone);
			record.setPassword(phone.substring(5, 11));
		} else {
			result = 10010;
		}
		businessLoginService.addLogin(record);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	/**
	 * 返回商户编辑页面
	 * @return
	 */
	@RequestMapping("/toEditBusiness")
	public String toEditBusiness(Business reqBs, Model model) {
		logger.info(reqBs.getId());
		Business business = businessService.getBusinessById(reqBs.getId());
		model.addAttribute("business", business);
		return "business/editBusiness";
	}
	
	/**
	 * 修改商户信息
	 * @param business
	 * @return
	 */
	@RequestMapping("/editBusiness")
	@ResponseBody
	public Map<String, Object> editBusiness(Business business) {
		logger.info(business.getId()+" "+business.getBusinessId()+" "+business.getName());
		int result = businessService.editBusinessSelective(business);
		logger.info(result);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}
	
	/**
	 * 返回商户删除页面
	 * @return
	 */
	@RequestMapping("/toRemoveBusiness")
	public String toRemoveBusiness(Business reqBs, Model model) {
		logger.info(reqBs.getId());
		Business business = businessService.getBusinessById(reqBs.getId());
		model.addAttribute("business", business);
		return "business/removeBusiness";
	}
	
	/**
	 * 删除商户信息
	 * @param business
	 * @return
	 */
	@RequestMapping("/removeBusiness")
	@ResponseBody
	public Map<String, Object> removeBusiness(Business business) {
		logger.info(business.getId());
		int result = businessService.removeBusinessById(business.getId());
		logger.info(result);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}

}
