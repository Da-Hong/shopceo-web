package com.cn.lazypig.shopceo.dao;

import java.util.List;

import com.cn.lazypig.shopceo.domain.Business;

public interface BusinessDao {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Business record);

    int insertSelective(Business record);

    Business selectByPrimaryKey(Integer id);
    
    List<Business> selectSelectiveList(Business record);

    int updateByPrimaryKeySelective(Business record);

    int updateByPrimaryKey(Business record);
    
}