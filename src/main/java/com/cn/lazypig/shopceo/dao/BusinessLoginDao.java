package com.cn.lazypig.shopceo.dao;

import com.cn.lazypig.shopceo.domain.BusinessLogin;

public interface BusinessLoginDao {

	int deleteByPrimaryKey(Integer pid);

	int insert(BusinessLogin record);

	int insertSelective(BusinessLogin record);

	BusinessLogin selectByPrimaryKey(Integer pid);

	BusinessLogin selectByBL(BusinessLogin record);

	int updateByPrimaryKeySelective(BusinessLogin record);

	int updateByPrimaryKey(BusinessLogin record);
}