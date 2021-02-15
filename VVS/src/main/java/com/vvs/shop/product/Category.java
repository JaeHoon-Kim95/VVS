package com.vvs.shop.product;


public enum Category {
	
	아우터(1), 패딩(2);
	
	private int categoryNum;

	private Category(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	
	public String getName(){
		return this.name();
	}
	
	public int getCategoryNum() {
		return this.categoryNum;
	}
	
}
