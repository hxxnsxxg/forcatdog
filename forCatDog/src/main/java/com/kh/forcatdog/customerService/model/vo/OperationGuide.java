package com.kh.forcatdog.customerService.model.vo;

import java.sql.Timestamp;

public class OperationGuide {
	private int opNum;
	private String memberId;
	private String title;
	private String content;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private String status;
	
	public OperationGuide() {}

	public OperationGuide(int opNum, String memberId, String title, String content, Timestamp createDate,
			Timestamp modifyDate, String status) {
		super();
		this.opNum = opNum;
		this.memberId = memberId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getOpNum() {
		return opNum;
	}

	public void setOpNum(int opNum) {
		this.opNum = opNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OperationGuide [opNum=" + opNum + ", memberId=" + memberId + ", title=" + title + ", content=" + content
				+ ", status=" + status + "]";
	}
	
	
	
	
}
