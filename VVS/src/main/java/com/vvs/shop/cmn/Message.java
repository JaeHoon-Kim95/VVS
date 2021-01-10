package com.vvs.shop.cmn;

public class Message extends DTO {
	/**
	 * �޽��� ID : 10
	 */
	private String regId;
	
	/**
	 * �޽��� ����: ��ϵǾ����ϴ�.
	 */
	private String msgContents;
	
	public Message() {
		
	}

	public Message(String regId, String msgContents) {
		super();
		this.regId = regId;
		this.msgContents = msgContents;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	@Override
	public String toString() {
		return "Message [regId=" + regId + ", msgContents=" + msgContents + ", toString()=" + super.toString() + "]";
	}
	
	
}
