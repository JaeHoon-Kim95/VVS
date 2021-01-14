package com.vvs.shop.product;

import org.springframework.stereotype.Component;

@Component
public class ProductVO {

	private int productNum;
	private int categoryNum;
	private String productName;
	private int discountRate;
	private int discount;
	private String regDt;
	private int price;
	private int discountPrice;
	private String semiInfo;
	private String mainInfo;

	public ProductVO() {
		super();
	}

	public String getSemiInfo() {
		return semiInfo;
	}

	public void setSemiInfo(String semiInfo) {
		this.semiInfo = semiInfo;
	}

	public String getMainInfo() {
		return mainInfo;
	}

	public void setMainInfo(String mainInfo) {
		this.mainInfo = mainInfo;
	}

	public ProductVO(int productNum, int categoryNum, String productName, int discountRate, int discount, String regDt,
			int price, int discountPrice) {
		super();
		this.productNum = productNum;
		this.categoryNum = categoryNum;
		this.productName = productName;
		this.discountRate = discountRate;
		this.discount = discount;
		this.regDt = regDt;
		this.price = price;
		this.discountPrice = discountPrice;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	@Override
	public String toString() {
		return "ProductVO [productNum=" + productNum + ", categoryNum=" + categoryNum + ", productName=" + productName
				+ ", discountRate=" + discountRate + ", discount=" + discount + ", regDt=" + regDt + ", price=" + price
				+ ", discountPrice=" + discountPrice + "]";
	}

}
