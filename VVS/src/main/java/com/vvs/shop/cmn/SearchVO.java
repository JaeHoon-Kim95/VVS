package com.vvs.shop.cmn;

import org.springframework.stereotype.Component;

@Component
public class SearchVO {

	private int pageNum;
	private int pageSize;
	private String searchWord;
	private int div;
	private int minPrice;
	private int maxPrice;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getDiv() {
		return div;
	}

	public void setDiv(int div) {
		this.div = div;
	}

	public SearchVO() {
		super();
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	@Override
	public String toString() {
		return "SearchVO [pageNum=" + pageNum + ", pageSize=" + pageSize + ", searchWord=" + searchWord + ", div=" + div
				+ ", minPrice=" + minPrice + ", maxPrice=" + maxPrice + ", toString()=" + super.toString() + "]";
	}
	
}
