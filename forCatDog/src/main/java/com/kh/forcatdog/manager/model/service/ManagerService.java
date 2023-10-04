package com.kh.forcatdog.manager.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;
import com.kh.forcatdog.manager.model.vo.Report;
import com.kh.forcatdog.member.model.vo.Member;

public interface ManagerService {

	int getReportListCount();

	List<Report> selectReportList(PageInfo pi);

	Report selectReportDetail(int reportNum);

	int pauseUser(HashMap<String, Object> map);

	void deleteUser(String user);

	int searchReportCount(HashMap<String, String> map);

	List<Report> searchReportList(HashMap<String, String> map);

	int getMemberListCount(Member m);

	List<Member> selectMemberList(PageInfo pi);

	int searchMemberCount(HashMap<String, String> map);

	List<Member> searchMemberList(HashMap<String, String> map, PageInfo pi);

	int getqnaListCount(QuestionNAnswer qna);

	List<QuestionNAnswer> selectQnaList(PageInfo pi);

	void deleteMember(String user);

	int searchQnaCount(HashMap<String, String> map);

	List<QuestionNAnswer> searchQnaList(HashMap<String, String> map, PageInfo pi);

	void sendReport(Report report);
}
