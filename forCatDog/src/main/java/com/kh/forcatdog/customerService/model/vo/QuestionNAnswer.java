package com.kh.forcatdog.customerService.model.vo;

import java.sql.Timestamp;

public class QuestionNAnswer {
	private int qnaNum;
	private int qnaGroup;
	private int qnaOrder;
	private int qnaIndent;
	private String memberId;
	private String nickName;
	private String title;
	private Timestamp date;
	private String content;
	private String qnaReplyCheck; 
	private String status;
	
	public QuestionNAnswer() {}

	public QuestionNAnswer(int qnaNum, int qnaGroup, int qnaOrder, int qnaIndent, String memberId, String nickName,
			String title, Timestamp date, String content, String qnaReplyCheck, String status) {
		super();
		this.qnaNum = qnaNum;
		this.qnaGroup = qnaGroup;
		this.qnaOrder = qnaOrder;
		this.qnaIndent = qnaIndent;
		this.memberId = memberId;
		this.nickName = nickName;
		this.title = title;
		this.date = date;
		this.content = content;
		this.qnaReplyCheck = qnaReplyCheck;
		this.status = status;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public int getQnaGroup() {
		return qnaGroup;
	}

	public void setQnaGroup(int qnaGroup) {
		this.qnaGroup = qnaGroup;
	}

	public int getQnaOrder() {
		return qnaOrder;
	}

	public void setQnaOrder(int qnaOrder) {
		this.qnaOrder = qnaOrder;
	}

	public int getQnaIndent() {
		return qnaIndent;
	}

	public void setQnaIndent(int qnaIndent) {
		this.qnaIndent = qnaIndent;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getQnaReplyCheck() {
		return qnaReplyCheck;
	}

	public void setQnaReplyCheck(String qnaReplyCheck) {
		this.qnaReplyCheck = qnaReplyCheck;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "QuestionNAnswer [qnaNum=" + qnaNum + ", qnaGroup=" + qnaGroup + ", qnaOrder=" + qnaOrder
				+ ", qnaIndent=" + qnaIndent + ", memberId=" + memberId + ", nickName=" + nickName + ", title=" + title
				+ ", date=" + date + ", content=" + content + ", qnaReplyCheck=" + qnaReplyCheck + ", status=" + status
				+ "]";
	}
	
	
}
