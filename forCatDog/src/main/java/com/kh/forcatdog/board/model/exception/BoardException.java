package com.kh.forcatdog.board.model.exception;

public class BoardException extends RuntimeException {
	private static final long serialVersionUID = -7894642042295848296L;
	
	public BoardException() {}
	
	public BoardException(String msg) {
		super(msg);
	}

}
