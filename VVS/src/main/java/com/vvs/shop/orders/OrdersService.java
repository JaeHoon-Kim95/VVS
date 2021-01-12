package com.vvs.shop.orders;

import java.util.List;

public interface OrdersService {

	/**
	 * 주문하기
	 */
	public int doInsert(OrdersVO ordersVO);
	
	/**
	 * 주문삭제
	 */
	public int doDelete(OrdersVO ordersVO);
	
	/**
	 * 주문 수정
	 */
	public int doUpdate(OrdersVO ordersVO);
	
	/**
	 * 주문 단건조회
	 */
	public OrdersVO doSelectOne(OrdersVO ordersVO);
	
	/**
	 * 주문 전체조회
	 */
	public List<OrdersVO> doSelectList(OrdersVO ordersVO);
	
}
