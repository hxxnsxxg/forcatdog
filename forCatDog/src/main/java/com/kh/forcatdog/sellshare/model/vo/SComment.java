package com.kh.forcatdog.sellshare.model.vo;

import java.sql.Timestamp;

public class SComment {
	private int c_num;
	private int c_Gnum;
	private int g_order;
	private int c_level;
	private int s_num;
	private String member_id;
	private String nickName;
	private String c_content;
	private String memberProfile;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private String status;
	
	public SComment() {}

	public SComment(int c_num, int c_Gnum, int g_order, int c_level, int s_num, String member_id, String nickName,
			String c_content, String memberProfile, Timestamp createDate, Timestamp modifyDate, String status) {
		super();
		this.c_num = c_num;
		this.c_Gnum = c_Gnum;
		this.g_order = g_order;
		this.c_level = c_level;
		this.s_num = s_num;
		this.member_id = member_id;
		this.nickName = nickName;
		this.c_content = c_content;
		this.memberProfile = memberProfile;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getC_Gnum() {
		return c_Gnum;
	}

	public void setC_Gnum(int c_Gnum) {
		this.c_Gnum = c_Gnum;
	}

	public int getG_order() {
		return g_order;
	}

	public void setG_order(int g_order) {
		this.g_order = g_order;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
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
		return "Comment [c_num=" + c_num + ", c_Gnum=" + c_Gnum + ", g_order=" + g_order + ", c_level=" + c_level
				+ ", s_num=" + s_num + ", member_id=" + member_id + ", nickName=" + nickName + ", c_content="
				+ c_content + ", memberProfile=" + memberProfile + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + ", status=" + status + "]";
	}
}
