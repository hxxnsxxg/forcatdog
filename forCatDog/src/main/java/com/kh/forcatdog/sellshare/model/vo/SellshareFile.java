package com.kh.forcatdog.sellshare.model.vo;

public class SellshareFile {
	private int fileId;
	private int productNum;
	private String originalFileName;
	private String changeFileName;
	private String status;
	
	public SellshareFile() {}

	public SellshareFile(int fileId, int productNum, String originalFileName, String changeFileName, String status) {
		super();
		this.fileId = fileId;
		this.productNum = productNum;
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

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
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
		return "SellshareFile [fileId=" + fileId + ", productNum=" + productNum + ", originalFileName="
				+ originalFileName + ", changeFileName=" + changeFileName + ", status=" + status + "]";
	}
	
	
}
