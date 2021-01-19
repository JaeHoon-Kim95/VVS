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

import com.vvs.shop.cart.CartDao;
import com.vvs.shop.cmn.SearchVO;
import com.vvs.shop.product.ProductDao;

@Transactional
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
public class CartProductTest {

	@Autowired CartDao cartDao;
	@Autowired ProductDao productDao;
	
	@Test
	public void Test() {
		
		SearchVO searchVO = new SearchVO();
		searchVO.setPageNum(1);
		searchVO.setPageSize(3);
		searchVO.setSearchWord("테스트임");
		searchVO.setMinPrice(1);
		searchVO.setMaxPrice(1250);
		
		productDao.doSelectListWithPaging(searchVO);
		
	}
	
}
