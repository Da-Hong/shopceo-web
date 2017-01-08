package com.cn.lazypig.shopceo.service;

import java.util.List;

import com.cn.lazypig.shopceo.domain.AdToBizEntity;

public interface AdToBizService {
	
	AdToBizEntity addAdToBiz(AdToBizEntity adb);

	int removeAdToBizById(int id);

	int editAdToBiz(AdToBizEntity adb);

	List<AdToBizEntity> getAllAdToBiz();
	
	List<AdToBizEntity> getAdToBizList(AdToBizEntity adb);
}
