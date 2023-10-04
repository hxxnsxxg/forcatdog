package com.kh.forcatdog.member.model.exception;

public class MemberException extends RuntimeException {
	private static final long serialVersionUID = -5843021918849213884L;
	
	public MemberException() {
	}
	
	public MemberException(String msg) {
		super(msg);
	}
	
}
