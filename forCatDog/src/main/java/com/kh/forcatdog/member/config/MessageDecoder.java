package com.kh.forcatdog.member.config;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;
import com.kh.forcatdog.member.model.vo.MatchChat;

public class MessageDecoder implements Decoder.Text<MatchChat> {

	@Override
	public void destroy() {
		
	}

	@Override
	public void init(EndpointConfig arg0) {
		
	}

	@Override
	public MatchChat decode(String message) throws DecodeException {
		return new Gson().fromJson(message, MatchChat.class);
	}

	@Override
	public boolean willDecode(String arg0) {
		return true;
	}



}
