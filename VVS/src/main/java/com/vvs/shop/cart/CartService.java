package com.vvs.shop.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	@Autowired CartDao cartDao;
	
	public int doInsert(CartVO cartVO) {
		return cartDao.doInsert(cartVO);
	}
	
	public int doDelete(CartVO cartVO) {
		return cartDao.doDelete(cartVO);
	}
	
	public int doUpdate(CartVO cartVO) {
		return cartDao.doUpdate(cartVO);
	}
	
	public CartVO doSelectOne(CartVO cartVO) {
		return cartDao.doSelectOne(cartVO);
	}
	
	public List<CartVO> doSelectList(CartVO cartVO) {
		return cartDao.doSelectList(cartVO);
	}
	
}
