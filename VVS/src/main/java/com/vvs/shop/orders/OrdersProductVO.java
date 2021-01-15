package com.vvs.shop.orders;

import com.vvs.shop.cmn.DTO;

public class OrdersProductVO extends DTO{
	/** 제품이름 */
	private String productName;

	/** 제품 번호 */
	private int productNum;

	/** 가격 */
	private int price;

	/** 주문날짜 */
	private String orderDt;

	public OrdersProductVO() {
		
	}
	
	public OrdersProductVO(String productName, int productNum, int price, String orderDt) {
		super();
		this.productName = productName;
		this.productNum = productNum;
		this.price = price;
		this.orderDt = orderDt;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
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

	@Override
	public String toString() {
		return "OrdersProductVO [productName=" + productName + ", productNum=" + productNum + ", price=" + price
				+ ", orderDt=" + orderDt + ", toString()=" + super.toString() + "]";
	}
	
}
