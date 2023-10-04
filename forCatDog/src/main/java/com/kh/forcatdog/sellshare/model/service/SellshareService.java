package com.kh.forcatdog.sellshare.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forcatdog.sellshare.model.vo.PageInfo;
import com.kh.forcatdog.sellshare.model.vo.SComment;
import com.kh.forcatdog.sellshare.model.vo.Sellshare;

public interface SellshareService {

	int getSellListCount();
	
	int getShareListCount();

	List<Sellshare> selectSellList(PageInfo pi);

	List<Sellshare> selectShareList(PageInfo pi);

	List<String> selectSido();
	
	List<String> selectSigungu(HashMap<String, String> map);
	
	List<String> selectDong(HashMap<String, String> map);

	int insertSellshare(Sellshare ss);

	Sellshare selectSellshare(int ssNum);
	
	int updateSellshare(HashMap<String, Object> map, Sellshare ss);
	
	Sellshare selectUpdateSellshare(int ssNum);

	int sellshareDelete(int ssNum);

	int insertComment(SComment sc);

	List<SComment> selectSComment(int ssNum);

	int updateComment(SComment sc);

	int deleteComment(int cNum);

	int ReplyComment(SComment sc);
	
	int getSellListCount(HashMap<String, String> map);
	
	int getShareListCount(HashMap<String, String> map);

	List<Sellshare> searchSellList(PageInfo pi, HashMap<String, String> map);

	List<Sellshare> searchShareList(PageInfo pi, HashMap<String, String> map);

	List<Sellshare> allSearchSell(String word);

	List<Sellshare> allSearchShare(String word);

	int updateScount(int ssNum);

	List<Sellshare> selectSellShareList(com.kh.forcatdog.common.PageInfo pi);

	int getSellShareListCount();

	int getInfoSSListCount(HashMap<String, String> map);

	List<Sellshare> selectInfoSSList(HashMap<String, String> map, PageInfo pi);
}
