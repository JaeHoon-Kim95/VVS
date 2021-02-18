package com.vvs.shop.orders;

import java.util.List;

import com.vvs.shop.cmn.SearchVO;
import com.vvs.shop.product.OptionsVO;

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
	
	/**
	 * 주문 조회
	 * @param orderNum
	 * @return
	 */
	public OptionsVO doSelectOneOptions(OptionsVO optionsVO);

	public List<OrdersProductVO> doSelectList(int displayPost, int postNum,SearchVO search);
	
	public int totalCnt();
	
	public List<OrdersVO> doSelectList2(OrdersVO ordersVO);
	
}
