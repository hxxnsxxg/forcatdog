package com.kh.forcatdog.sellshare.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.sellshare.model.vo.PageInfo;
import com.kh.forcatdog.sellshare.model.vo.SComment;
import com.kh.forcatdog.sellshare.model.vo.Sellshare;

@Repository("ssDAO")
public class SellshareDAO {

	public int getSellListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sellshareMapper.getSellListCount");
	}
	
	public int getShareListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sellshareMapper.getShareListCount");
	}

	public List<Sellshare> selectSellList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("sellshareMapper.selectSellList", null, rowBounds);
	}

	public List<Sellshare> selectShareList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("sellshareMapper.selectShareList", null, rowBounds);
	}

	public List<String> selectSido(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("sellshareMapper.selectSido");
	}
	
	public List<String> selectSigungu(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("sellshareMapper.selectSigungu", map);
	}
	
	public List<String> selectDong(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("sellshareMapper.selectDong", map);
	}

	public int insertSellshare(SqlSessionTemplate sqlSession, Sellshare ss) {
		return sqlSession.insert("sellshareMapper.insertSellshare", ss);
	}

	public int insertSellshareFile(SqlSessionTemplate sqlSession, Sellshare ss) {
		return sqlSession.insert("sellshareMapper.insertSellshareFile", ss);
	}

	public Sellshare selectSellshare(SqlSessionTemplate sqlSession, int ssNum) {
		return sqlSession.selectOne("sellshareMapper.selectSellshare", ssNum);
	}


	public int deleteExFile(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("sellshareMapper.deleteExFile", map);
	}

	public int updateSellshare(SqlSessionTemplate sqlSession, Sellshare ss) {
		return sqlSession.insert("sellshareMapper.updateSellshare", ss);
	}

	public int updateSellshareFile(SqlSessionTemplate sqlSession, Sellshare ss) {
		return sqlSession.insert("sellshareMapper.updateSellshareFile", ss);
	}

	public int deleteSellshare(SqlSessionTemplate sqlSession, int ssNum) {
		return sqlSession.update("sellshareMapper.deleteSellshare", ssNum);
	}

	public int insertComment(SqlSessionTemplate sqlSession, SComment sc) {
		return sqlSession.insert("sellshareMapper.insertComment", sc);
	}

	public List<SComment> selectComment(SqlSessionTemplate sqlSession, int ssNum) {
		return sqlSession.selectList("sellshareMapper.selectComment", ssNum);
	}

	public int updateComment(SqlSessionTemplate sqlSession, SComment sc) {
		return sqlSession.update("sellshareMapper.updateComment", sc);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int cNum) {
		return sqlSession.update("sellshareMapper.deleteComment", cNum);
	}

	public int replyComment(SqlSessionTemplate sqlSession, SComment sc) {
		return sqlSession.insert("sellshareMapper.insertComment", sc);
	}

	public int getSellListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("sellshareMapper.getSellSearchCount", map);
	}
	
	public int getShareListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("sellshareMapper.getShareSearchCount", map);
	}

	public List<Sellshare> searchSellList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("sellshareMapper.searchSellList", map, rowBounds);
	}

	public List<Sellshare> searchShareList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("sellshareMapper.searchShareList", map, rowBounds);
	}

	public List<Sellshare> allSearchSell(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectList("sellshareMapper.allSearchSell", word);
	}

	public List<Sellshare> allSearchShare(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectList("sellshareMapper.allSearchShare", word);
	}

	public int updateScount(SqlSessionTemplate sqlSession, int ssNum) {
		return sqlSession.update("sellshareMapper.updateSSCount", ssNum);
	}

	public List<Sellshare> selectSellShareList(SqlSessionTemplate sqlSession, com.kh.forcatdog.common.PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("sellshareMapper.selectSellShareList", null, rowBounds);
	}

	public int getSellShareListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("sellshareMapper.getSellShareListCount");
	}

	public int getInfoSSListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("sellshareMapper.getInfoSSListCount", map);
	}

	public List<Sellshare> selectInfoSSList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("sellshareMapper.selectInfoSSList", map, rowBounds);
	}
}
