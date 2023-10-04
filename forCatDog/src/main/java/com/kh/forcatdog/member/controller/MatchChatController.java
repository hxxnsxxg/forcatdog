package com.kh.forcatdog.member.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.forcatdog.match.model.service.MatchService;
import com.kh.forcatdog.member.config.GetHttpSessionConfig;
import com.kh.forcatdog.member.config.MessageDecoder;
import com.kh.forcatdog.member.config.MessageEncoder;
import com.kh.forcatdog.member.model.vo.MatchChat;
import com.kh.forcatdog.member.model.vo.Member;

@Component
@ServerEndpoint(value = "/matchChat.do/{matchNum}/{connId}", configurator = GetHttpSessionConfig.class, decoders = MessageDecoder.class, encoders = MessageEncoder.class)
public class MatchChatController {
	
	@Autowired
	private MatchService mcService;
	
	private static final Map<Integer, Map<String, Map<Member, Session>>> matchRoom = new ConcurrentHashMap<Integer, Map<String, Map<Member, Session>>>();

	@OnOpen
	public void onOpen(Session session, EndpointConfig config, @PathParam("matchNum") Integer matchNum) {
		HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		Member m = ((Member)httpSession.getAttribute("loginUser"));
		if(httpSession != null && matchNum != null) {
			Map<String, Map<Member, Session>> matchMap = null;
			Map<Member, Session> userMap = new HashMap<Member, Session>();
			if(!matchRoom.containsKey(matchNum)) {
				userMap.put(m, session);
				
				matchMap = new HashMap<String, Map<Member,Session>>();
				matchMap.put(m.getId(), userMap);
				matchRoom.put(matchNum, matchMap);
			} else {
				userMap.put(m, session);
				
				matchMap = matchRoom.get(matchNum);
				matchMap.put(m.getId(), userMap);
			}
		}
	}
	
	private Map<String, Map<Member, Session>> getRoom(Session session) {
		Map<String, List<String>> map = session.getRequestParameterMap();
		List<String> matchNumList = map.get("matchNum");
		int matchNum = Integer.parseInt(matchNumList.get(0));
		
		return matchRoom.get(matchNum);
	}
	
	@OnMessage
	public void onMessage(MatchChat mChat, Session session) {
		if(mChat.getAppend() == null) {
			Map<String, Map<Member, Session>> room = getRoom(session);
			
			if(mChat.getChatNum() == 0) {
				
				Map<Member, Session> memberSession = room.get(mChat.getSendId());
				
				Member m = memberSession.keySet().iterator().next();
				mChat.setSendId(m.getId());
				mChat.setSendNickName(m.getNickName());
				mChat.setChatDate(new Timestamp(new java.util.Date().getTime()));
				
				ArrayList<String> unReadId = new ArrayList<String>();
				unReadId.add(mChat.getReceiveId());
				
				mChat.setUnReadId(unReadId);
				
				saveMessageDB(mChat);
				
				try {
					final Basic basic = session.getBasicRemote();
					
					basic.sendObject(mChat);
					sendMessage(room, mChat);
				} catch (EncodeException e) {
					System.out.println(e.getMessage());
				}  catch (IOException e) {
					System.out.println(e.getMessage());
				}
			} else {
				ArrayList<MatchChat> list = readMessageDB(mChat);
				if(list != null) {
					ArrayList<Map<Member, Session>> roomMember = new ArrayList<Map<Member, Session>>(room.values());
					ArrayList<Session> memberSession = null;
					try {
						for(Map<Member, Session> mp : roomMember) {
							memberSession = new ArrayList<Session>(mp.values());
							memberSession.get(0).getBasicRemote().sendObject(list);
						}
					} catch (IOException e) {
						e.printStackTrace();
					} catch (EncodeException e) {
						e.printStackTrace();
					}
				}
			}
		} else if(mChat.getAppend().equals("f")) {
			ArrayList<MatchChat> list = selectAppendMessage(mChat);
			if(list != null && list.size() > 0) {
				try {
					session.getBasicRemote().sendObject(list);
				} catch (IOException e) {
					e.printStackTrace();
				} catch (EncodeException e) {
					e.printStackTrace();
				}
			}
		} else if(mChat.getAppend().equals("s")) {
			Map<String, Map<Member, Session>> room = getRoom(session);
			try {
				sendMatchSuccess(room);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (EncodeException e) {
				e.printStackTrace();
			}
		}
	}
	
	private ArrayList<MatchChat> selectAppendMessage(MatchChat mChat) {
		return (ArrayList<MatchChat>) mcService.selectAppendChatLog(mChat);
	}

	private ArrayList<MatchChat> readMessageDB(MatchChat mChat) {
		int result = mcService.readMessageDB(mChat);
		ArrayList<MatchChat> list = null;
		if(result > 0) {
			list = (ArrayList<MatchChat>) mcService.getUnReadCount(mChat);
		}
		return list;
	}

	private void sendMessage(Map<String, Map<Member, Session>> room, MatchChat mChat) throws IOException, EncodeException {
		String receiveUser = mChat.getReceiveId();
		if(room.containsKey(receiveUser)) {
			new ArrayList<Session>(room.get(receiveUser).values()).get(0).getBasicRemote().sendObject(mChat);
		}
	}
	
	private void sendMatchSuccess(Map<String, Map<Member, Session>> room) throws IOException, EncodeException {
		ArrayList<Map<Member, Session>> userList = new ArrayList<Map<Member, Session>>(room.values());
		for(Map<Member, Session> map : userList) {
			new ArrayList<Session>(map.values()).get(0).getBasicRemote().sendObject(-1);
		}
	}
	
	private void saveMessageDB(MatchChat mChat) {
		mChat.setChatNum(mcService.insertMatchMessage(mChat));
	}

	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println(e.getMessage());
	}

	@OnClose
    public void onClose(Session session) {
		Map<String, List<String>> map = session.getRequestParameterMap();
		List<String> matchNumList = map.get("matchNum");
		int matchNum = Integer.parseInt(matchNumList.get(0));
		List<String> connId = map.get("connId");
		Map<String, Map<Member, Session>> room = matchRoom.get(matchNum);
		room.remove(connId.get(0));
		
		if(room.size() <= 0) {
			matchRoom.remove(matchNum);
		}
		try {
			session.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
    }

}
