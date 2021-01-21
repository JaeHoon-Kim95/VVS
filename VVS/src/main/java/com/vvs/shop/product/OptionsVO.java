package com.vvs.shop.product;

import org.springframework.stereotype.Component;

@Component
public class OptionsVO {

	private String color;
	private String sizes;
	private int productNum;
	private int seq;
	private int qty;

	public OptionsVO() {
		super();
	}

	public OptionsVO(String color, String sizes, int productNum, int seq, int qty) {
		super();
		this.color = color;
		this.sizes = sizes;
		this.productNum = productNum;
		this.seq = seq;
		this.qty = qty;
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

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "OptionsVO [color=" + color + ", sizes=" + sizes + ", productNum=" + productNum + ", seq=" + seq
				+ ", qty=" + qty + "]";
	}

}
