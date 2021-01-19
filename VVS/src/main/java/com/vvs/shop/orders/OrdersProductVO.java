package com.vvs.shop.orders;

import com.vvs.shop.cmn.DTO;

public class OrdersProductVO extends DTO{
	/** 제품이름 */
	private String productName;

	/** 주문 번호 */
	private int orderNum;

	/** 가격 */
	private int price;

	/** 주문날짜 */
	private String orderDt;

	/** 수량 */
	private int qty;
	
	/** 주문상태 */
	private String orderSt;
	
	public OrdersProductVO() {
		
	}

	public OrdersProductVO(String productName, int orderNum, int price, String orderDt, int qty, String orderSt) {
		super();
		this.productName = productName;
		this.orderNum = orderNum;
		this.price = price;
		this.orderDt = orderDt;
		this.qty = qty;
		this.orderSt = orderSt;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getOrderDt() {
		return orderDt;
	}

	public void setOrderDt(String orderDt) {
		this.orderDt = orderDt;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getOrderSt() {
		return orderSt;
	}

	public void setOrderSt(String orderSt) {
		this.orderSt = orderSt;
	}

	@Override
	public String toString() {
		return "OrdersProductVO [productName=" + productName + ", orderNum=" + orderNum + ", price=" + price
				+ ", orderDt=" + orderDt + ", qty=" + qty + ", orderSt=" + orderSt + ", toString()=" + super.toString()
				+ "]";
	}

}
