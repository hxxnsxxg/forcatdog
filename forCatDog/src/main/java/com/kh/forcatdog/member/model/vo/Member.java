package com.kh.forcatdog.member.model.vo;

import java.sql.Date;

public class Member {
	private String id;
	private String pw;
	private String gender;
	private String name;
	private String nickName;
	private String email;
	private String phone;
	private Date birth;
	private int pwHintNo;
	private String pwHintAns;
	private String adminQ;
	private String petQ;
	private String addr1;
	private String addr2;
	private String addr3;
	private Date enrollDate;
	private Date updateDate;
	private String status;
	private String originFileName;
	private String changeFileName;
	
	public Member() {
	}

	public Member(String id, String pw, String gender, String name, String nickName, String email, String phone,
			Date birth, int pwHintNo, String pwHintAns, String adminQ, String petQ, String addr1, String addr2,
			String addr3, Date enrollDate, Date updateDate, String status, String originFileName,
			String changeFileName) {
		super();
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.name = name;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.pwHintNo = pwHintNo;
		this.pwHintAns = pwHintAns;
		this.adminQ = adminQ;
		this.petQ = petQ;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.enrollDate = enrollDate;
		this.updateDate = updateDate;
		this.status = status;
		this.originFileName = originFileName;
		this.changeFileName = changeFileName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getPwHintNo() {
		return pwHintNo;
	}

	public void setPwHintNo(int pwHintNo) {
		this.pwHintNo = pwHintNo;
	}

	public String getPwHintAns() {
		return pwHintAns;
	}

	public void setPwHintAns(String pwHintAns) {
		this.pwHintAns = pwHintAns;
	}

	public String getAdminQ() {
		return adminQ;
	}

	public void setAdminQ(String adminQ) {
		this.adminQ = adminQ;
	}

	public String getPetQ() {
		return petQ;
	}

	public void setPetQ(String petQ) {
		this.petQ = petQ;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOriginFileName() {
		return originFileName;
	}

	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}

	public String getChangeFileName() {
		return changeFileName;
	}

	public void setChangeFileName(String changeFileName) {
		this.changeFileName = changeFileName;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", gender=" + gender + ", name=" + name + ", nickName=" + nickName
				+ ", email=" + email + ", phone=" + phone + ", birth=" + birth + ", pwHintNo=" + pwHintNo
				+ ", pwHintAns=" + pwHintAns + ", adminQ=" + adminQ + ", petQ=" + petQ + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", addr3=" + addr3 + ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + ", status="
				+ status + ", originFileName=" + originFileName + ", changeFileName=" + changeFileName + "]";
	}
}
