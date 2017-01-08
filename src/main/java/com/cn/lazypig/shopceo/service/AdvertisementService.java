package com.cn.lazypig.shopceo.service;

import java.util.List;

import com.cn.lazypig.shopceo.domain.AdvertisementEntity;

public interface AdvertisementService {

	AdvertisementEntity addAdvertise(AdvertisementEntity adv);

	int removeAdvertiseById(int id);

	int editAdvertise(AdvertisementEntity adb);

	List<AdvertisementEntity> getAllAdvertise();
	
	List<AdvertisementEntity> getAdvertiseList(AdvertisementEntity adv);
}
