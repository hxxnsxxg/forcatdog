package com.kh.forcatdog.message.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.common.Pagination;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.message.model.exception.MessageException;
import com.kh.forcatdog.message.model.service.MessageService;
import com.kh.forcatdog.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	private MessageService msService;
	
	@RequestMapping("messageListForm.ms")
	public String messageListView(@SessionAttribute("loginUser") Member loginUser, @RequestParam(value = "page", required = false) Integer page, Model model) {
		String loginId = loginUser.getId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = msService.getMessageListCount(loginId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Message> list = (ArrayList<Message>) msService.selectMessageList(loginId, pi);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			return "messageList";
		} else {
			throw new MessageException("쪽지목록 조회 실패");
		}
	}
	
	@RequestMapping("sendMessageForm.ms")
	public String sendMessageView(@RequestParam(value = "userId", required = false) String userId, @RequestParam(value = "nickName", required = false) String nickName, @RequestParam(value = "idCheck", required = false) String idCheck, Model model) {
		model.addAttribute("memberId", userId);
		model.addAttribute("nickName", nickName);
		model.addAttribute("idCheck", idCheck);
		
		return "sendMessageForm";
	}
	
	@RequestMapping("searchUser.ms")
	@ResponseBody
	public ArrayList<Member> searchUser(@RequestParam("keyword") String keyword) {
		return (ArrayList<Member>) msService.searchUser(keyword);
	}
	
	@RequestMapping("sendMessage.ms")
	public String sendMessage(@ModelAttribute Message msg, @RequestParam("idCheck") String idCheck, RedirectAttributes redirect) {
		
		int result = msService.sendMessage(msg);
		
		if(result > 0) {
			if(idCheck.equals("N")) {
				return "redirect:messageListForm.ms";
			} else {
				redirect.addFlashAttribute("msg", "쪽지를 보냈습니다.");
				redirect.addFlashAttribute("path", "javascript:self.close();");
				if(idCheck.equals("D")) {
					redirect.addFlashAttribute("action", "opener.location.href = opener.location.href;");
				}
				return "redirect:alert.do";
			}
		} else {
			throw new MessageException("쪽지 보내기 실패");
		}
		
	}
	
	@RequestMapping("searchUserForm.ms")
	public String searchUserView() {
		return "searchUser";
	}
	
	@RequestMapping("searchAllUser.ms")
	@ResponseBody
	public HashMap<String, Object> searchAllUser(@RequestParam("keyword") String keyword, @RequestParam(value = "page", required = false) Integer page) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = msService.getUserListCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Member> list = (ArrayList<Member>) msService.searchUserList(keyword, pi);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		return map;
	}
	
	@RequestMapping("messageDetail.ms")
	public String messageDetail(@SessionAttribute("loginUser") Member m, @RequestParam("mNum") int mNum, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", m.getId());
		map.put("mNum", mNum);
		
		Message msg = msService.selectMessage(map);
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			return "messageDetail";
		} else {
			throw new MessageException("쪽지 조회 실패");
		}
	}
	
	@RequestMapping("deleteMessage.ms")
	public String deleteMessage(@SessionAttribute("loginUser") Member m, @RequestParam("mNumCBox") ArrayList<Integer> list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", m.getId());
		map.put("list", list);
		
		int result = msService.deleteMessage(map);
		
		if(result > 0) {
			return "redirect:messageListForm.ms";
		} else {
			throw new MessageException("쪽지 삭제 실패");
		}
		
	}
	
	@RequestMapping("nonReadMessageCount.ms")
	@ResponseBody
	public int nonReadMessageCount(@SessionAttribute("loginUser") Member m) {
		return msService.nonReadMessageCount(m);
	}
	
}
