package com.cn.lazypig.shopceo.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.lazypig.shopceo.dao.BusinessLoginDao;
import com.cn.lazypig.shopceo.domain.BusinessLogin;
import com.cn.lazypig.shopceo.service.BusinessLoginService;

@Service
public class BusinessLoginServiceImpl implements BusinessLoginService {
	
	@Resource
	private BusinessLoginDao loginDao;

	@Override
	public boolean addLogin(BusinessLogin record) {
		return loginDao.insertSelective(record) == 1 ? true : false;
	}

	@Override
	public boolean editLogin(BusinessLogin record) {
		return loginDao.updateByPrimaryKey(record) == 1 ? true : false;
	}

	@Override
	public BusinessLogin getLoginByBL(BusinessLogin record) {
		return loginDao.selectByBL(record);
	}

}
