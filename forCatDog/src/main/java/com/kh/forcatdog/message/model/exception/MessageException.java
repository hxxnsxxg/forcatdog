package com.kh.forcatdog.message.model.exception;

public class MessageException extends RuntimeException {
	private static final long serialVersionUID = 3969196283454266701L;
	
	public MessageException() {}
	
	public MessageException(String msg) {
		super(msg);
	}

}
