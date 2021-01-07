package com.vvs.shop.orders;

import java.util.List;

public interface OrdersService {

	/**
	 * �ֹ��ϱ�
	 */
	public int doInsert(OrdersVO ordersVO);
	
	/**
	 * �ֹ�����
	 */
	public int doDelete(OrdersVO ordersVO);
	
	/**
	 * �ֹ� ����
	 */
	public int doUpdate(OrdersVO ordersVO);
	
	/**
	 * �ֹ� �ܰ���ȸ
	 */
	public OrdersVO doSelectOne(OrdersVO ordersVO);
	
	/**
	 * �ֹ� ��ü��ȸ
	 */
	public List<OrdersVO> doSelectList(OrdersVO ordersVO);
	
}
