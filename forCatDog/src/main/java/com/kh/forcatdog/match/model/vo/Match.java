package com.kh.forcatdog.match.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.forcatdog.member.model.vo.MyPet;

public class Match {
	private int matchNum;
	private String memberId;
	private String nickName;
	private int matchCate;
	private String matchTitle;
	private String matchContent;
	private Date matchDate;
	private String status;
	private String matchStatus;
	
	private String addr1;
	private String addr2;
	private String addr3;
	
	private ArrayList<MyPet> petList;
	private ArrayList<MatchMember> mList;
	
	public Match() {}

	public Match(int matchNum, String memberId, String nickName, int matchCate, String matchTitle, String matchContent,
			Date matchDate, String status, String matchStatus, String addr1, String addr2, String addr3,
			ArrayList<MyPet> petList, ArrayList<MatchMember> mList) {
		super();
		this.matchNum = matchNum;
		this.memberId = memberId;
		this.nickName = nickName;
		this.matchCate = matchCate;
		this.matchTitle = matchTitle;
		this.matchContent = matchContent;
		this.matchDate = matchDate;
		this.status = status;
		this.matchStatus = matchStatus;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.petList = petList;
		this.mList = mList;
	}

	public int getMatchNum() {
		return matchNum;
	}

	public void setMatchNum(int matchNum) {
		this.matchNum = matchNum;
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

	public int getMatchCate() {
		return matchCate;
	}

	public void setMatchCate(int matchCate) {
		this.matchCate = matchCate;
	}

	public String getMatchTitle() {
		return matchTitle;
	}

	public void setMatchTitle(String matchTitle) {
		this.matchTitle = matchTitle;
	}

	public String getMatchContent() {
		return matchContent;
	}

	public void setMatchContent(String matchContent) {
		this.matchContent = matchContent;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMatchStatus() {
		return matchStatus;
	}

	public void setMatchStatus(String matchStatus) {
		this.matchStatus = matchStatus;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public ArrayList<MyPet> getPetList() {
		return petList;
	}

	public void setPetList(ArrayList<MyPet> petList) {
		this.petList = petList;
	}

	public ArrayList<MatchMember> getmList() {
		return mList;
	}

	public void setmList(ArrayList<MatchMember> mList) {
		this.mList = mList;
	}

	@Override
	public String toString() {
		return "Match [matchNum=" + matchNum + ", memberId=" + memberId + ", nickName=" + nickName + ", matchCate="
				+ matchCate + ", matchTitle=" + matchTitle + ", matchContent=" + matchContent + ", matchDate="
				+ matchDate + ", status=" + status + ", matchStatus=" + matchStatus + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", addr3=" + addr3 + ", petList=" + petList + ", mList=" + mList + "]";
	}

}
