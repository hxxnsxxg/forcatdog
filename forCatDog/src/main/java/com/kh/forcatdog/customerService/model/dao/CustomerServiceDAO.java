package com.kh.forcatdog.customerService.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.customerService.model.vo.Notice;
import com.kh.forcatdog.customerService.model.vo.OperationGuide;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;

@Repository("sDAO")
public class CustomerServiceDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("customerMapper.getListCount");
	}

	public List<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		
		return sqlSession.selectList("customerMapper.selectList", null, rowBounds);
	}

	public List<OperationGuide> selectOList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("customerMapper.selectOList");
	}
	
	public int getAQListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("customerMapper.getAQListCount");
	}
	
	public int getQListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("customerMapper.getQListCount", userId);
	}

	public List<QuestionNAnswer> selectQList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("customerMapper.selectQList", userId, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("customerMapper.insertNotice", n);
	}

	public int nAddReadCount(SqlSessionTemplate sqlSession, int nNum) {
		return sqlSession.update("customerMapper.nAddReadCount", nNum);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int nNum) {
		return sqlSession.selectOne("customerMapper.selectNotice", nNum);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int nNum) {
		return sqlSession.update("customerMapper.deleteNotice", nNum);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("customerMapper.updateNotice", n);
	}

	public OperationGuide updateOperationGuideForm(SqlSessionTemplate sqlSession, int opNum) {
		return sqlSession.selectOne("customerMapper.updateOperationGuideForm", opNum);
	}

	public int insertOperationGuide(SqlSessionTemplate sqlSession, OperationGuide og) {
		return sqlSession.insert("customerMapper.insertOperationGuide", og);
	}

	public QuestionNAnswer selectQuestion(SqlSessionTemplate sqlSession, int qNum) {
		return sqlSession.selectOne("customerMapper.selectQuestion", qNum);
	}

	public int updateQuestion(SqlSessionTemplate sqlSession, QuestionNAnswer qna) {
		return sqlSession.update("customerMapper.updateQuestion", qna);
	}

	public int insertQuestion(SqlSessionTemplate sqlSession, QuestionNAnswer qna) {
		return sqlSession.insert("customerMapper.insertQuestion", qna);
	}

	public int deleteQuestion(SqlSessionTemplate sqlSession, int qNum) {
		return sqlSession.update("customerMapper.deleteQuestion", qNum);
	}

	public int updateOperationGuide(SqlSessionTemplate sqlSession, OperationGuide og) {
		return sqlSession.update("customerMapper.updateOperationGuide", og);
	}

	public int deleteOperationGuide(SqlSessionTemplate sqlSession, int opNum) {
		return sqlSession.update("customerMapper.deleteOperationGuide", opNum);
	}

	public int insertAnswer(SqlSessionTemplate sqlSession, QuestionNAnswer qna) {
		return sqlSession.insert("customerMapper.insertAnswer", qna);
	}

	public List<QuestionNAnswer> selectQuestionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		
		return sqlSession.selectList("customerMapper.selectQnaList", null, rowBounds);
	}

	public int updateReply(SqlSessionTemplate sqlSession, QuestionNAnswer qna) {
		return sqlSession.update("customerMapper.updateReply", qna);
	}
	
	public List<Notice> selectMainNoticeList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("customerMapper.selectMainNotice");
	}
	
	public List<Notice> selectMnoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("customerMapper.selectMnoticeList", null, rowBounds);
	}

	public List<OperationGuide> selectMoperationList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("customerMapper.selectMoperationList", null, rowBounds);
	}

	public OperationGuide selectOperation(SqlSessionTemplate sqlSession, int opNum) {
		return sqlSession.selectOne("customerMapper.selectOperation", opNum);
	}
	
	public int getOperationCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("customerMapper.getOperationCount");
	}

	public List<QuestionNAnswer> selectAnswer(SqlSessionTemplate sqlSession, int qNum) {
		return sqlSession.selectList("customerMapper.selectAnswer", qNum);
	}
}
