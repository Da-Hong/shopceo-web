package com.cn.lazypig.shopceo.dao;

import java.util.List;

import com.cn.lazypig.shopceo.domain.AdToBizEntity;

public interface AdToBizDao {
    int deleteByPrimaryKey(Integer pid);

    int insert(AdToBizEntity record);

    int insertSelective(AdToBizEntity record);

    AdToBizEntity selectByPrimaryKey(Integer pid);
    
    List<AdToBizEntity> selectSelectiveList(AdToBizEntity atb);
    
    int selectAutoId();

    int updateByPrimaryKeySelective(AdToBizEntity record);

    int updateByPrimaryKey(AdToBizEntity record);
}