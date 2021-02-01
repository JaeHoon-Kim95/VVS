package com.vvs.shop.board;

public class BoardVO {
	
	private int seq; //순번
	private String title; //제목
	private String contents; //내용
	private String regId; //등록자
	private String regDt; //등록일
	private String modId; //수정자
	private String modDt; //수정일
	private String childRep; //댓글
	
	
	public BoardVO() {
	}
	

	public BoardVO(int seq, String title, String contents, String regId, String regDt, String modId, String modDt,
			String childRep) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
		this.childRep = childRep;
	}
	
	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getChildRep() {
		return childRep;
	}

	public void setChildRep(String childRep) {
		this.childRep = childRep;
	}


	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", regId=" + regId + ", regDt="
				+ regDt + ", modId=" + modId + ", modDt=" + modDt + ", childRep=" + childRep + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
	

}
