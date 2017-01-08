package com.cn.lazypig.shopceo.service;

import com.cn.lazypig.shopceo.domain.BusinessLogin;

public interface BusinessLoginService {
	
	boolean addLogin(BusinessLogin record);
	
	boolean editLogin(BusinessLogin record);
	
	BusinessLogin getLoginByBL(BusinessLogin record);

}
