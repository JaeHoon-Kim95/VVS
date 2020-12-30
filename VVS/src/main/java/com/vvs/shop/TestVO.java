package com.vvs.shop;

import org.springframework.stereotype.Component;

@Component
public class TestVO {

	int divNum;
	String divName;

	public int getDivNum() {
		return divNum;
	}

	public void setDivNum(int divNum) {
		this.divNum = divNum;
	}

	public String getDivName() {
		return divName;
	}

	public void setDivName(String divName) {
		this.divName = divName;
	}

	@Override
	public String toString() {
		return "TestVO [divNum=" + divNum + ", divName=" + divName + "]";
	}

}
