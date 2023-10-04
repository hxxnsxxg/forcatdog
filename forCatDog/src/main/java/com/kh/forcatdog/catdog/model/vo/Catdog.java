package com.kh.forcatdog.catdog.model.vo;

import java.util.ArrayList;

public class Catdog {
	private int cd_num;
	private String cd_cate;
	private String cd_name;
	private String cd_lifespan;
	private String cd_birth;
	private String cd_weight;
	private String cd_personality;
	private String cd_explain;
	private String cd_status;
	
	private ArrayList<CatdogFile> fileList;
	
	public Catdog() {}

	public Catdog(int cd_num, String cd_cate, String cd_name, String cd_lifespan, String cd_birth, String cd_weight,
			String cd_personality, String cd_explain, String cd_status, ArrayList<CatdogFile> fileList) {
		super();
		this.cd_num = cd_num;
		this.cd_cate = cd_cate;
		this.cd_name = cd_name;
		this.cd_lifespan = cd_lifespan;
		this.cd_birth = cd_birth;
		this.cd_weight = cd_weight;
		this.cd_personality = cd_personality;
		this.cd_explain = cd_explain;
		this.cd_status = cd_status;
		this.fileList = fileList;
	}



	public int getCd_num() {
		return cd_num;
	}

	public void setCd_num(int cd_num) {
		this.cd_num = cd_num;
	}

	public String getCd_cate() {
		return cd_cate;
	}

	public void setCd_cate(String cd_cate) {
		this.cd_cate = cd_cate;
	}

	public String getCd_name() {
		return cd_name;
	}

	public void setCd_name(String cd_name) {
		this.cd_name = cd_name;
	}

	public String getCd_lifespan() {
		return cd_lifespan;
	}

	public void setCd_lifespan(String cd_lifespan) {
		this.cd_lifespan = cd_lifespan;
	}

	public String getCd_birth() {
		return cd_birth;
	}

	public void setCd_birth(String cd_birth) {
		this.cd_birth = cd_birth;
	}

	public String getCd_weight() {
		return cd_weight;
	}

	public void setCd_weight(String cd_weight) {
		this.cd_weight = cd_weight;
	}

	public String getCd_personality() {
		return cd_personality;
	}

	public void setCd_personality(String cd_personality) {
		this.cd_personality = cd_personality;
	}

	public String getCd_explain() {
		return cd_explain;
	}

	public void setCd_explain(String cd_explain) {
		this.cd_explain = cd_explain;
	}

	public String getCd_status() {
		return cd_status;
	}

	public void setCd_status(String cd_status) {
		this.cd_status = cd_status;
	}

	public ArrayList<CatdogFile> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<CatdogFile> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "Catdog [cd_num=" + cd_num + ", cd_cate=" + cd_cate + ", cd_name=" + cd_name + ", cd_lifespan="
				+ cd_lifespan + ", cd_birth=" + cd_birth + ", cd_weight=" + cd_weight + ", cd_personality="
				+ cd_personality + ", cd_explain=" + cd_explain + ", cd_status=" + cd_status + ", fileList=" + fileList
				+ "]";
	}
	
}