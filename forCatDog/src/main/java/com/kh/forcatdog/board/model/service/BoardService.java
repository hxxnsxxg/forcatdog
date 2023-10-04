package com.kh.forcatdog.board.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forcatdog.board.model.vo.Board;
import com.kh.forcatdog.board.model.vo.Comment;
import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.member.model.vo.Member;

public interface BoardService {

	int getBoardListCount();

	List<Board> selectBoardList(PageInfo pi);

	int insertBoard(Board b);
	
	int updateBcount(int bNum);

	Board selectBoard(int bNum);

	int updateFileCount(int fileId);

	int updateBoard(HashMap<String, Object> map, Board b);

	Board selectUpdateBoard(int bNum);

	int insertComment(Comment c);

	List<Comment> selectComment(int bNum);

	int deleteComment(int cNum);

	int deleteBoard(int bnum);

	int updateComment(Comment c);

	int ReplyComment(Comment c);

	int getSearchListCount(HashMap<String, String> map);

	List<Board> searchBoardList(PageInfo pi, HashMap<String, String> map);

	List<Board> allSearchBoard(String word);
	
	List<Board> selectManagerBoardList(PageInfo pi);

	int getManagerBoardListCount();

	int getInfoBoardListCount(String infoId);

	List<Board> selectInfoBoardList(String infoId, PageInfo pi);

	Member selectInfoBoardMember(String infoId);

}
