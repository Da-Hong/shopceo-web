package com.cn.lazypig.shopceo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.lazypig.shopceo.dao.AdToBizDao;
import com.cn.lazypig.shopceo.domain.AdToBizEntity;
import com.cn.lazypig.shopceo.service.AdToBizService;

@Service
public class AdToBizServiceImpl implements AdToBizService {

	@Resource
	private AdToBizDao adtobizDao;

	@Override
	public AdToBizEntity addAdToBiz(AdToBizEntity adb) {
		int pid = adtobizDao.selectAutoId();
		adb.setPid(pid);
		adb.setCodeurl("/bipic/" + pid + "/" + adb.getAdid() + "/" + adb.getBizid());
		if (adtobizDao.insert(adb) == 1) {
			return adb;
		}
		return null;
	}

	@Override
	public int removeAdToBizById(int id) {
		return adtobizDao.deleteByPrimaryKey(id);
	}

	@Override
	public int editAdToBiz(AdToBizEntity adb) {
		return adtobizDao.updateByPrimaryKey(adb);
	}

	@Override
	public List<AdToBizEntity> getAllAdToBiz() {
		return adtobizDao.selectSelectiveList(null);
	}

	@Override
	public List<AdToBizEntity> getAdToBizList(AdToBizEntity adb) {
		return adtobizDao.selectSelectiveList(adb);
	}

}
