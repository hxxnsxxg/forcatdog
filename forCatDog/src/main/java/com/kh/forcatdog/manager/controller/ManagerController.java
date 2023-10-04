package com.kh.forcatdog.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.board.model.exception.BoardException;
import com.kh.forcatdog.board.model.service.BoardService;
import com.kh.forcatdog.board.model.vo.Board;
import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.common.Pagination;
import com.kh.forcatdog.customerService.model.exception.NoticeException;
import com.kh.forcatdog.customerService.model.service.CustomerService;
import com.kh.forcatdog.customerService.model.vo.Notice;
import com.kh.forcatdog.customerService.model.vo.OperationGuide;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;
import com.kh.forcatdog.manager.model.exception.ManagerException;
import com.kh.forcatdog.manager.model.service.ManagerService;
import com.kh.forcatdog.manager.model.vo.Report;
import com.kh.forcatdog.match.model.exception.MatchException;
import com.kh.forcatdog.match.model.service.MatchService;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.member.model.exception.MemberException;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.sellshare.model.exception.SellshareException;
import com.kh.forcatdog.sellshare.model.service.SellshareService;
import com.kh.forcatdog.sellshare.model.vo.Sellshare;

@Controller
public class ManagerController {
   
   @Autowired
   private ManagerService mnService;
   @Autowired 
   private BoardService bService;
   @Autowired 
   private SellshareService ssService;
   @Autowired 
   private MatchService mcService;
   @Autowired 
   private CustomerService cService;
   
   @RequestMapping("reportList.mn")
   public ModelAndView reportList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
      
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mnService.getReportListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Report> rList = (ArrayList<Report>)mnService.selectReportList(pi);
      
      if(rList != null) {
         mv.addObject("listCount", listCount);
         mv.addObject("rList", rList);
         mv.addObject("pi", pi);
         mv.setViewName("reportManagement");
      } else {
         throw new ManagerException("신고 리스트를 불러올 수 없습니다.");
      }
      
