package com.vvs.test;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.vvs.shop.TestDao;
import com.vvs.shop.TestVO;

@Transactional
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class SampleTest {

	@Autowired TestDao testDao;
	
	@Test
	public void Test() {
		TestVO testVO = new TestVO();
		testVO.setDivName("asd");
		testVO.setDivNum(1);
		
		testDao.doInsertTest(testVO);
		
	}
}
