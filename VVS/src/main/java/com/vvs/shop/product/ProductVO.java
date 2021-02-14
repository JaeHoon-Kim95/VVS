package com.vvs.shop.product;

import java.util.List;

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
	private String color;
	private String sizes;
	private int qty;
	private String categoryName;

	
	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	List<OptionsVO> optionsList;

	public List<OptionsVO> getOptionsList() {
		return optionsList;
	}

	public void setOptionsList(List<OptionsVO> optionsList) {
		this.optionsList = optionsList;
	}

	public ProductVO() {
		super();
	}

	public ProductVO(int productNum, int categoryNum, String productName, int discountRate, int discount, String regDt,
			int price, int discountPrice, String semiInfo, String mainInfo, String color, String sizes, int qty) {
		super();
		this.productNum = productNum;
		this.categoryNum = categoryNum;
		this.productName = productName;
		this.discountRate = discountRate;
		this.discount = discount;
		this.regDt = regDt;
		this.price = price;
		this.discountPrice = discountPrice;
		this.semiInfo = semiInfo;
		this.mainInfo = mainInfo;
		this.color = color;
		this.sizes = sizes;
		this.qty = qty;
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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "ProductVO [productNum=" + productNum + ", categoryNum=" + categoryNum + ", productName=" + productName
				+ ", discountRate=" + discountRate + ", discount=" + discount + ", regDt=" + regDt + ", price=" + price
				+ ", discountPrice=" + discountPrice + ", semiInfo=" + semiInfo + ", mainInfo=" + mainInfo + ", color="
				+ color + ", sizes=" + sizes + ", qty=" + qty + "]";
	}

}