      return mv;
   }
   
   @RequestMapping("reportDetail.mn")
   public String reportDetail(@RequestParam("reportNum") int reportNum, Model m) {

      Report report = mnService.selectReportDetail(reportNum);
      if(report != null) {
         m.addAttribute("report", report);
         return "reportDetailManagement";
      } else {
         throw new ManagerException("회원정보를 불러올 수 없습니다.");
      }
   }
   
   @RequestMapping("pauseUser.mn")
   @ResponseBody
   public boolean pauseUser(@RequestParam("valueArr") ArrayList<String> list, @RequestParam("days") int days) {
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("days", days);
      map.put("list", list);
      
      int result = mnService.pauseUser(map);
      
      if(result > 0) {
         return true;
      } else {
         return false;
      }
      
   }
   
   @RequestMapping("deleteUser.mn")
   public String deleteUser(HttpServletRequest request) {
      String[] user = request.getParameterValues("valueArr");
      for(int i = 0; i < user.length; i++) {
         mnService.deleteUser(user[i]);
      }
      
      return "redirect:reportList.mn";
   }
   
   @RequestMapping("searchReport.mn")
   public String searchUser(@RequestParam("searchOption") String cate, @RequestParam("keyword") String keyword, Model m) {
      
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("cate", cate);
      map.put("keyword", keyword);
      
      int searchCount = mnService.searchReportCount(map);
      
      
      if(searchCount > 0) {
         ArrayList<Report> rList = (ArrayList<Report>) mnService.searchReportList(map);
         m.addAttribute("rList", rList);
         return "reportManagement";
      } else {
         throw new ManagerException("검색 결과가 없습니다");
      }
      
   }
   
   
   @RequestMapping("managerPage.mn")
   public String managerPage(@RequestParam(value = "page", required = false) Integer page,Model model) {
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      Member m = new Member();
      int mlistCount = mnService.getMemberListCount(m);
      PageInfo pi = Pagination.getPageInfo(currentPage, mlistCount);
      
      
      ArrayList<Member> mList = (ArrayList<Member>) mnService.selectMemberList(pi);
      
      if(mList != null) {
         model.addAttribute("listCount", mlistCount);
         model.addAttribute("mList", mList);
         model.addAttribute("pi", pi);
         return "memberManagement";
      } else {
         throw new MemberException("멤버리스트 조회에 실패하였습니다.");
      }
      
   }
   
   @RequestMapping("mdeleteUser.mn")
   public String deleteMember(HttpServletRequest request) {
      String[] user = request.getParameterValues("valueArr");
      for(int i = 0; i < user.length; i++) {
         mnService.deleteMember(user[i]);
      }
      
      return "redirect:managerPage.mn";
   }
   
   @RequestMapping("searchMember.mn")
   public String searchMember(@RequestParam(value = "page", required = false) Integer page, @RequestParam("searchOption") String cate, @RequestParam("keyword") String keyword, Model m) {
      int currentPage = 1;
      
      if(page != null) {
         currentPage = page;
      }
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("cate", cate);
      map.put("keyword", keyword);
      
      int searchCount = mnService.searchMemberCount(map);
      PageInfo pi = Pagination.getPageInfo(currentPage, searchCount);
      
      if(searchCount > 0) {
         ArrayList<Member> mList = (ArrayList<Member>) mnService.searchMemberList(map, pi);
         m.addAttribute("mList", mList);
         m.addAttribute("pi", pi);
         return "memberManagement";
      } else {
         throw new ManagerException("검색 결과가 없습니다");
      }
      
   }
   
   
   @RequestMapping("qnaManagerPage.mn")
   public String qnaManagerPage(@RequestParam(value = "page", required = false) Integer page, Model model) {
      QuestionNAnswer qna = new QuestionNAnswer();
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mnService.getqnaListCount(qna);
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      List<QuestionNAnswer> qList = mnService.selectQnaList(pi);
      
      if(qList != null) {
         model.addAttribute("qList", qList);
         model.addAttribute("listCount", listCount);
         model.addAttribute("pi", pi);
         return "questionManagement";
      } else {
         throw new NoticeException("게시글 불러오기에 실패하였습니다.");
      }
   }
   
   @RequestMapping("searchQna.mn")
   public String searchQna(@RequestParam(value = "page", required = false) Integer page, @RequestParam("searchOption") String cate, @RequestParam("keyword") String keyword, Model m) {
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("cate", cate);
      map.put("keyword", keyword);
      int searchCount = mnService.searchQnaCount(map);
      PageInfo pi = Pagination.getPageInfo(currentPage, searchCount);
      if(searchCount > 0) {
         List<QuestionNAnswer> qList = mnService.searchQnaList(map, pi);
         m.addAttribute("qList", qList);
         m.addAttribute("pi", pi);
         return "questionManagement";
      } else {
         throw new ManagerException("검색 결과가 없습니다");
      }
      
   }
   
   @RequestMapping("managerMain.mn")
   public String managerMain(@RequestParam(value = "page1", required = false) Integer page1, @RequestParam(value = "page2", required = false) Integer page2, Model m) {
      
      int currentPage1 = 1;
      if(page1 != null) {
         currentPage1 = page1;
      }
      
      int listCount1 = cService.getNoticeCount();
      
      PageInfo pi1 = Pagination.getPageInfo(currentPage1, listCount1);
      
      ArrayList<Notice> noticeList = (ArrayList<Notice>) cService.selectMnoticeList(pi1);
      
      int currentPage2 = 1;
      if(page2 != null) {
         currentPage2 = page2;
      }
      
      int listCount2 = cService.getOperationCount();
      
      PageInfo pi2 = Pagination.getPageInfo(currentPage2, listCount2);
      
      ArrayList<OperationGuide> operationList = (ArrayList<OperationGuide>) cService.selectMoperationList(pi2);
      
      if(noticeList != null && operationList != null) {
         m.addAttribute("noticeList", noticeList);
         m.addAttribute("pi1", pi1);
         m.addAttribute("operationList", operationList);
         m.addAttribute("pi2", pi2);
         
         return "managerMain";
      } else {
         throw new BoardException("게시물 조회에 실패하였습니다.");
      }
      
      
   }
   
   @RequestMapping("sendReportForm.mn")
   public String sendReportForm(@ModelAttribute Report report, Model m) {
      m.addAttribute("report", report);
      return "sendReportForm";
   }
   
   @RequestMapping("sendReport.mn")
   public String  sendReport(@ModelAttribute Report report) {
      System.out.println(report);
      
       mnService.sendReport(report);
      return "redirect:sendReportForm.mn";
   }
   
   @RequestMapping("manager_boardList.mn")
   public String mblist(@RequestParam(value = "page", required = false) Integer page, Model m) {
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = bService.getManagerBoardListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      ArrayList<Board> bList = (ArrayList<Board>) bService.selectManagerBoardList(pi);
      
      if(bList != null) {
         m.addAttribute("listCount", listCount);
         m.addAttribute("bList", bList);
         m.addAttribute("pi", pi);

         return "managerboardList";
      } else {
         throw new BoardException("게시글 목록 조회에 실패하였습니다.");
      }
   }
   
   @RequestMapping("manager_sellshareList.mn")
   public String msslist(@RequestParam(value = "page", required = false) Integer page, Model m) {
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = ssService.getSellShareListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Sellshare> ssList = (ArrayList<Sellshare>) ssService.selectSellShareList(pi);
      
      if(ssList != null) {
         m.addAttribute("listCount", listCount);
         m.addAttribute("ssList", ssList);
         m.addAttribute("pi", pi);
         
         return "managersellshareList";
      } else {
         throw new SellshareException("목록 조회에 실패하였습니다.");
      }
      
   }
   
   @RequestMapping("manager_matchList.mn")
   public String mmclist(@RequestParam(value = "page", required = false) Integer page, Model m) {
      int currentPage = 1;
      if(page != null) {
         currentPage = page;
      }
      
      int listCount = mcService.getAllMatchListCount();
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      ArrayList<Match> mcList = (ArrayList<Match>) mcService.selectMMatchList(pi);
      
      if(mcList != null) {
         m.addAttribute("mcList", mcList);
         m.addAttribute("pi", pi);
         return "managermatchList";
      } else {
         throw new MatchException("목록 조회에 실패하였습니다.");
      }
   }
   
   @RequestMapping("deleteBoard.mn")
   public String boardDelete(@RequestParam("bNum") int bnum) {   
      int result = bService.deleteBoard(bnum);
         
      if(result > 0 ) {
         return "redirect:manager_boardList.mn";
      }else {
         throw new BoardException("게시물 삭제에 실패하였습니다.");
      }
   }
   
   @RequestMapping("matchDelete.mn")
   public String matchDelete(@RequestParam("matchNum") int mcNum, @RequestParam("cate") int cate, @SessionAttribute("loginUser") Member m, @ModelAttribute Match match, RedirectAttributes redirect) {
      match.setMemberId(m.getId());
      match.setMatchCate(cate);
      
      int result = mcService.deleteMatch(match);
      if (result > 0) {

         return "redirect:manager_matchList.mn";
      } else {
         throw new MatchException("게시글 삭제에 실패하였습니다.");
      }
   }
   
   @RequestMapping("sellDelete.mn")
   public String sellDelete(@RequestParam("ssNum") int ssNum) {
      int result = ssService.sellshareDelete(ssNum);
      
      if(result > 0) {
         return "redirect:manager_sellshareList.mn";
      } else {
         throw new SellshareException("물품 삭제에 실패하였습니다.");
      }
   }
   
   @RequestMapping("stopTerm.mn")
   public String stopTerm() {
      return "stopTerm";
   }
}