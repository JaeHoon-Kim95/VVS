package com.vvs.shop.ship;

import java.util.List;

public interface ShipService {
	
	/**
	 * 
	 */
	public int doInsert(ShipVO shipVO);
	
	/**
	 * ������
	 */
	public int doDelete(ShipVO shipVO);
	
	public int doUpdate(ShipVO shipVO);
	
	/**
	 * ��� �ܰ���ȸ
	 */
	public ShipVO doSelectOne(ShipVO shipVO);
	
	/**
	 * ��� ��ü��ȸ
	 */
	public List<ShipVO> doSelectList(ShipVO shipVO);
}
