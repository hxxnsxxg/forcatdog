package com.kh.forcatdog.match.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.match.model.dao.MatchDAO;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.match.model.vo.MatchMember;
import com.kh.forcatdog.member.model.vo.MatchChat;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

@Service("mcService")
public class MatchServiceImpl implements MatchService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MatchDAO mcDAO;

	@Override
	public List<Match> selectFindMatchList(int cate, PageInfo pi) {
		return mcDAO.selectFindMatchList(sqlSession, cate, pi);
	}

	@Transactional
	@Override
	public int insertMatch(Match match) {
		int result = mcDAO.insertMatch(sqlSession, match);
		result += mcDAO.insertMatchPet(sqlSession, match.getPetList());
		return result;
	}

	@Override
	public int getFindMatchListCount(int cate) {
		return mcDAO.getFindMatchListCount(sqlSession, cate);
	}

	@Override
	public Match selectMatchDetail(int mcNum) {
		return mcDAO.selectMatchDetail(sqlSession, mcNum);
	}

	@Override
	public Match selectUpdateMatch(int mcNum) {
		return mcDAO.selectMatchDetail(sqlSession, mcNum);
	}

	@Transactional
	@Override
	public int updateMatch(Match match) {
		int result = mcDAO.updateMatch(sqlSession, match);
		result += mcDAO.deleteMatchPet(sqlSession, match);
		result += mcDAO.updateMatchPet(sqlSession, match);
		return result;
	}

	@Transactional
	@Override
	public int deleteMatch(Match match) {
		int result = mcDAO.deleteMatch(sqlSession, match);
		result += mcDAO.deleteMatchMember(sqlSession, match);
		return result;
	}

	@Transactional
	@Override
	public int matchMember(HashMap<String, Object> map) {
		int result = mcDAO.insertMatchMember(sqlSession, map);
		
		if(map.get("petNum") != null) {
			result += mcDAO.insertMatchMemberPet(sqlSession, map);
		}
		
		return result;
	}

	@Override
	public int searchMatchMember(HashMap<String, Object> map) {
		return mcDAO.searchMatchMember(sqlSession, map);
	}

	@Override
	public List<Match> selectPMatchList(Member m) {
		return mcDAO.selectPMatchList(sqlSession, m);
	}

	@Override
	public List<MyPet> selectMatchInfo(HashMap<String, String> map) {
		return mcDAO.selectMatchInfo(sqlSession, map);
	}

	@Override
	public List<MyPet> selectMatchPetList(HashMap<String, Object> map) {
		return mcDAO.selectMatchPetList(sqlSession, map);
	}

	@Transactional
	@Override
	public int acceptMatch(MatchMember mm) {
		int result = mcDAO.acceptMatch(sqlSession, mm);
		result += mcDAO.rejectOtherMatch(sqlSession, mm);
		return result;
	}

	@Override
	public int rejectMatch(MatchMember mm) {
		return mcDAO.rejectMatch(sqlSession, mm);
	}

	@Override
	public List<MatchChat> selectChatLog(HashMap<String, Object> map) {
		return mcDAO.selectChatLog(sqlSession, map);
	}

	@Override
	public List<Match> selectRMatchList(Member m) {
		return mcDAO.selectRMatchList(sqlSession, m);
	}

	@Transactional
	@Override
	public int insertMatchMessage(MatchChat mChat) {
		int result = mcDAO.insertMatchMessage(sqlSession, mChat);
		if(result > 0) {
			result = mcDAO.insertUnReadId(sqlSession, mChat);
			if(result > 0) {
				return mcDAO.selectMessageNum(sqlSession);
			}
		}
		
		return result;
		
	}

	@Override
	public int selectMatchCount(int mcNum) {
		return mcDAO.selectMatchCount(sqlSession, mcNum);
	}

	@Override
	public int readMessageDB(MatchChat mChat) {
		return mcDAO.deleteUnReadId(sqlSession, mChat);
	}

	@Override
	public List<MatchChat> getUnReadCount(MatchChat mChat) {
		return mcDAO.getUnReadCount(sqlSession, mChat);
	}

	@Override
	public List<MatchChat> selectAppendChatLog(MatchChat mChat) {
		return mcDAO.selectAppendChatLog(sqlSession, mChat);
	}
	
	@Override
	public List<Match> selectMainCoupleMatchList() {
		return mcDAO.selectMainCoupleMatchList(sqlSession);
	}

	@Override
	public List<Match> selectMainWalkMatchList() {
		return mcDAO.selectMainWalkMatchList(sqlSession);
	}

	@Override
	public int selectMatchYCount(int mcNum) {
		return mcDAO.selectMatchYCount(sqlSession, mcNum);
	}
	@Override
	public int getAllMatchListCount() {
		return mcDAO.getAllMatchListCount(sqlSession);
	}

	@Override
	public List<Match> selectMMatchList(PageInfo pi) {
		return mcDAO.selectMMatchList(sqlSession, pi);
	}

	@Override
	public String selectMatchContent(HashMap<String, Object> map) {
		return mcDAO.selectMatchContent(sqlSession, map);
	}

	@Transactional
	@Override
	public int matchSuccess(HashMap<String, Object> map) {
		int result = mcDAO.updateMatchMemberSuccess(sqlSession, map);
		result += mcDAO.updateMatchSuccess(sqlSession, map);
		return result;
	}

	@Override
	public int getInfoMatchListCount(HashMap<String, Object> map) {
		return mcDAO.getInfoMatchListCount(sqlSession, map);
	}

	@Override
	public List<Match> selectInfoMatchList(HashMap<String, Object> map, PageInfo pi) {
		return mcDAO.selectInfoMatchList(sqlSession, map, pi);
	}



}
