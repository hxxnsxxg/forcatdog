package com.kh.forcatdog.match.model.exception;

public class MatchException extends RuntimeException{
	private static final long serialVersionUID = -7894642042295848296L;
	
	public MatchException() {}
	
	public MatchException(String msg) {
		super(msg);
	}
}
