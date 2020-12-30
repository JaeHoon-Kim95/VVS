package com.vvs.shop;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {

	final static Logger LOG = LoggerFactory.getLogger(TestDao.class);
	
	@Autowired SqlSessionTemplate sqlSessionTemplate;
	@Autowired TestVO testVO;
	
	private final String NAMESPACE = "com.vvs.shop.";
	
	public int doInsertTest(TestVO testVO) {
		LOG.debug("Test Start!");
		LOG.debug("TestVO : " + testVO);
		String statement = NAMESPACE + "doTestInsert";
		
		int flag = sqlSessionTemplate.insert(statement, testVO);
		
		LOG.debug("Test End!");
		
		return flag;
		
	}
	
}
