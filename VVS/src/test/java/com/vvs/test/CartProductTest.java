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
import com.vvs.shop.cart.CartVO;
import com.vvs.shop.product.ProductDao;
import com.vvs.shop.product.ProductVO;

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
		
		ProductVO productVO = new ProductVO();
		
		productVO.setCategoryNum(1);
		productVO.setDiscount(1);
		productVO.setDiscountPrice(1);
		productVO.setDiscountRate(12);
		productVO.setPrice(1);
		productVO.setProductName("Test");
		productVO.setProductNum(1);
		productVO.setRegDt("12/12");
		
		productDao.doInsert(productVO);
		
		productVO.setProductName("Test_Modify");
		
		productDao.doUpdate(productVO);
		productDao.doSelectOne(productVO);
		productDao.doSelectList(productVO);
		productDao.doDelete(productVO);
		productDao.doSelectList(productVO);
		
		productDao.doInsert(productVO);
		
		CartVO cartVO = new CartVO();
		
		cartVO.setMemberId("TestCart");
		cartVO.setProductNum(1);
		cartVO.setQty(1);
		cartVO.setSeq(1);
		
		cartDao.doInsert(cartVO);
		
		cartVO.setQty(2);
		
		cartDao.doUpdate(cartVO);
		cartDao.doSelectOne(cartVO);
		cartDao.doSelectList(cartVO);
		cartDao.doDelete(cartVO);
		cartDao.doSelectList(cartVO);
		
	}
	
}
