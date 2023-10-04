package com.kh.forcatdog.sellshare.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.forcatdog.sellshare.model.dao.SellshareDAO;
import com.kh.forcatdog.sellshare.model.vo.PageInfo;
import com.kh.forcatdog.sellshare.model.vo.SComment;
import com.kh.forcatdog.sellshare.model.vo.Sellshare;

@Service("ssService")
public class SellshareServiceImpl implements SellshareService {
	
	@Autowired
	private SellshareDAO ssDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getSellListCount() {
		return ssDAO.getSellListCount(sqlSession);
	}
	
	@Override
	public int getShareListCount() {
		return ssDAO.getShareListCount(sqlSession);
	}

	@Override
	public List<Sellshare> selectSellList(PageInfo pi) {
		return ssDAO.selectSellList(sqlSession, pi);
	}

	@Override
	public List<Sellshare> selectShareList(PageInfo pi) {
		return ssDAO.selectShareList(sqlSession,pi);
	}
	
	@Override
	public List<String> selectSido() {
		return ssDAO.selectSido(sqlSession);
	}
	
	@Override
	public List<String> selectSigungu(HashMap<String, String> map) {
		return ssDAO.selectSigungu(sqlSession, map);
	}
	
	@Override
	public List<String> selectDong(HashMap<String, String> map) {
		return ssDAO.selectDong(sqlSession, map);
	}

	@Transactional
	@Override
	public int insertSellshare(Sellshare ss) {
		int result = ssDAO.insertSellshare(sqlSession, ss);
		
		if(ss.getFileList() != null && ss.getFileList().size() > 0) {
			result += ssDAO.insertSellshareFile(sqlSession, ss);
		}
		return result;
	}

	@Override
	public Sellshare selectSellshare(int ssNum) {
		return ssDAO.selectSellshare(sqlSession, ssNum);
	}
	
	@Override
	public Sellshare selectUpdateSellshare(int ssNum) {
		return ssDAO.selectSellshare(sqlSession, ssNum);
	}

	@Transactional
	@Override
	public int updateSellshare(HashMap<String, Object> map, Sellshare ss) {
		int result = ssDAO.deleteExFile(sqlSession, map);
		result += ssDAO.updateSellshare(sqlSession, ss);
		if(ss.getFileList() != null && ss.getFileList().size() > 0) {
			result += ssDAO.updateSellshareFile(sqlSession, ss);
		}
		return result;
	}

	@Override
	public int sellshareDelete(int ssNum) {
		return ssDAO.deleteSellshare(sqlSession, ssNum);
	}

	@Override
	public int insertComment(SComment sc) {
		return ssDAO.insertComment(sqlSession, sc);
	}

	@Override
	public List<SComment> selectSComment(int ssNum) {
		return ssDAO.selectComment(sqlSession, ssNum);
	}

	@Override
	public int updateComment(SComment sc) {
		return ssDAO.updateComment(sqlSession, sc);
	}

	@Override
	public int deleteComment(int cNum) {
		return ssDAO.deleteComment(sqlSession, cNum);
	}

	@Override
	public int ReplyComment(SComment sc) {
		return ssDAO.replyComment(sqlSession, sc);
	}
	
	@Override
	public int getSellListCount(HashMap<String, String> map) {
		return ssDAO.getSellListCount(sqlSession, map);
	}
	
	@Override
	public int getShareListCount(HashMap<String, String> map) {
		return ssDAO.getShareListCount(sqlSession, map);
	}
	
	@Override
	public List<Sellshare> searchSellList(PageInfo pi, HashMap<String, String> map) {
		return ssDAO.searchSellList(sqlSession, pi, map);
	}

	@Override
	public List<Sellshare> searchShareList(PageInfo pi, HashMap<String, String> map) {
		return ssDAO.searchShareList(sqlSession, pi, map);
	}

	@Override
	public List<Sellshare> allSearchSell(String word) {
		return ssDAO.allSearchSell(sqlSession, word);
	}

	@Override
	public List<Sellshare> allSearchShare(String word) {
		return ssDAO.allSearchShare(sqlSession, word);
	}

	@Override
	public int updateScount(int ssNum) {
		return ssDAO.updateScount(sqlSession, ssNum);
	}

	@Override
	public List<Sellshare> selectSellShareList(com.kh.forcatdog.common.PageInfo pi) {
		return ssDAO.selectSellShareList(sqlSession, pi);
	}

	@Override
	public int getSellShareListCount() {
		return ssDAO.getSellShareListCount(sqlSession);
	}

	@Override
	public int getInfoSSListCount(HashMap<String, String> map) {
		return ssDAO.getInfoSSListCount(sqlSession, map);
	}

	@Override
	public List<Sellshare> selectInfoSSList(HashMap<String, String> map, PageInfo pi) {
		return ssDAO.selectInfoSSList(sqlSession, map, pi);
	}

}
