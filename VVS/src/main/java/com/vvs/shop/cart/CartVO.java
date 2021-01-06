package com.vvs.shop.cart;

import org.springframework.stereotype.Component;

@Component
public class CartVO {

	private int seq;
	private String memberId;
	private int productNum;
	private int Qty;

	public CartVO() {
		super();
	}

	public CartVO(int seq, String memberId, int productNum, int qty) {
		super();
		this.seq = seq;
		this.memberId = memberId;
		this.productNum = productNum;
		Qty = qty;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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
		return Qty;
	}

	public void setQty(int qty) {
		Qty = qty;
	}

	@Override
	public String toString() {
		return "CartVO [seq=" + seq + ", memberId=" + memberId + ", productNum=" + productNum + ", Qty=" + Qty + "]";
	}

}
