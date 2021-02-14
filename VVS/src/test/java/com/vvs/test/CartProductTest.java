package com.vvs.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.FixMethodOrder;
import org.junit.Ignore;
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
import com.vvs.shop.product.Category;
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
	public void Test2() {
		System.out.println(Category.아우터.getName());
		System.out.println(Category.아우터.getCategoryNum());
		System.out.println(Category.패딩.getName());
		System.out.println(Category.패딩.getCategoryNum());
		
		Category.values();
		
		System.out.println("향상된 for문");
		for(Category ca : Category.values()) {
			System.out.println(ca.getCategoryNum());
			System.out.println(ca.name());
		}
		
	}
	
	@Test
	@Ignore
	public void Test() {
		
		List<CartVO> inList = new ArrayList<CartVO>();
		
		CartVO cartVO1 = new CartVO();
		CartVO cartVO2 = new CartVO();
		CartVO cartVO3 = new CartVO();
		CartVO cartIn = new CartVO();
		
		cartVO1.setSeq(1);
		cartVO1.setQty(112);
		
		cartVO2.setSeq(2);
		cartVO2.setQty(145);
		
		cartVO3.setSeq(3);
		cartVO3.setQty(123);
		
		inList.add(cartVO1);
		inList.add(cartVO2);
		inList.add(cartVO3);
		
		cartIn.setCartList(inList);
		
		cartDao.doUpdateList(cartIn);
		
	}
	
	
	
}
