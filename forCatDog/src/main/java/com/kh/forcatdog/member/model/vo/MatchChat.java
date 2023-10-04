package com.kh.forcatdog.member.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

public class MatchChat {
	private int matchNum;
	private String sendId;
	private String sendNickName;
	private String receiveId;
	private String receiveNickName;
	private String chatContent;
	private Timestamp chatDate;
	private int chatNum;
	private ArrayList<String> unReadId;
	private String append;
	
	public MatchChat() {}

	public MatchChat(int matchNum, String sendId, String sendNickName, String receiveId, String receiveNickName,
			String chatContent, Timestamp chatDate, int chatNum, ArrayList<String> unReadId, String append) {
		super();
		this.matchNum = matchNum;
		this.sendId = sendId;
		this.sendNickName = sendNickName;
		this.receiveId = receiveId;
		this.receiveNickName = receiveNickName;
		this.chatContent = chatContent;
		this.chatDate = chatDate;
		this.chatNum = chatNum;
		this.unReadId = unReadId;
		this.append = append;
	}

	public int getMatchNum() {
		return matchNum;
	}

	public void setMatchNum(int matchNum) {
		this.matchNum = matchNum;
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

	public String getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}

	public String getReceiveNickName() {
		return receiveNickName;
	}

	public void setReceiveNickName(String receiveNickName) {
		this.receiveNickName = receiveNickName;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public Timestamp getChatDate() {
		return chatDate;
	}

	public void setChatDate(Timestamp chatDate) {
		this.chatDate = chatDate;
	}

	public int getChatNum() {
		return chatNum;
	}

	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
	}

	public ArrayList<String> getUnReadId() {
		return unReadId;
	}

	public void setUnReadId(ArrayList<String> unReadId) {
		this.unReadId = unReadId;
	}

	public String getAppend() {
		return append;
	}

	public void setAppend(String append) {
		this.append = append;
	}

	@Override
	public String toString() {
		return "MatchChat [matchNum=" + matchNum + ", sendId=" + sendId + ", sendNickName=" + sendNickName
				+ ", receiveId=" + receiveId + ", receiveNickName=" + receiveNickName + ", chatContent=" + chatContent
				+ ", chatDate=" + chatDate + ", chatNum=" + chatNum + ", unReadId=" + unReadId + ", append=" + append
				+ "]";
	}
}
