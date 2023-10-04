package com.kh.forcatdog.manager.model.exception;

public class ManagerException extends RuntimeException{
	private static final long serialVersionUID = -7894642042295848296L;
	
	public ManagerException() {}
	
	public ManagerException(String msg) {
		super(msg);
	}
}
