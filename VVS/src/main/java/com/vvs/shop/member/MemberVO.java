package com.vvs.shop.member;

public class MemberVO {

	private String memberId; //���� ���̵�
	private String memberPw; //���� ���
	private String name; //���� �̸�
	private String email; // �̸���
	private int phone; // �ڵ�� ��ȣ
	private int auth; //���� ��ȯ
	private String addrNum; //�����ȣ
	private String addrRoad; //���θ�
	private String addrDetail;
	
	public MemberVO() {
	}
	
	public MemberVO(String memberId, String memberPw, String name, String email, int phone, int auth, String addrNum,
			String addrRoad, String addrDetail) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
		this.addrNum = addrNum;
		this.addrRoad = addrRoad;
		this.addrDetail = addrDetail;
	}
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(String addrNum) {
		this.addrNum = addrNum;
	}

	public String getAddrRoad() {
		return addrRoad;
	}

	public void setAddrRoad(String addrRoad) {
		this.addrRoad = addrRoad;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", auth=" + auth + ", addrNum=" + addrNum + ", addrRoad=" + addrRoad
				+ ", addrDetail=" + addrDetail + ", toString()=" + super.toString() + "]";
	}

	
	
	
}
