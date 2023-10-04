package com.kh.forcatdog.customerService.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.common.Pagination;
import com.kh.forcatdog.customerService.model.exception.NoticeException;
import com.kh.forcatdog.customerService.model.service.CustomerService;
import com.kh.forcatdog.customerService.model.vo.Notice;
import com.kh.forcatdog.customerService.model.vo.OperationGuide;
import com.kh.forcatdog.customerService.model.vo.QuestionNAnswer;
import com.kh.forcatdog.member.model.vo.Member;

@Controller
public class CustomerServiceController {
	
	@Autowired
	private CustomerService cService;
	
	@RequestMapping("notice.cs")
	public ModelAndView noticeList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;;
		}
		
		int listCount = cService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = (ArrayList<Notice>) cService.selectList(pi);
		
		if(list != null) {
			mv.addObject("listCount", listCount);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("noticeList");
		} else {
			throw new NoticeException("공지사항 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("operation.cs")
	public String operationGuideList(Model model, HttpSession session) {
		
		ArrayList<OperationGuide> list = (ArrayList<OperationGuide>) cService.selectOList();
		
		if(list != null) {
			session.setAttribute("list", list);
			return "operationGuide";
		} else {
			model.addAttribute("message", "목록 조회에 실패하였습니다.");
			return "../common/errorPage.jsp";
		}
	}
	
	@RequestMapping("myQsend.cs")
	public String oneOnOneForm() {
		return "myQuestionWrite";
	}
	
	@RequestMapping("myQuestion.cs")
	public ModelAndView questionList(@RequestParam(value="page", required=false) Integer page, HttpSession session, ModelAndView mv) {
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;;
		}
		
		Member m = (Member)session.getAttribute("loginUser");
		
		String userId = null;
		if(m != null) {
			userId = m.getId();
		}
		
		int listCount = cService.getQListCount(userId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<QuestionNAnswer> list = (ArrayList<QuestionNAnswer>) cService.selectQList(pi, userId);
		
		mv.addObject("listCount", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("myQuestionList");
		
		return mv;
	}
	@RequestMapping("questionList.cs")
	public ModelAndView selectQuestionList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;;
		}
		
		int listCount = cService.getAQListCount();
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<QuestionNAnswer> list = (ArrayList<QuestionNAnswer>) cService.selectQuestionList(pi);
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminQuestionList");
		} else {
			throw new NoticeException("게시글 불러오기에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("nWriteFrom.cs")
	public String noticeWriteForm() {
		return "noticeWrite";
	}
	
	@RequestMapping("nWrite.cs")
	public String noticeWrite(@ModelAttribute Notice n) {
		

		int result = cService.insertNotice(n);
		if(result > 0) {
			return "redirect:managerMain.mn";
		} else {
			throw new NoticeException("게시물 등록에 실패하였습니다.");
		}
		
	}
	
	// 공지 디테일 페이지
	@RequestMapping("ndetail.cs")
	public ModelAndView noticeDetail(@RequestParam("nNum") int nNum, @RequestParam("page") Integer page, ModelAndView mv) {
		
		Notice notice = cService.selectNotice(nNum);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			mv.setViewName("noticeDetail");
		} else {
			throw new NoticeException("공지사항 상세 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 관리자 공지 디테일 
	@RequestMapping("Mdetail.cs")
	public ModelAndView MnoticeDetail(@RequestParam("nNum") int nNum, ModelAndView mv) {
			
		Notice notice = cService.selectNotice(nNum);
			
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.setViewName("MnoticeDetail");
		} else {
			throw new NoticeException("공지사항 상세 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 공지 삭제
	@RequestMapping("ndelete.cs")
	public String noticeDelete(@RequestParam("nNum") int nNum) {
		
		int result = cService.deleteNotice(nNum);
		
		if(result > 0) {
			return "redirect:managerMain.mn";
		} else {
			throw new NoticeException("공지사항 삭제에 실패하였습니다.");
		}
	}
	
	// 공지 업데이트 뷰
	@RequestMapping("nupdateForm.cs")
	public ModelAndView noticeUpdateForm(@RequestParam("nNum") int nNum, ModelAndView mv) {
		
		Notice n = cService.updateNoticeForm(nNum);
		
		if(n != null) {
			mv.addObject("notice", n);
			mv.setViewName("noticeUpdate");
		} else {
			throw new NoticeException("공지사항 수정 폼 불러오기에 실패하였습니다.");
		}
		
		return mv;
	}
	
	// 공지 업데이트
	@RequestMapping("nupdate.cs")
	public String noticeUpdate(@ModelAttribute Notice n) {
		
		int result = cService.updateNotice(n);
		
		if(result > 0) {
			return "redirect:managerMain.mn";
		} else {
			throw new NoticeException("공지사항 수정에 실패하였습니다.");
		}
	}
	
	// 관리자 이용안내 디테일 
	@RequestMapping("MOdetail.cs")
	public ModelAndView MODetail(@RequestParam("opNum") int opNum, ModelAndView mv) {
			
		OperationGuide op = cService.Operationselect(opNum);
			
		if(op != null) {
			mv.addObject("operation", op);
			mv.setViewName("MODetail");
		} else {
			throw new NoticeException("이용안내 상세 조회에 실패하였습니다.");
		}
			
		return mv;
	}
	
	
	// 이용안내 수정
	@RequestMapping("oupdateForm.cs")
	public ModelAndView operationGuideUpdateForm(@RequestParam("opNum") int opNum, ModelAndView mv) {
		
		OperationGuide op = cService.updateOperationGuideForm(opNum);
		
		if(op != null) {
			mv.addObject("op", op);
			mv.setViewName("operationGuideUpdate");
		} else {
			throw new NoticeException("수정 불러오기에 실패하였습니다.");
		}
		return mv;
	}
	
	// 이용안내 작성 폼
	@RequestMapping("operationWriteForm.cs")
	public String opearationGuideWriteForm() {
		return "operationGuideWrite";
	}
	
	// 이용안내 작성
	@RequestMapping("operationWrite.cs")
	public String insertOperationGuide(@RequestParam("memberId") String memberId, @ModelAttribute OperationGuide og) {
		
		og.setMemberId(memberId);
		
		int result = cService.insertOperationGuide(og);
		
		if(result > 0) {
			return "redirect:managerMain.mn";
		} else {
			throw new NoticeException("등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("operationUpdate.cs")
	public String operationUpdate(@ModelAttribute OperationGuide og) {
		int result = cService.operationGuideUpdate(og);
		
		if(result > 0) {
			return "redirect:managerMain.mn";
		} else {
			throw new NoticeException("이용 안내 수정에 실패하였습니다.");
		}
	}
	@RequestMapping("operationDelete.cs")
	public String operationDelete(@RequestParam("opNum") int opNum) {
		int result = cService.deleteOperationGuide(opNum);
		
		if(result > 0) {
			return "redirect:managerMain.mn";
		} else {
			throw new NoticeException("이용 안내 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("qWrite.cs")
	public String questionWrite(@ModelAttribute QuestionNAnswer qna, HttpSession session) {
		Member q = (Member)session.getAttribute("loginUser");
		
		String memberId = q.getId();
		qna.setMemberId(memberId);
		
		int result = cService.insertQuestion(qna);
		
		if(result > 0) {
			return "redirect:myQuestion.cs";
		} else {
			throw new NoticeException("문의사항 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("questionDetail.cs")
	public ModelAndView questionDetail(@RequestParam("qNum") int qNum, ModelAndView mv) {
		
		QuestionNAnswer qna = cService.selectQuestion(qNum);
		
		if(qna != null) {
			mv.addObject("qna", qna);
			mv.setViewName("myQuestionDetail");
		} else {
			throw new NoticeException("상세 보기에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("MquestionDetail.cs")
	public ModelAndView MquestionDetail(@RequestParam("qNum") int qNum, ModelAndView mv) {
		
		QuestionNAnswer qna = cService.selectQuestion(qNum);
		ArrayList<QuestionNAnswer> ans = (ArrayList<QuestionNAnswer>) cService.selectAnswer(qNum);
		
		if(qna != null) {
			mv.addObject("qna", qna);
			mv.addObject("ans", ans);
			mv.setViewName("MQuestionDetail");
		} else {
			throw new NoticeException("상세 보기에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("myQuestionUpdateForm.cs")
	public String questionUpdateForm(@RequestParam("qNum") int qNum, HttpSession session, Model m) {
		
		QuestionNAnswer qna = cService.selectQuestion(qNum);
		
		if(qna != null) {
			m.addAttribute("qna", qna);
			return "myQuestionUpdate";
		} else {
			throw new NoticeException("질문 수정페이지 보기에 실패하였습니다.");
		}
	}
	
	@RequestMapping("questionUpdate.cs")
	public String questionUpdate(@ModelAttribute QuestionNAnswer qna, HttpSession session, Model m) {
		
		int result = cService.updateQuestion(qna);
		
		if(result > 0) {
			int qNum = qna.getQnaNum();
			m.addAttribute("qNum", qNum);
			return "redirect:questionDetail.cs";
		} else {
			throw new NoticeException("게시물 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("myQuestionDelete.cs")
	public String questionDelete(@RequestParam("qNum") int qNum) {
		
		int result = cService.deleteQuestion(qNum);
		
		if(result > 0) {
			return "redirect:myQuestion.cs";
		} else {
			throw new NoticeException("삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("AQuestionDelete.cs")
	public String questionADelete(@RequestParam("qNum") int qNum) {
		
		int result = cService.deleteQuestion(qNum);
		
		if(result > 0) {
			return "redirect:questionList.cs";
		} else {
			throw new NoticeException("삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("myQuestionAnswerForm.cs")
	public String questionAnswerForm(@ModelAttribute QuestionNAnswer q, Model m) {
		int qNum = q.getQnaNum();
		
		QuestionNAnswer qna = cService.selectQuestion(qNum);
		
		
		if(qna != null) {
			m.addAttribute("qna", qna);
			return "myQuestionAnswer";
		} else {
			throw new NoticeException("답변 불러오기에 실패하였습니다.");
		}
	}
	
	@RequestMapping("myQuestionAnswer.cs")
	public String insertAnswer(@ModelAttribute QuestionNAnswer qna, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userId = m.getId();
		
		qna.setMemberId(userId);
		
		System.out.println(qna);
		int result = cService.insertAnswer(qna);
		if(result > 0) {
			return "redirect:qnaManagerPage.mn";
		} else {
			throw new NoticeException("답변 등록에 실패하였습니다. ");
		}
	}
	
	@RequestMapping("mndetail.cs")
	public String mainNoticeDetail(@RequestParam("nNum") int nNum, Model m) {
		
		Notice notice = cService.selectNotice(nNum);
		
		if(notice != null) {
			m.addAttribute("notice", notice);
			return "noticeDetail";
		} else {
			throw new NoticeException("공지사항 상세 조회에 실패하였습니다.");
		}
	}
}
