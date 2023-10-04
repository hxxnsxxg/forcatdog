package com.kh.forcatdog.customerService.model.vo;

import java.sql.Timestamp;

public class Notice {
	private int noticeNum;
	private String memberId;
	private String nickName;
	private String noticeTitle;
	private Timestamp createDate;
	private int noticeCount;
	private String noticeContent;
	private String status;
	
	public Notice() {}

	public Notice(int noticeNum, String memberId, String nickName, String noticeTitle, Timestamp createDate,
			int noticeCount, String noticeContent, String status) {
		super();
		this.noticeNum = noticeNum;
		this.memberId = memberId;
		this.nickName = nickName;
		this.noticeTitle = noticeTitle;
		this.createDate = createDate;
		this.noticeCount = noticeCount;
		this.noticeContent = noticeContent;
		this.status = status;
	}

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNum=" + noticeNum + ", memberId=" + memberId + ", nickName=" + nickName + ", noticeTitle="
				+ noticeTitle + ", createDate=" + createDate + ", noticeCount=" + noticeCount + ", noticeContent="
				+ noticeContent + ", status=" + status + "]";
	}

	
}
