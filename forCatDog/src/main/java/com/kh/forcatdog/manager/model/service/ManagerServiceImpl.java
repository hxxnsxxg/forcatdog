package com.kh.forcatdog.manager.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;
import com.kh.forcatdog.manager.model.dao.ManagerDAO;
import com.kh.forcatdog.manager.model.vo.Report;
import com.kh.forcatdog.member.model.vo.Member;

@Service("mnService")
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private ManagerDAO mnDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getReportListCount() {
		return mnDAO.getReportListCount(sqlSession);
	}

	@Override
	public List<Report> selectReportList(PageInfo pi) {
		return mnDAO.selectReportList(sqlSession, pi);
	}

	@Override
	public Report selectReportDetail(int reportNum) {
		return mnDAO.selectReportDetail(sqlSession, reportNum);
	}
	
	@Override
	public int pauseUser(HashMap<String, Object> map) {
		return mnDAO.pauseUser(sqlSession, map);
	}

	@Override
	public void deleteUser(String user) {
		mnDAO.deleteUser(sqlSession, user);
	}

	@Override
	public int searchReportCount(HashMap<String, String> map) {
		return mnDAO.searchReportCount(sqlSession, map);
	}

	@Override
	public List<Report> searchReportList(HashMap<String, String> map) {
		return mnDAO.searchReportList(sqlSession, map);
	}

	@Override
	public int getMemberListCount(Member m) {
		return mnDAO.getMemberListCount(sqlSession, m);
	}

	@Override
	public List<Member> selectMemberList(PageInfo pi) {
		return mnDAO.selectMemberList(sqlSession, pi);
	}

	@Override
	public void deleteMember(String user) {
		mnDAO.deleteMember(sqlSession, user);
	}


	@Override
	public int getqnaListCount(QuestionNAnswer qna) {
		return mnDAO.getqnaListCount(sqlSession, qna);
	}

	@Override
	public List<QuestionNAnswer> selectQnaList(PageInfo pi) {
		return mnDAO.selectQnaList(sqlSession, pi);
	}

	@Override
	public int searchMemberCount(HashMap<String, String> map) {
		return mnDAO.searchMemberCount(sqlSession, map);
	}

	@Override
	public int searchQnaCount(HashMap<String, String> map) {
		return mnDAO.searchQnaCount(sqlSession, map);
	}


	@Override
	public List<QuestionNAnswer> searchQnaList(HashMap<String, String> map, PageInfo pi) {
		return mnDAO.searchQnaList(sqlSession, map, pi);
	}

	@Override
	public List<Member> searchMemberList(HashMap<String, String> map, PageInfo pi) {
		return mnDAO.searchMemberList(sqlSession, map, pi);
	}

	@Override
	public void sendReport(Report report) {
		mnDAO.sendReport(sqlSession, report);
	}


	



}
