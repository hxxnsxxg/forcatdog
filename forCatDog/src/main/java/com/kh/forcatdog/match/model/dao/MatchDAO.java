package com.kh.forcatdog.match.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.match.model.vo.MatchMember;
import com.kh.forcatdog.member.model.vo.MatchChat;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

@Repository("mcDAO")
public class MatchDAO {
	
	public List<Match> selectFindMatchList(SqlSessionTemplate sqlSession, int cate, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("matchMapper.selectFindMatchList", cate, rowBounds);
	}

	public int insertMatch(SqlSessionTemplate sqlSession, Match match) {
		return sqlSession.insert("matchMapper.insetMatch", match);
	}

	public int insertMatchPet(SqlSessionTemplate sqlSession, ArrayList<MyPet> petList) {
		return sqlSession.insert("matchMapper.insertMatchPet", petList);
	}

	public int getFindMatchListCount(SqlSessionTemplate sqlSession, int cate) {
		return sqlSession.selectOne("matchMapper.getFindMatchListCount", cate);
	}

	public Match selectMatchDetail(SqlSessionTemplate sqlSession, int mcNum) {
		return sqlSession.selectOne("matchMapper.selectMatchDetail", mcNum);
	}

	public int updateMatch(SqlSessionTemplate sqlSession, Match match) {
		return sqlSession.update("matchMapper.updateMatch", match);
	}

	public int deleteMatchPet(SqlSessionTemplate sqlSession, Match match) {
		return sqlSession.delete("matchMapper.deleteMatchPet", match);
	}

	public int updateMatchPet(SqlSessionTemplate sqlSession, Match match) {
		return sqlSession.delete("matchMapper.updateMatchPet", match);
	}

	public int deleteMatch(SqlSessionTemplate sqlSession, Match match) {
		return sqlSession.update("matchMapper.deleteMatch", match);
	}

	public int insertMatchMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("matchMapper.insertMatchMember", map);
	}
	
	public int insertMatchMemberPet(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("matchMapper.insertMatchMemberPet", map);
	}

	public int searchMatchMember(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("matchMapper.searchMatchMember", map);
	}

	public List<Match> selectPMatchList(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("matchMapper.selectPMatchList", m);
	}

	public List<MyPet> selectMatchInfo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("matchMapper.selectMatchInfo", map);
	}

	public List<MyPet> selectMatchPetList(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("matchMapper.selectMatchPetList", map);
	}

	public int acceptMatch(SqlSessionTemplate sqlSession, MatchMember mm) {
		return sqlSession.update("matchMapper.acceptMatch", mm);
	}

	public int rejectOtherMatch(SqlSessionTemplate sqlSession, MatchMember mm) {
		return sqlSession.update("matchMapper.rejectOtherMatch", mm);
	}

	public int rejectMatch(SqlSessionTemplate sqlSession, MatchMember mm) {
		return sqlSession.update("matchMapper.rejectMatch", mm);
	}

	public List<MatchChat> selectChatLog(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectList("matchMapper.selectChatLog", map);
	}

	public List<Match> selectRMatchList(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectList("matchMapper.selectRMatchList", m);
	}

	public int insertMatchMessage(SqlSessionTemplate sqlSession, MatchChat mChat) {
		return sqlSession.insert("matchMapper.insertMatchMessage", mChat);
	}

	public int selectMatchCount(SqlSessionTemplate sqlSession, int mcNum) {
		return sqlSession.selectOne("matchMapper.selectMatchCount", mcNum);
	}

	public int deleteMatchMember(SqlSessionTemplate sqlSession, Match match) {
		return sqlSession.update("matchMapper.deleteMatchMember", match);
	}

	public int selectMessageNum(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("matchMapper.selectMessageNum");
	}

	public int insertUnReadId(SqlSessionTemplate sqlSession, MatchChat mChat) {
		return sqlSession.insert("matchMapper.insertUnReadId", mChat);
	}

	public int deleteUnReadId(SqlSessionTemplate sqlSession, MatchChat mChat) {
		return sqlSession.delete("matchMapper.deleteUnReadId", mChat);
	}

	public List<MatchChat> getUnReadCount(SqlSessionTemplate sqlSession, MatchChat mChat) {
		return sqlSession.selectList("matchMapper.getUnReadCount", mChat);
	}

	public List<MatchChat> selectAppendChatLog(SqlSessionTemplate sqlSession, MatchChat mChat) {
		return sqlSession.selectList("matchMapper.selectAppendChatLog", mChat);
	}

	public List<Match> selectMainCoupleMatchList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("matchMapper.selectMainCoupleMatchList");
	}

	public List<Match> selectMainWalkMatchList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("matchMapper.selectMainWalkMatchList");
	}

	public int selectMatchYCount(SqlSessionTemplate sqlSession, int mcNum) {
		return sqlSession.selectOne("matchMapper.selectMatchYCount", mcNum);
	}
	
	public List<Match> selectMMatchList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("matchMapper.selectMMatchList", null, rowBounds);
	}

	public int getAllMatchListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("matchMapper.getAllMatchListCount");
	}

	public String selectMatchContent(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("matchMapper.selectMatchContent", map);
	}

	public int updateMatchMemberSuccess(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("matchMapper.updateMatchMemberSuccess", map);
	}

	public int updateMatchSuccess(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("matchMapper.updateMatchSuccess", map);
	}

	public int getInfoMatchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("matchMapper.getInfoMatchListCount", map);
	}

	public List<Match> selectInfoMatchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("matchMapper.selectInfoMatchList", map, rowBounds);
	}
}
