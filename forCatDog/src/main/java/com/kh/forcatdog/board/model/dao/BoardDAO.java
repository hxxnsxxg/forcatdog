package com.kh.forcatdog.board.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.forcatdog.board.model.vo.Board;
import com.kh.forcatdog.board.model.vo.Comment;
import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.Member;

@Repository("bDAO")
public class BoardDAO {

	public int getBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getBoardListCount");
	}

	public List<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("boardMapper.selectBoardList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertBoardFile(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoardFile", b);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bNum) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNum);
	}

	public int updateBoardCount(SqlSessionTemplate sqlSession, int bNum) {
		return sqlSession.update("boardMapper.updateBoardCount", bNum);
	}

	public int updateFileCount(SqlSessionTemplate sqlSession, int fileId) {
		return sqlSession.update("boardMapper.updateFileCount", fileId);
	}

	public int deleteExFile(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("boardMapper.deleteExFile", map);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateBoard", b);
	}
	
	public int updateBoardFile(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.updateBoardFile", b);
	}


	public int insertComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("boardMapper.insertComment", c);
	}

	public List<Comment> selectComment(SqlSessionTemplate sqlSession, int bNum) {
		return sqlSession.selectList("boardMapper.selectComment", bNum);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int cNum) {
		return sqlSession.update("boardMapper.deleteComment", cNum);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bnum) {
		return sqlSession.update("boardMapper.deleteBoard", bnum);
	}
	
	public int updateComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.update("boardMapper.updateComment", c);
	}

	public int replyComment(SqlSessionTemplate sqlSession, Comment c) {
		return sqlSession.insert("boardMapper.insertComment", c);
	}

	public int getSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getSearchCount", map);
	}

	public List<Board> searchBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("boardMapper.searchBoardList", map, rowBounds);
	}

	public List<Board> allSearchBoard(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectList("boardMapper.allSearchBoard", word);
	}
	
	public List<Board> selectMBoardList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("boardMapper.selectMBoardList");
	}

	public List<Board> selectManagerBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("boardMapper.selectManagerBoardList", null, rowBounds);
	}

	public int getManagerBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getManagerBoardListCount");
	}

	public int getInfoBoardListCount(SqlSessionTemplate sqlSession, String infoId) {
		return sqlSession.selectOne("boardMapper.getInfoBoardListCount", infoId);
	}

	public List<Board> selectInfoBoardList(SqlSessionTemplate sqlSession, String infoId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getItemLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getItemLimit());
		return sqlSession.selectList("boardMapper.selectInfoBoardList", infoId, rowBounds);
	}

	public Member selectInfoBoardMember(SqlSessionTemplate sqlSession, String infoId) {
		return sqlSession.selectOne("boardMapper.selectInfoBoardMember", infoId);
	}


}
