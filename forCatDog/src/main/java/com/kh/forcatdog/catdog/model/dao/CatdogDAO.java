package com.kh.forcatdog.catdog.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.catdog.model.vo.Catdog;
import com.kh.forcatdog.catdog.model.vo.PageInfo;


@Repository("ccDAO")
public class CatdogDAO {
	public int getDogListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("CatdogMapper.getDogListCount");
	}
	
	public int getCatListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("CatdogMapper.getCatListCount");
	}

	public List<Catdog> selectDogList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("CatdogMapper.selectDogList", null, rowBounds);
	}
	
	public List<Catdog> selectCatList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("CatdogMapper.selectCatList", null, rowBounds);
	}

	public int insertCatdog(SqlSessionTemplate sqlSession, Catdog cd) {
		return sqlSession.insert("CatdogMapper.insertCatdog", cd);
	}

	public int insertCatdogFile(SqlSessionTemplate sqlSession, Catdog cd) {
		return sqlSession.insert("CatdogMapper.insertCatdogFile", cd);
	}
	
	public Catdog selectCatdog(SqlSessionTemplate sqlSession, int cdNum) {
		return sqlSession.selectOne("CatdogMapper.selectCatdog", cdNum);
	}

	public int deleteExFile(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("CatdogMapper.deleteExFile", map);
	}

	public int updateCatdog(SqlSessionTemplate sqlSession, Catdog cd) {
		return sqlSession.insert("CatdogMapper.updateCatdog", cd);
	}

	public List<String> selectCate(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("CatdogMapper.selectCate");
	}

	public List<String> selectCate2(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("CatdogMapper.selectCate2");
	}
	
	public int deleteCatdog(SqlSessionTemplate sqlSession, int cdNum) {
		return sqlSession.update("CatdogMapper.deleteCatdog",cdNum);
	}

	public int updateCatdogFile(SqlSessionTemplate sqlSession, Catdog cd) {
		return sqlSession.insert("CatdogMapper.updateCatdogFile", cd);
	}

	public List<Catdog> searchDog(SqlSessionTemplate sqlSession, PageInfo pi, String word) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("CatdogMapper.searchDog", word, rowBounds);
	}

	public List<Catdog> searchCat(SqlSessionTemplate sqlSession, PageInfo pi, String word) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("CatdogMapper.searchCat", word, rowBounds);
	}

	public int getDogSearchListCount(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectOne("CatdogMapper.getDogSearchListCount", word);
	}

	public int getCatSearchListCount(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectOne("CatdogMapper.getCatSearchListCount", word);
	}

	public List<Catdog> allSearchDog(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectList("CatdogMapper.searchDog", word);
	}

	public List<Catdog> allSearchCat(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectList("CatdogMapper.searchCat", word);
	}
	
	public List<Catdog> selectMainDogList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("CatdogMapper.selectMainDogList");
	}

	public List<Catdog> selectMainCatList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("CatdogMapper.selectMainCatList");
	}

	public int getCatDogListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("CatdogMapper.getCatDogListCount");
	}

	public List<Catdog> selectCatDogList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("CatdogMapper.selectCatDogList", null, rowBounds);
	}

	public List<String> searchCatDog(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectList("CatdogMapper.searchCatDog", map);
	}
}
