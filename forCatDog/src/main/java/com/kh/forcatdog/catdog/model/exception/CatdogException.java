package com.kh.forcatdog.catdog.model.exception;

public class CatdogException extends RuntimeException {
	private static final long serialVersionUID = -8131166625195994860L;
	
	public CatdogException() {}
	public CatdogException(String msg) {
		super(msg);
	}

}
