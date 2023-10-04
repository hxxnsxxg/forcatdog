package com.kh.forcatdog.board.model.vo;

import java.sql.Timestamp;

public class BoardFile {
	private int fileId;
	private int boardNum;
	private String originalFileName;
	private String changeFileName;
	private Timestamp uploadDate;
	private int downCount;
	private String status;
	
	public BoardFile() {}

	public BoardFile(int fileId, int boardNum, String originalFileName, String changeFileName, Timestamp uploadDate,
			int downCount, String status) {
		super();
		this.fileId = fileId;
		this.boardNum = boardNum;
		this.originalFileName = originalFileName;
		this.changeFileName = changeFileName;
		this.uploadDate = uploadDate;
		this.downCount = downCount;
		this.status = status;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getChangeFileName() {
		return changeFileName;
	}

	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
	}

	public Timestamp getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Timestamp uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "BoardFile [fileId=" + fileId + ", boardNum=" + boardNum + ", originalFileName=" + originalFileName
				+ ", changeFileName=" + changeFileName + ", uploadDate=" + uploadDate + ", downCount=" + downCount
				+ ", status=" + status + "]";
	}
}
