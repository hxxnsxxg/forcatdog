package com.kh.forcatdog.member.model.vo;

public class MyPet {
	private int petNum;
	private String memberId;
	private String nickName;
	private String petName;
	private String petType1;
	private String petType2;
	private String gender;
	private double weight;
	private int birthYear;
	private String personality;
	private String inform;
	private String originFileName;
	private String changeFileName;
	
	public MyPet() {}

	public MyPet(int petNum, String memberId, String nickName, String petName, String petType1, String petType2,
			String gender, double weight, int birthYear, String personality, String inform, String originFileName,
			String changeFileName) {
		super();
		this.petNum = petNum;
		this.memberId = memberId;
		this.nickName = nickName;
		this.petName = petName;
		this.petType1 = petType1;
		this.petType2 = petType2;
		this.gender = gender;
		this.weight = weight;
		this.birthYear = birthYear;
		this.personality = personality;
		this.inform = inform;
		this.originFileName = originFileName;
		this.changeFileName = changeFileName;
	}

	public int getPetNum() {
		return petNum;
	}

	public void setPetNum(int petNum) {
		this.petNum = petNum;
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

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetType1() {
		return petType1;
	}

	public void setPetType1(String petType1) {
		this.petType1 = petType1;
	}

	public String getPetType2() {
		return petType2;
	}

	public void setPetType2(String petType2) {
		this.petType2 = petType2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public int getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
	}

	public String getInform() {
		return inform;
	}

	public void setInform(String inform) {
		this.inform = inform;
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
		return "MyPet [petNum=" + petNum + ", memberId=" + memberId + ", nickName=" + nickName + ", petName=" + petName
				+ ", petType1=" + petType1 + ", petType2=" + petType2 + ", gender=" + gender + ", weight=" + weight
				+ ", birthYear=" + birthYear + ", personality=" + personality + ", inform=" + inform
				+ ", originFileName=" + originFileName + ", changeFileName=" + changeFileName + "]";
	}
}
