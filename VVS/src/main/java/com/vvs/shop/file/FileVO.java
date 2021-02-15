package com.vvs.shop.file;

import org.springframework.stereotype.Component;

@Component
public class FileVO {

	
	private String img; 
	private String thunImg; //썸네일
	private int productNum;
	
	
	public FileVO() {
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getThunImg() {
		return thunImg;
	}
	
	public void setThunImg(String thunImg) {
		this.thunImg = thunImg;
	}
}
