package com.kh.forcatdog.catdog.model.vo;

public class Pagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		int itemLimit = 6;
		
		maxPage = (int) Math.ceil(((double)listCount / itemLimit));
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, itemLimit);
		
		return pi;
	}
}
