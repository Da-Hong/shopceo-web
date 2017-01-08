package com.cn.lazypig.shopceo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.lazypig.shopceo.dao.BusinessDao;
import com.cn.lazypig.shopceo.domain.Business;
import com.cn.lazypig.shopceo.service.BusinessService;

@Service
public class BusinessServiceImpl implements BusinessService {
	
	@Resource
	private BusinessDao businessDao;

	@Override
	public List<Business> getAllBusiness() {
		return this.getBusinessListByBusiness(null);
	}

	@Override
	public List<Business> getBusinessListByBusiness(Business business) {
		return this.businessDao.selectSelectiveList(business);
	}

	@Override
	public Business getBusinessById(int id) {
		return this.businessDao.selectByPrimaryKey(id);
	}

	@Override
	public int addBusinessSelective(Business business) {
		return this.businessDao.insertSelective(business);
	}

	@Override
	public int editBusinessSelective(Business business) {
		return this.businessDao.updateByPrimaryKeySelective(business);
	}

	@Override
	public int removeBusinessById(int id) {
		return this.businessDao.deleteByPrimaryKey(id);
	}

}
