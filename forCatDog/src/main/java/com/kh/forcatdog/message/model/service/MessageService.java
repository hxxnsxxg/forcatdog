package com.kh.forcatdog.message.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.message.model.vo.Message;

public interface MessageService {
	
	int getMessageListCount(String loginId);

	List<Message> selectMessageList(String loginId, PageInfo pi);

	List<Member> searchUser(String keyword);

	int sendMessage(Message msg);

	int getUserListCount(String keyword);

	List<Member> searchUserList(String keyword, PageInfo pi);

	Message selectMessage(HashMap<String, Object> map);

	int deleteMessage(HashMap<String, Object> map);

	int nonReadMessageCount(Member m);


}
