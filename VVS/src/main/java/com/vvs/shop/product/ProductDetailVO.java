package com.vvs.shop.product;

import org.springframework.stereotype.Component;

@Component
public class ProductDetailVO {

	private int productNum;
	private String semiInfo;
	private String mainInfo;

	public ProductDetailVO() {
		super();
	}

	public ProductDetailVO(int productNum, String semiInfo, String mainInfo) {
		super();
		this.productNum = productNum;
		this.semiInfo = semiInfo;
		this.mainInfo = mainInfo;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
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

	@Override
	public String toString() {
		return "ProductDetailVO [productNum=" + productNum + ", semiInfo=" + semiInfo + ", mainInfo=" + mainInfo + "]";
	}

}
