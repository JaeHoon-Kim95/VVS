package com.vvs.shop.cart;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class CartVO {

	private int seq;
	private String memberId;
	private int productNum;
	private int qty;
	private int optionSeq;
	private String color;
	private String sizes;
	private int price;

	List<CartVO> cartList;

	public CartVO() {
		super();
	}

	public CartVO(int seq, String memberId, int productNum, int qty, int optionSeq, String color, String sizes) {
		super();
		this.seq = seq;
		this.memberId = memberId;
		this.productNum = productNum;
		this.qty = qty;
		this.optionSeq = optionSeq;
		this.color = color;
		this.sizes = sizes;
	}

	public List<CartVO> getCartList() {
		return cartList;
	}

	public void setCartList(List<CartVO> cartList) {
		this.cartList = cartList;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getOptionSeq() {
		return optionSeq;
	}

	public void setOptionSeq(int optionSeq) {
		this.optionSeq = optionSeq;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSizes() {
		return sizes;
	}

	public void setSizes(String sizes) {
		this.sizes = sizes;
	}

	@Override
	public String toString() {
		return "CartVO [seq=" + seq + ", memberId=" + memberId + ", productNum=" + productNum + ", qty=" + qty
				+ ", optionSeq=" + optionSeq + ", color=" + color + ", sizes=" + sizes + ", price=" + price
				+ ", cartList=" + cartList + "]";
	}

}
