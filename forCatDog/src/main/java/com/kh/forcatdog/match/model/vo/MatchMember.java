package com.kh.forcatdog.match.model.vo;

import java.sql.Date;

public class MatchMember {
	private int matchNum;
	private int matchCate;
	private String matchContent;
	private Date mDate;
	private String memberId;
	private String nickName;
	
	public MatchMember() {}

	public MatchMember(int matchNum, int matchCate, String matchContent, Date mDate, String memberId, String nickName) {
		super();
		this.matchNum = matchNum;
		this.matchCate = matchCate;
		this.matchContent = matchContent;
		this.mDate = mDate;
		this.memberId = memberId;
		this.nickName = nickName;
	}

	public int getMatchNum() {
		return matchNum;
	}

	public void setMatchNum(int matchNum) {
		this.matchNum = matchNum;
	}

	public int getMatchCate() {
		return matchCate;
	}

	public void setMatchCate(int matchCate) {
		this.matchCate = matchCate;
	}

	public String getMatchContent() {
		return matchContent;
	}

	public void setMatchContent(String matchContent) {
		this.matchContent = matchContent;
	}

	public Date getmDate() {
		return mDate;
	}

	public void setmDate(Date mDate) {
		this.mDate = mDate;
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

	@Override
	public String toString() {
		return "MatchMember [matchNum=" + matchNum + ", matchCate=" + matchCate + ", matchContent=" + matchContent
				+ ", mDate=" + mDate + ", memberId=" + memberId + ", nickName=" + nickName + "]";
	}

}
