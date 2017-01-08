package com.cn.lazypig.shopceo.dao;

import java.util.List;

import com.cn.lazypig.shopceo.domain.AdvertisementEntity;

public interface AdvertisementDao {
    int deleteByPrimaryKey(Integer pid);

    int insert(AdvertisementEntity record);

    int insertSelective(AdvertisementEntity record);

    AdvertisementEntity selectByPrimaryKey(Integer pid);
    
    List<AdvertisementEntity> selectSelectiveList(AdvertisementEntity ad);
    
    int selectAutoId();

    int updateByPrimaryKeySelective(AdvertisementEntity record);

    int updateByPrimaryKey(AdvertisementEntity record);
}