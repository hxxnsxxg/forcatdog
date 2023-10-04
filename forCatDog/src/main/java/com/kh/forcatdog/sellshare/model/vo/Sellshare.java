package com.kh.forcatdog.sellshare.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;


public class Sellshare {
	private int productNum;
	private String category;
	private String productName;
	private String pdContent;
	private String pdTitle;
	private String price;
	private Timestamp createDate;
	private int views;
	private String memberId;
	private String addr1;
	private String addr2;
	private String addr3;
	private String nickName;
	private String memberProfile;
	private String status;
	
	private ArrayList<SellshareFile> fileList;
	
	public Sellshare() {}

	public Sellshare(int productNum, String category, String productName, String pdContent, String pdTitle,
			String price, Timestamp createDate, int views, String memberId, String addr1, String addr2, String addr3,
			String nickName, String memberProfile, String status, ArrayList<SellshareFile> fileList) {
		super();
		this.productNum = productNum;
		this.category = category;
		this.productName = productName;
		this.pdContent = pdContent;
		this.pdTitle = pdTitle;
		this.price = price;
		this.createDate = createDate;
		this.views = views;
		this.memberId = memberId;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.nickName = nickName;
		this.memberProfile = memberProfile;
		this.status = status;
		this.fileList = fileList;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPdContent() {
		return pdContent;
	}

	public void setPdContent(String pdContent) {
		this.pdContent = pdContent;
	}

	public String getPdTitle() {
		return pdTitle;
	}

	public void setPdTitle(String pdTitle) {
		this.pdTitle = pdTitle;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ArrayList<SellshareFile> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<SellshareFile> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "Sellshare [productNum=" + productNum + ", category=" + category + ", productName=" + productName
				+ ", pdContent=" + pdContent + ", pdTitle=" + pdTitle + ", price=" + price + ", createDate="
				+ createDate + ", views=" + views + ", memberId=" + memberId + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", addr3=" + addr3 + ", nickName=" + nickName + ", memberProfile=" + memberProfile + ", status="
				+ status + ", fileList=" + fileList + "]";
	}
}
