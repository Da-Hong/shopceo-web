package com.cn.lazypig.shopceo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.lazypig.shopceo.dao.AdvertisementDao;
import com.cn.lazypig.shopceo.domain.AdvertisementEntity;
import com.cn.lazypig.shopceo.service.AdvertisementService;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {

	@Resource
	private AdvertisementDao advertisementDao;

	@Override
	public AdvertisementEntity addAdvertise(AdvertisementEntity adv) {
		int pid = advertisementDao.selectAutoId();
		adv.setPid(pid);
		adv.setAdtdurl("/bipic/" + pid);
		if (1 == advertisementDao.insert(adv)) {
			return adv;
		}
		return null;
	}

	@Override
	public int removeAdvertiseById(int id) {
		return advertisementDao.deleteByPrimaryKey(id);
	}

	@Override
	public int editAdvertise(AdvertisementEntity adb) {
		return advertisementDao.updateByPrimaryKeySelective(adb);
	}

	@Override
	public List<AdvertisementEntity> getAllAdvertise() {
		return advertisementDao.selectSelectiveList(null);
	}

	@Override
	public List<AdvertisementEntity> getAdvertiseList(AdvertisementEntity adv) {
		return advertisementDao.selectSelectiveList(adv);
	}

}
