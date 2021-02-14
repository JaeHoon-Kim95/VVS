package com.vvs.shop.file;

import org.springframework.stereotype.Component;

@Component
public class FileVO {
	private int seq; //순번
	
	private String vvsImg; 
	private String vvsThunImg; //썸네일
	
	
	public FileVO() {
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = 2;
	}
	
	public String getVvsImg() {
		return vvsImg;
	}
	public void setVvsImg(String vvsImg) {
		this.vvsImg = vvsImg;
	}
	
	public String getThunImg() {
		return vvsThunImg;
	}

	public void setVvsThunImg(String vvsThunImg) {
		this.vvsThunImg = vvsThunImg;
	}

	@Override
	public String toString() {
		return "FIleVO [seq=" + seq + ", vvsImg=" + vvsImg + ",toString()="
				+ super.toString() + "]";
	}
	
	
}
