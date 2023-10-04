package com.kh.forcatdog.member.model.vo;

public class License_Quiz_Ans {
	private int quiz_num;
	private String quiz_choice;
	private String ans_check;
	
	public License_Quiz_Ans() {}

	public License_Quiz_Ans(int quiz_num, String quiz_choice, String ans_check) {
		super();
		this.quiz_num = quiz_num;
		this.quiz_choice = quiz_choice;
		this.ans_check = ans_check;
	}

	public int getQuiz_num() {
		return quiz_num;
	}

	public void setQuiz_num(int quiz_num) {
		this.quiz_num = quiz_num;
	}

	public String getQuiz_choice() {
		return quiz_choice;
	}

	public void setQuiz_choice(String quiz_choice) {
		this.quiz_choice = quiz_choice;
	}

	public String getAns_check() {
		return ans_check;
	}

	public void setAns_check(String ans_check) {
		this.ans_check = ans_check;
	}

	@Override
	public String toString() {
		return "License_Quiz_Ans [quiz_num=" + quiz_num + ", quiz_choice=" + quiz_choice + ", ans_check=" + ans_check
				+ "]";
	}
}

