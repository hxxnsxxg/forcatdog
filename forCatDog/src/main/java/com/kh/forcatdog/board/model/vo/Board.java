package com.kh.forcatdog.board.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Board {
	private int boardNum;
	private int parentNum;
	private int groupOrd;
	private int boardLevel;
	private String memberId;
	private String nickName;
	private String memberProfile;
	private String boardTitle;
	private int views;
	private String boardContent;
	private Timestamp createDate;
	private Timestamp modifyDate;
	private String status;
	private int commentNum;
	private int fileNum;
	
	private ArrayList<BoardFile> fileList;
	
	public Board() {}

	public Board(int boardNum, int parentNum, int groupOrd, int boardLevel, String memberId, String nickName,
			String memberProfile, String boardTitle, int views, String boardContent, Timestamp createDate,
			Timestamp modifyDate, String status, int commentNum, int fileNum, ArrayList<BoardFile> fileList) {
		super();
		this.boardNum = boardNum;
		this.parentNum = parentNum;
		this.groupOrd = groupOrd;
		this.boardLevel = boardLevel;
		this.memberId = memberId;
		this.nickName = nickName;
		this.memberProfile = memberProfile;
		this.boardTitle = boardTitle;
		this.views = views;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.commentNum = commentNum;
		this.fileNum = fileNum;
		this.fileList = fileList;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public int getParentNum() {
		return parentNum;
	}

	public void setParentNum(int parentNum) {
		this.parentNum = parentNum;
	}

	public int getGroupOrd() {
		return groupOrd;
	}

	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}

	public int getBoardLevel() {
		return boardLevel;
	}

	public void setBoardLevel(int boardLevel) {
		this.boardLevel = boardLevel;
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

	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getFileNum() {
		return fileNum;
	}

	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}

	public ArrayList<BoardFile> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<BoardFile> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "Board [boardNum=" + boardNum + ", parentNum=" + parentNum + ", groupOrd=" + groupOrd + ", boardLevel="
				+ boardLevel + ", memberId=" + memberId + ", nickName=" + nickName + ", memberProfile=" + memberProfile
				+ ", boardTitle=" + boardTitle + ", views=" + views + ", boardContent=" + boardContent + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", commentNum=" + commentNum
				+ ", fileNum=" + fileNum + ", fileList=" + fileList + "]";
	}
}
