package com.kh.forcatdog.customerService.model.exception;

public class NoticeException extends RuntimeException {
	private static final long serialVersionUID = 1040192901109721600L;
	
	public NoticeException() {}
	public NoticeException(String msg) {
		super(msg);
	}
}
