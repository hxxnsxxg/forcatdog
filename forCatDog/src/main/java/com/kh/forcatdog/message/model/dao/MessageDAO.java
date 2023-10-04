package com.kh.forcatdog.message.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.message.model.vo.Message;

@Repository("msDAO")
public class MessageDAO {
	
	public int getMessageListCount(SqlSessionTemplate sqlSession, String loginId) {
		return sqlSession.selectOne("messageMapper.getMessageListCount", loginId);
	}

	public List<Message> selectMessageList(SqlSessionTemplate sqlSession, String loginId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("messageMapper.selectMessageList", loginId, rowBounds);
	}

	public List<Member> searchUser(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectList("messageMapper.searchUser", keyword);
	}

	public int sendMessage(SqlSessionTemplate sqlSession, Message msg) {
		return sqlSession.insert("messageMapper.sendMessage", msg);
	}

	public int getUserListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("messageMapper.getUserListCount", keyword);
	}

	public List<Member> searchUserList(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("messageMapper.searchUserList", keyword, rowBounds);
	}

	public int updateMessageStatus(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("messageMapper.updateMessageStatus", map);
	}

	public Message selectMessage(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("messageMapper.selectMessage", map);
	}

	public int deleteMessage(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("messageMapper.deleteMessage", map);
	}

	public int selectNReadCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("messageMapper.selectNReadCount", m);
	}

}
