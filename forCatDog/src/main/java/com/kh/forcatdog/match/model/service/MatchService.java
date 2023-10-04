package com.kh.forcatdog.match.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.match.model.vo.MatchMember;
import com.kh.forcatdog.member.model.vo.MatchChat;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

public interface MatchService {
	
	List<Match> selectFindMatchList(int cate, PageInfo pi);

	int insertMatch(Match match);

	int getFindMatchListCount(int cate);

	Match selectMatchDetail(int mcNum);

	Match selectUpdateMatch(int mcNum);

	int updateMatch(Match match);

	int deleteMatch(Match match);

	int matchMember(HashMap<String, Object> map);

	int searchMatchMember(HashMap<String, Object> map);

	List<Match> selectPMatchList(Member m);

	List<MyPet> selectMatchInfo(HashMap<String, String> map);

	List<MyPet> selectMatchPetList(HashMap<String, Object> map);

	int acceptMatch(MatchMember mm);

	int rejectMatch(MatchMember mm);

	List<MatchChat> selectChatLog(HashMap<String, Object> map);

	List<Match> selectRMatchList(Member m);

	int insertMatchMessage(MatchChat mChat);

	int selectMatchCount(int mcNum);

	int readMessageDB(MatchChat mChat);

	List<MatchChat> getUnReadCount(MatchChat mChat);

	List<MatchChat> selectAppendChatLog(MatchChat mChat);

	List<Match> selectMainCoupleMatchList();

	List<Match> selectMainWalkMatchList();

	int selectMatchYCount(int mcNum);

	List<Match> selectMMatchList(PageInfo pi);

	int getAllMatchListCount();

	String selectMatchContent(HashMap<String, Object> map);

	int matchSuccess(HashMap<String, Object> map);

	int getInfoMatchListCount(HashMap<String, Object> map);

	List<Match> selectInfoMatchList(HashMap<String, Object> map, PageInfo pi);


}
