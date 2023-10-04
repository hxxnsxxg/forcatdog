package com.kh.forcatdog.member.model.vo;

import java.util.ArrayList;

public class License_Quiz {
	private int quiz_num;
	private int quiz_difficulty;
	private String quiz_category;
	private String quiz_content;
	private String quiz_choice;

	private ArrayList<License_Quiz_Ans> cList;
	
	public License_Quiz() {}

	public License_Quiz(int quiz_num, int quiz_difficulty, String quiz_category, String quiz_content,
			String quiz_choice, ArrayList<License_Quiz_Ans> cList) {
		super();
		this.quiz_num = quiz_num;
		this.quiz_difficulty = quiz_difficulty;
		this.quiz_category = quiz_category;
		this.quiz_content = quiz_content;
		this.quiz_choice = quiz_choice;
		this.cList = cList;
	}

	public int getQuiz_num() {
		return quiz_num;
	}

	public void setQuiz_num(int quiz_num) {
		this.quiz_num = quiz_num;
	}

	public int getQuiz_difficulty() {
		return quiz_difficulty;
	}

	public void setQuiz_difficulty(int quiz_difficulty) {
		this.quiz_difficulty = quiz_difficulty;
	}

	public String getQuiz_category() {
		return quiz_category;
	}

	public void setQuiz_category(String quiz_category) {
		this.quiz_category = quiz_category;
	}

	public String getQuiz_content() {
		return quiz_content;
	}

	public void setQuiz_content(String quiz_content) {
		this.quiz_content = quiz_content;
	}

	public String getQuiz_choice() {
		return quiz_choice;
	}

	public void setQuiz_choice(String quiz_choice) {
		this.quiz_choice = quiz_choice;
	}

	public ArrayList<License_Quiz_Ans> getcList() {
		return cList;
	}

	public void setcList(ArrayList<License_Quiz_Ans> cList) {
		this.cList = cList;
	}

	@Override
	public String toString() {
		return "License_Quiz [quiz_num=" + quiz_num + ", quiz_difficulty=" + quiz_difficulty + ", quiz_category="
				+ quiz_category + ", quiz_content=" + quiz_content + ", quiz_choice=" + quiz_choice + ", cList=" + cList
				+ "]";
	}

}

