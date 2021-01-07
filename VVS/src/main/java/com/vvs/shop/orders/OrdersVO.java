package com.vvs.shop.orders;

public class OrdersVO {

	/** �ֹ���ȣ */
	private int orderNum;

	/** ���� ���̵� */
	private String memberId;

	/** ��ǰ��ȣ */
	private int productNum;

	/** ���� */
	private int qty;

	public OrdersVO() {

	}

	public OrdersVO(int orderNum, String memberId, int productNum, int qty) {
		super();
		this.orderNum = orderNum;
		this.memberId = memberId;
		this.productNum = productNum;
		this.qty = qty;
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

	@Override
	public String toString() {
		return "OrdersVO [orderNum=" + orderNum + ", memberId=" + memberId + ", productNum=" + productNum + ", qty="
				+ qty + ", toString()=" + super.toString() + "]";
	}

}
