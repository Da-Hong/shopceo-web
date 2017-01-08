package com.cn.lazypig.shopceo.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.cn.lazypig.shopceo.domain.Business;
import com.cn.lazypig.shopceo.service.BusinessService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class BusinessTest {
	
	private static Logger logger = Logger.getLogger(BusinessTest.class);
	
	@Resource
	private BusinessService businessService;
	
	@Test
    public void test1() {
		Business business = businessService.getBusinessById(1);
		logger.info(JSON.toJSONString(business));
	}

}
