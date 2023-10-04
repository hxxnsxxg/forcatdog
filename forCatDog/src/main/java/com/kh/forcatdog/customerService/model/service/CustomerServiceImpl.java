package com.kh.forcatdog.customerService.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.customerService.model.dao.CustomerServiceDAO;
import com.kh.forcatdog.customerService.model.vo.Notice;
import com.kh.forcatdog.customerService.model.vo.OperationGuide;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;

@Service("cService")
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerServiceDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return cDAO.getListCount(sqlSession);
	}

	@Override
	public List<Notice> selectList(PageInfo pi) {
		return cDAO.selectList(sqlSession, pi);
	}

	@Override
	public List<OperationGuide> selectOList() {
		return cDAO.selectOList(sqlSession);
	}

	@Override
	public int getQListCount(String userId) {
		return cDAO.getQListCount(sqlSession, userId);
	}
	
	@Override
	public int getAQListCount() {
		return cDAO.getAQListCount(sqlSession);
	}

	@Override
	public List<QuestionNAnswer> selectQList(PageInfo pi, String userId) {
		return cDAO.selectQList(sqlSession, pi, userId);
	}

	@Override
	public int insertNotice(Notice n) {
		return cDAO.insertNotice(sqlSession, n);
	}

	@Transactional
	@Override
	public Notice selectNotice(int nNum) {
		int result = cDAO.nAddReadCount(sqlSession, nNum);
		
		Notice n = null;
		if(result > 0) {
			n = cDAO.selectNotice(sqlSession, nNum);
		}
		
		return n;
	}

	@Override
	public int deleteNotice(int nNum) {
		return cDAO.deleteNotice(sqlSession, nNum);
	}

	@Override
	public Notice updateNoticeForm(int nNum) {
		return cDAO.selectNotice(sqlSession, nNum);
	}

	@Override
	public int updateNotice(Notice n) {
		return cDAO.updateNotice(sqlSession, n);
	}

	@Override
	public OperationGuide updateOperationGuideForm(int opNum) {
		return cDAO.updateOperationGuideForm(sqlSession, opNum);
	}

	@Override
	public int insertOperationGuide(OperationGuide og) {
		return cDAO.insertOperationGuide(sqlSession, og);
	}

	@Override
	public QuestionNAnswer selectQuestion(int qNum) {
		return cDAO.selectQuestion(sqlSession, qNum);
	}

	@Override
	public int updateQuestion(QuestionNAnswer qna) {
		return cDAO.updateQuestion(sqlSession, qna);
	}

	@Override
	public int insertQuestion(QuestionNAnswer qna) {
		return cDAO.insertQuestion(sqlSession, qna);
	}

	@Override
	public int deleteQuestion(int qNum) {
		return cDAO.deleteQuestion(sqlSession, qNum);
	}

	@Override
	public int operationGuideUpdate(OperationGuide og) {
		return cDAO.updateOperationGuide(sqlSession, og);
	}

	@Override
	public int deleteOperationGuide(int opNum) {
		return cDAO.deleteOperationGuide(sqlSession, opNum);
	}

	@Transactional
	@Override
	public int insertAnswer(QuestionNAnswer qna) {
		int result = cDAO.insertAnswer(sqlSession, qna);
		int replyResult = 0;
		if(result > 0) {
			replyResult = cDAO.updateReply(sqlSession, qna);
		}
		return replyResult;
	}

	@Override
	public List<QuestionNAnswer> selectQuestionList(PageInfo pi) {
		return cDAO.selectQuestionList(sqlSession, pi);
	}
	
	@Override
	public List<Notice> selectMainNoticeList() {
		return cDAO.selectMainNoticeList(sqlSession);
	}
	
	@Override
	public List<Notice> selectMnoticeList(PageInfo pi) {
		return cDAO.selectMnoticeList(sqlSession, pi);
	}

	@Override
	public List<OperationGuide> selectMoperationList(PageInfo pi) {
		return cDAO.selectMoperationList(sqlSession, pi);
	}

	@Override
	public OperationGuide Operationselect(int opNum) {
		return cDAO.selectOperation(sqlSession, opNum);
	}

	@Override
	public int getNoticeCount() {
		return cDAO.getListCount(sqlSession);
	}

	@Override
	public int getOperationCount() {
		return cDAO.getOperationCount(sqlSession);
	}

	@Override
	public List<QuestionNAnswer> selectAnswer(int qNum) {
		return cDAO.selectAnswer(sqlSession, qNum);
	}
}
