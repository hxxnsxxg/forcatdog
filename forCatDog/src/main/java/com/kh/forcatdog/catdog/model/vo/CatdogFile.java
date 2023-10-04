package com.kh.forcatdog.catdog.model.vo;

public class CatdogFile {
	private int fileId;
	private int catdogNum;
	private String originalFileName;
	private String changeFileName;
	private String status;
	
	public CatdogFile() {}

	public CatdogFile(int fileId, int catdogNum, String originalFileName, String changeFileName, String status) {
		super();
		this.fileId = fileId;
		this.catdogNum = catdogNum;
		this.originalFileName = originalFileName;
		this.changeFileName = changeFileName;
		this.status = status;
	}

	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public int getCatdogNum() {
		return catdogNum;
	}

	public void setCatdogNum(int catdogNum) {
		this.catdogNum = catdogNum;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "CatdogFile [fileId=" + fileId + ", catdogNum=" + catdogNum + ", originalFileName=" + originalFileName
				+ ", changeFileName=" + changeFileName + ", status=" + status + "]";
	}

	
}
