package com.cn.lazypig.shopceo.service;

import java.util.List;

import com.cn.lazypig.shopceo.domain.Business;

/**
 * @author MY
 *
 */
public interface BusinessService {
	
	public List<Business> getAllBusiness();
	
	public List<Business> getBusinessListByBusiness(Business business);
	
	public Business getBusinessById(int id);
	
	public int addBusinessSelective(Business business);
	
	public int editBusinessSelective(Business business);
	
	public int removeBusinessById(int id);

}
