package com.kh.forcatdog.message.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.message.model.dao.MessageDAO;
import com.kh.forcatdog.message.model.vo.Message;

@Service("msService")
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MessageDAO msDAO;
	
	@Override
	public int getMessageListCount(String loginId) {
		return msDAO.getMessageListCount(sqlSession, loginId);
	}

	@Override
	public List<Message> selectMessageList(String loginId, PageInfo pi) {
		return msDAO.selectMessageList(sqlSession, loginId, pi);
	}

	@Override
	public List<Member> searchUser(String keyword) {
		return msDAO.searchUser(sqlSession, keyword);
	}

	@Override
	public int sendMessage(Message msg) {
		return msDAO.sendMessage(sqlSession, msg);
	}

	@Override
	public int getUserListCount(String keyword) {
		return msDAO.getUserListCount(sqlSession, keyword);
	}

	@Override
	public List<Member> searchUserList(String keyword, PageInfo pi) {
		return msDAO.searchUserList(sqlSession, keyword, pi);
	}

	@Transactional
	@Override
	public Message selectMessage(HashMap<String, Object> map) {
		int result = msDAO.updateMessageStatus(sqlSession, map);
		
		Message ms = null;
		if(result > 0) {
			ms = msDAO.selectMessage(sqlSession, map);
		}
		return ms;
	}

	@Override
	public int deleteMessage(HashMap<String, Object> map) {
		return msDAO.deleteMessage(sqlSession, map);
	}

	@Override
	public int nonReadMessageCount(Member m) {
		return msDAO.selectNReadCount(sqlSession, m);
	}

	
}
