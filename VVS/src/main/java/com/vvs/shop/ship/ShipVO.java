package com.vvs.shop.ship;

import com.vvs.shop.cmn.DTO;

public class ShipVO extends DTO {
	
	/** 주문번호*/
	private int orderNum;
	
	/** 배송비*/
	private int shipCost;
	
	/** 송장번호 */
	private String shipNum;
	
	/** 주문일 */
	private String shipDt;
	
	/** 제품번호 */
	private int productNum;
	
	/** 멤버아이디 */
	private String memberId;

	public ShipVO() {
		
	}
	
	public ShipVO(int orderNum, int shipCost, String shipNum, String shipDt, int productNum, String memberId) {
		super();
		this.orderNum = orderNum;
		this.shipCost = shipCost;
		this.shipNum = shipNum;
		this.shipDt = shipDt;
		this.productNum = productNum;
		this.memberId = memberId;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getShipCost() {
		return shipCost;
	}

	public void setShipCost(int shipCost) {
		this.shipCost = shipCost;
	}

	public String getShipNum() {
		return shipNum;
	}

	public void setShipNum(String shipNum) {
		this.shipNum = shipNum;
	}

	public String getShipDt() {
		return shipDt;
	}

	public void setShipDt(String shipDt) {
		this.shipDt = shipDt;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "ShipVO [orderNum=" + orderNum + ", shipCost=" + shipCost + ", shipNum=" + shipNum + ", shipDt=" + shipDt
				+ ", productNum=" + productNum + ", memberId=" + memberId + ", toString()=" + super.toString() + "]";
	}
	
}
