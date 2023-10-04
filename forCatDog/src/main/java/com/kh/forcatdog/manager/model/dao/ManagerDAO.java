package com.kh.forcatdog.manager.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;
import com.kh.forcatdog.manager.model.vo.Report;
import com.kh.forcatdog.member.model.vo.Member;

@Repository("mnDAO")
public class ManagerDAO {

	public int getReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("managerMapper.getReportListCount");
	}

	public List<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());		
		return sqlSession.selectList("managerMapper.selectReportList", null, rowBounds);
	}

	public Report selectReportDetail(SqlSessionTemplate sqlSession, int reportNum) {
		return sqlSession.selectOne("managerMapper.selectReportDetail", reportNum);
	}

	public int pauseUser(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.pauseUser", map);
	}

	public void deleteUser(SqlSessionTemplate sqlSession, String user) {
		sqlSession.update("memberMapper.deleteUser", user);
	}

	public int searchReportCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("managerMapper.getSearchReportCount", map);
	}

	public List<Report> searchReportList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("managerMapper.searchReportList", map);
	}

	public int getqnaListCount(SqlSessionTemplate sqlSession, QuestionNAnswer qna) {
		return sqlSession.selectOne("customerMapper.getqnaListCount", qna);
	}

	public List<QuestionNAnswer> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("customerMapper.selectqnaList", null, rowBounds);
	}

	public int getMemberListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.getselectMemberList", m);
	}
	
	public List<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("memberMapper.selectMemberList",null, rowBounds);
	}

	public void deleteMember(SqlSessionTemplate sqlSession, String user) {
		sqlSession.update("memberMapper.deleteUser", user);
		
	}

	public int searchMemberCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.searchMemberCount", map);
	}

	public int searchQnaCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("customerMapper.searchQnaCount", map);
	}

	public List<QuestionNAnswer> searchQnaList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("customerMapper.searchQnaList", map);
	}

	public List<QuestionNAnswer> searchQnaList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("customerMapper.searchQnaList", map, rowBounds);
	}

	public List<Member> searchMemberList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("memberMapper.searchMemberList", map, rowBounds);
	}

	public void sendReport(SqlSessionTemplate sqlSession, Report report) {
		sqlSession.insert("managerMapper.insertReport", report);
	}
	
}
