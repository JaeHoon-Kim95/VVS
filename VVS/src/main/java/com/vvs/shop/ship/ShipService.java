package com.vvs.shop.ship;

import java.util.List;

import com.vvs.shop.cmn.SearchVO;

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
	
	public List<ShipVO> doSelectList2(SearchVO search);
}
