package com.vvs.shop.product;


public enum Category {
	
	아우터(1), 상의(2), 셔츠(3), 블라우스(4), 트레이닝(5), 하의(6), 후드(7), 니트(8);
	
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
