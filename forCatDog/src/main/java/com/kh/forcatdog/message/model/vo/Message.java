package com.kh.forcatdog.message.model.vo;

import java.sql.Timestamp;

public class Message {
	private int mNum;
	private String memberId;
	private String sendId;
	private String sendNickName;
	private String mContent;
	private Timestamp sendDate;
	private String status;
	
	public Message() {}

	public Message(int mNum, String memberId, String sendId, String sendNickName, String mContent, Timestamp sendDate,
			String status) {
		super();
		this.mNum = mNum;
		this.memberId = memberId;
		this.sendId = sendId;
		this.sendNickName = sendNickName;
		this.mContent = mContent;
		this.sendDate = sendDate;
		this.status = status;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getSendNickName() {
		return sendNickName;
	}

	public void setSendNickName(String sendNickName) {
		this.sendNickName = sendNickName;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public Timestamp getSendDate() {
		return sendDate;
	}

	public void setSendDate(Timestamp sendDate) {
		this.sendDate = sendDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Message [mNum=" + mNum + ", memberId=" + memberId + ", sendId=" + sendId + ", sendNickName="
				+ sendNickName + ", mContent=" + mContent + ", sendDate=" + sendDate + ", status=" + status + "]";
	}
}
