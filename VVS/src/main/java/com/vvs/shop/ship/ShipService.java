package com.vvs.shop.ship;

import java.util.List;

public interface ShipService {
	
	/**
	 * 
	 */
	public int doInsert(ShipVO shipVO);
	
	/**
	 * 배송취소
	 */
	public int doDelete(ShipVO shipVO);
	
	public int doUpdate(ShipVO shipVO);
	
	/**
	 * 배송 단건조회
	 */
	public ShipVO doSelectOne(ShipVO shipVO);
	
	/**
	 * 배송 전체조회
	 */
	public List<ShipVO> doSelectList(ShipVO shipVO);
}
