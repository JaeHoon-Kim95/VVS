package com.vvs.shop.orders;

import com.vvs.shop.cmn.DTO;

public class OrdersVO extends DTO {

	/** 주문번호 */
	private int orderNum;

	/** 계정 아이디 */
	private String memberId;

	/** 제품 번호 */
	private int productNum;

	/** 수량 */
	private int qty;

	/** 주문날짜 */
	private String orderDt;
	
	/** 주문상태 */
	private String orderSt;
	
	public OrdersVO() {

	}

	public OrdersVO(int orderNum, String memberId, int productNum, int qty, String orderDt, String orderSt) {
		super();
		this.orderNum = orderNum;
		this.memberId = memberId;
		this.productNum = productNum;
		this.qty = qty;
		this.orderDt = orderDt;
		this.orderSt = orderSt;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getOrderDt() {
		return orderDt;
	}

	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}

	public String getOrderSt() {
		return orderSt;
	}

	public void setOrderSt(String orderSt) {
		this.orderSt = orderSt;
	}

	@Override
	public String toString() {
		return "OrdersVO [orderNum=" + orderNum + ", memberId=" + memberId + ", productNum=" + productNum + ", qty="
				+ qty + ", orderDt=" + orderDt + ", orderSt=" + orderSt + ", toString()=" + super.toString() + "]";
	}

	
}
