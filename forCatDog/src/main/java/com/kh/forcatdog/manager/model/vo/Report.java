package com.kh.forcatdog.manager.model.vo;

import java.sql.Date;

public class Report {
	private int reportNum;
	private String memberId; // 신고한사람
	private String memberNick;
	private String suspect; // 신고당한사람
	private String suspectNick;
	private String reportCate;
	private String content;
	private Date date;
	private String path;
	private String name;
	private String phone;
	private String email;
	private Date enrollDate;
	private String mStatus;
	
	public Report() {}

	public Report(int reportNum, String memberId, String memberNick, String suspect, String suspectNick,
			String reportCate, String content, Date date, String path, String name, String phone, String email,
			Date enrollDate, String mStatus) {
		super();
		this.reportNum = reportNum;
		this.memberId = memberId;
		this.memberNick = memberNick;
		this.suspect = suspect;
		this.suspectNick = suspectNick;
		this.reportCate = reportCate;
		this.content = content;
		this.date = date;
		this.path = path;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.mStatus = mStatus;
	}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getSuspect() {
		return suspect;
	}

	public void setSuspect(String suspect) {
		this.suspect = suspect;
	}

	public String getSuspectNick() {
		return suspectNick;
	}

	public void setSuspectNick(String suspectNick) {
		this.suspectNick = suspectNick;
	}

	public String getReportCate() {
		return reportCate;
	}

	public void setReportCate(String reportCate) {
		this.reportCate = reportCate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Report [reportNum=" + reportNum + ", memberId=" + memberId + ", memberNick=" + memberNick + ", suspect="
				+ suspect + ", suspectNick=" + suspectNick + ", reportCate=" + reportCate + ", content=" + content
				+ ", date=" + date + ", path=" + path + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", enrollDate=" + enrollDate + ", mStatus=" + mStatus + "]";
	}

	
}
