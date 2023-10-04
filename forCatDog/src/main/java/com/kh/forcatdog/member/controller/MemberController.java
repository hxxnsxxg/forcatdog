package com.kh.forcatdog.member.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.common.FileIO;
import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.common.Pagination;
import com.kh.forcatdog.common.SessionMoniter;
import com.kh.forcatdog.match.model.service.MatchService;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.match.model.vo.MatchMember;
import com.kh.forcatdog.member.model.exception.MemberException;
import com.kh.forcatdog.member.model.service.MemberService;
import com.kh.forcatdog.member.model.vo.License_Quiz;
import com.kh.forcatdog.member.model.vo.MatchChat;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private MatchService mcService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@RequestMapping("joinForm.me")
	public String joinForm(Model model) {
		ArrayList<Map<Integer, String>> listMap = (ArrayList<Map<Integer, String>>) mService.selectPWHint();
		ArrayList<String> sidoList = (ArrayList<String>) mService.selectSido();

		model.addAttribute("pwHint", listMap);
		model.addAttribute("location1", sidoList);

		return "joinMemberPage";
	}

	@RequestMapping("checkId.me")
	@ResponseBody
	public boolean checkId(@RequestBody HashMap<String, String> map) {
		int result = mService.selectId(map);

		if (result > 0) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("checkNickname.me")
	@ResponseBody
	public boolean checkNickname(@RequestBody HashMap<String, String> map) {
		int result = mService.selectNickname(map);

		if (result > 0) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("location.me")
	@ResponseBody
	public ArrayList<String> selectLocation(@RequestBody HashMap<String, String> map) {
		ArrayList<String> list = null;

		if (map.get("sido") != null && map.get("sigungu") == null) {
			list = (ArrayList<String>) mService.selectSiGunGu(map);
		} else if (map.get("sigungu") != null) {
			list = (ArrayList<String>) mService.selectDong(map);
		}

		return list;
	}

	@RequestMapping("join.me")
	public String join(@ModelAttribute Member m) {
		m.setPw(bcrypt.encode(m.getPw()));
		int result = mService.insertMember(m);

		if (result > 0) {
			return "redirect:/";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}

	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "loginPage";
	}

	@RequestMapping("login.me")
	public String login(@ModelAttribute Member m, HttpSession session, RedirectAttributes redirect) {
		Member loginUser = mService.selectMember(m);
		
		if (loginUser != null && bcrypt.matches(m.getPw(), loginUser.getPw())) {
			if(loginUser.getStatus().equals("Y")) {
				if (SessionMoniter.checkLoginId(loginUser)) {
					String admin = loginUser.getAdminQ();
					if (admin.equals("N")) {
						session.setAttribute("loginUser", loginUser);
						return "redirect:/";
					} else {
						session.setAttribute("loginUser", loginUser);
						return "redirect:managerMain.mn";
					}
				} else {
					redirect.addFlashAttribute("msg", "이미 로그인된 사용자입니다.");
					redirect.addFlashAttribute("path", session.getServletContext().getContextPath() + "/");
					return "redirect:alert.do";
				}
			} else if(loginUser.getStatus().equals("P")) {
				Calendar c = Calendar.getInstance();
				String year = String.valueOf(c.get(Calendar.YEAR));
				String month = String.valueOf(c.get(Calendar.MONTH) + 1);
				String day = String.valueOf(c.get(Calendar.DAY_OF_MONTH));
				
				if(loginUser.getUpdateDate().compareTo(Date.valueOf(year + "-" + month + "-" + day)) < 0) {
					int result = mService.updateStopMember(loginUser.getId());
					if(result > 0) {
							String admin = loginUser.getAdminQ();
						if (admin.equals("N")) {
							session.setAttribute("loginUser", loginUser);
							return "redirect:/";
						} else {
							session.setAttribute("loginUser", loginUser);
							return "redirect:managerMain.mn";
						}
					} else {
						throw new MemberException("로그인중 오류가 발생 했습니다.");
					}
				} else {
					redirect.addFlashAttribute("msg", "정지된 사용자입니다.");
					redirect.addFlashAttribute("path", session.getServletContext().getContextPath() + "/");
					return "redirect:alert.do";
				}
			} else {
				throw new MemberException("로그인에 실패했습니다.");
			}
		} else {
			throw new MemberException("로그인에 실패했습니다.");
		}
	}

	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping("myPage.me")
	public String myPage(HttpSession session, Model model) {
		Member m = mService.selectMember(((Member) session.getAttribute("loginUser")));

		if (m == null) {
			throw new MemberException("로그인에 실패했습니다.");
		}

		ArrayList<MyPet> mpList = (ArrayList<MyPet>) mService.selectMyPetList(m);

		model.addAttribute("memberInfo", m);
		model.addAttribute("mpList", mpList);

		return "myPage";
	}

	@RequestMapping("mUpdateForm.me")
	public String memberUpdateForm(HttpSession session, Model model) {
		Member m = mService.selectMember(((Member) session.getAttribute("loginUser")));

		if (m == null) {
			throw new MemberException("로그인에 실패했습니다.");
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sido", m.getAddr1());
		map.put("sigungu", m.getAddr2());

		ArrayList<Map<Integer, String>> listMap = (ArrayList<Map<Integer, String>>) mService.selectPWHint();
		ArrayList<String> sidoList = (ArrayList<String>) mService.selectSido();
		ArrayList<String> sigunguList = (ArrayList<String>) mService.selectSiGunGu(map);
		ArrayList<String> dongList = (ArrayList<String>) mService.selectDong(map);

		model.addAttribute("memberInfo", m);
		model.addAttribute("pwHint", listMap);
		model.addAttribute("location1", sidoList);
		model.addAttribute("location2", sigunguList);
		model.addAttribute("location3", dongList);

		return "updateMyInfo";
	}

	@RequestMapping("mUpdate.me")
	public String memberUpdate(HttpSession session, @ModelAttribute Member m) {
		int result = mService.updateMember(m);

		if (result > 0) {
			session.setAttribute("loginUser", mService.selectMember(m));
			return "redirect:myPage.me";
		} else {
			throw new MemberException("회원정보 수정에 실패했습니다.");
		}
	}

	@RequestMapping("updatePwForm.me")
	public String pwUpdateForm() {

		return "updatePw";
	}

	@RequestMapping("updatePw.me")
	public String pwUpdate(@SessionAttribute("loginUser") Member m, @RequestParam("userPw") String pw, @RequestParam("newPw") String newPw, RedirectAttributes redirect) {
		m = mService.selectMember(m);

		if (m == null) {
			throw new MemberException("로그인에 실패했습니다.");
		}

		if (bcrypt.matches(pw, m.getPw())) {
			m.setPw(bcrypt.encode(newPw));
			int result = mService.updatePw(m);

			if (result > 0) {
				redirect.addFlashAttribute("msg", "비밀번호가 변경되었습니다.");
				redirect.addFlashAttribute("path", "javascript:self.close();");

				return "redirect:alert.do";
			} else {
				throw new MemberException("비밀번호 수정에 실패하였습니다.");
			}
		} else {
			throw new MemberException("현재 비밀번호가 일치하지 않습니다.");
		}
	}

	@RequestMapping("insertPetForm.me")
	public String insertPetForm() {
		return "insertPet";
	}

	@RequestMapping("insertPet.me")
	public String insertPet(@ModelAttribute MyPet mp, @RequestParam("petImg") MultipartFile petImg, HttpServletRequest request, RedirectAttributes redirect) {

		if (petImg != null && !petImg.isEmpty()) {
			String changeFileName = FileIO.saveFile(petImg, request, "mpetUploadFiles");
			mp.setOriginFileName(petImg.getOriginalFilename());
			mp.setChangeFileName(changeFileName);
		}

		int result = mService.insertMyPet(mp);
		if (result > 1) {
			redirect.addFlashAttribute("msg", "마이펫이 등록되었습니다.");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			redirect.addFlashAttribute("action", "window.opener.location.reload();");

			return "redirect:alert.do";
		} else {
			throw new MemberException("마이펫 등록에 실패하였습니다.");
		}
	}

	@RequestMapping("petInfo.me")
	public String petInfo(@RequestParam("petNum") int petNum, Model model) {
		MyPet mp = mService.selectMyPet(petNum);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("petType", mp.getPetType1());
		ArrayList<String> list = (ArrayList<String>) mService.selectPetType(map);

		model.addAttribute("mp", mp);
		model.addAttribute("petType", list);

		return "petInfo";
	}

	@RequestMapping("updatePet.me")
	public String updatePet(@ModelAttribute MyPet mp, @RequestParam("petImg") MultipartFile petImg, HttpServletRequest request, RedirectAttributes redirect) {

		if (petImg != null && !petImg.isEmpty()) {
			String changeFileName = FileIO.saveFile(petImg, request, "mpetUploadFiles");
			mp.setOriginFileName(petImg.getOriginalFilename());
			mp.setChangeFileName(changeFileName);
		}

		int result = mService.updateMyPet(mp);
		if ((result > 1 && !petImg.isEmpty()) || (result > 0 && petImg.isEmpty())) {
			redirect.addFlashAttribute("msg", "마이펫이 수정되었습니다.");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			redirect.addFlashAttribute("action", "window.opener.location.reload();");

			return "redirect:alert.do";
		} else {
			throw new MemberException("마이펫 수정에 실패하였습니다.");
		}
	}

	@RequestMapping("petDelete.me")
	public String deletePet(@SessionAttribute("loginUser") Member m, @RequestParam("petNum") int petNum, RedirectAttributes redirect) {
		MyPet mp = new MyPet();
		mp.setPetNum(petNum);
		mp.setMemberId(m.getId());
		int result = mService.deleteMyPet(mp);

		if (result > 0) {
			redirect.addFlashAttribute("msg", "마이펫이 삭제되었습니다.");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			redirect.addFlashAttribute("action", "window.opener.location.reload();");

			return "redirect:alert.do";
		} else {
			throw new MemberException("마이펫 삭제에 실패하였습니다.");
		}
	}

	@RequestMapping("mProfileImg.me")
	@ResponseBody
	public boolean setProfileImg(@SessionAttribute("loginUser") Member m, @RequestParam("profileImg") MultipartFile profileImg, HttpServletRequest request) {

		if (profileImg != null && !profileImg.isEmpty()) {
			String changeFileName = FileIO.saveFile(profileImg, request, "mprofileUploadFiles");
			m.setOriginFileName(profileImg.getOriginalFilename());
			m.setChangeFileName(changeFileName);
		}

		int result = mService.mergeProfileImg(m);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("petList.me")
	public String myPetList(@SessionAttribute("loginUser") Member m, @RequestParam(value = "page", required = false) Integer page, Model model) {

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = mService.getMyPetListCount(m);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<MyPet> mpList = (ArrayList<MyPet>) mService.selectMyPetAllList(m, pi);

		if (mpList != null) {
			model.addAttribute("mpList", mpList);
			model.addAttribute("pi", pi);

			return "myPetList";
		} else {
			throw new MemberException("마이펫 목록 조회에 실패하였습니다.");
		}
	}

	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "findId";
	}

	@RequestMapping("findId.me")
	public String findId(@ModelAttribute Member m, Model model) {

		Member member = mService.findMyId(m);

		if (member != null) {
			model.addAttribute("member", member);
			return "completeId";
		} else {
			throw new MemberException("아이디 찾기에 실패하였습니다.");
		}
	}

	@RequestMapping("findPwdForm.me")
	public String findPwdForm(Model m) {

		ArrayList<Map<Integer, String>> listMap = (ArrayList<Map<Integer, String>>) mService.selectPWHint();

		if (listMap != null) {
			m.addAttribute("pwHint", listMap);
			return "findPwd";
		} else {
			throw new MemberException("지금은 비밀번호 찾기를 할 수 없습니다.");
		}
	}

	@RequestMapping("findPwd.me")
	public String findPwd(@ModelAttribute Member m, Model model) {

		Member member = mService.findMyPwd(m);

		if (member != null) {
			model.addAttribute("member", member);
			return "findChangePwd";
		} else {
			throw new MemberException("비밀번호 찾기에 실패하였습니다.");
		}
	}

	@RequestMapping("findChangePwd.me")
	public String findChangePwd(@RequestParam("id") String id, @RequestParam("newPwd1") String pwd, @RequestParam("name") String name, Model model) {

		Member m = new Member();
		m.setId(id);
		m.setPw(bcrypt.encode(pwd));

		int result = mService.findChangePwd(m);

		if (result > 0) {
			model.addAttribute("name", name);
			return "completePwd";
		} else {
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
		}
	}

	@RequestMapping("Applytest.me")
	public String goTestInform() {
		return "testApply";
	}

	@RequestMapping("testConfirm.me")
	public String goTestConfirm() {
		return "testConfirm";
	}

	@RequestMapping("selectTest.me")
	public ModelAndView goTest(@RequestParam("cate") String cate, ModelAndView mv) {

		List<License_Quiz> qList = mService.selectTest(cate);

		if (qList != null) {
			mv.addObject("qList", qList);
			mv.setViewName("licenseTest");
		} else {
			throw new MemberException("시험 응시에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("checkTest.me")
	public String checkTest(@ModelAttribute License_Quiz qa, Model model, HttpSession session, RedirectAttributes redirect) {

		int result = -1;
		result = mService.checkTest(qa.getcList());

		String resultMsg = "";
		if (result > -1) {
			if (result >= 6) {
				Member loginUser = (Member) session.getAttribute("loginUser");
				String id = loginUser.getId();
				int change = mService.chageQuiz_Status(id);

				if (change > 0) {
					loginUser.setPetQ("Y");
					resultMsg = "통과하였습니다.";
				} else {
					throw new MemberException("사용자 상태 변경 실패하였습니다.");
				}
			} else {
				resultMsg = "탈락하였습니다.";
			}
		} else {
			throw new MemberException("시험 채점에 실패하였습니다.");
		}

		redirect.addFlashAttribute("msg", resultMsg);
		redirect.addFlashAttribute("path", "myPage.me");

		return "redirect:alert.do";
	}

	@RequestMapping("matchList.me")
	public String matchList(@SessionAttribute("loginUser") Member m, @RequestParam(value = "option", required = false) String option, Model model) {

		if (option == null) {
			option = "P";
		}

		m.setStatus(option);

		ArrayList<Match> list = (ArrayList<Match>) mcService.selectPMatchList(m);

		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("option", option);

			return "matchManagement";
		} else {
			throw new MemberException("매칭 목록 조회에 실패하였습니다.");
		}

	}

	@RequestMapping("reqInfo.me")
	public String reqInfoView(@RequestParam("matchNum") int matchNum, @RequestParam("memberId") String id, @RequestParam("option") String option, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("matchNum", matchNum);
		map.put("id", id);
		
		String nickName = mService.selectMemberNickname(id);
		
		String matchContent = mcService.selectMatchContent(map);

		ArrayList<MyPet> petList = (ArrayList<MyPet>) mcService.selectMatchPetList(map);
		if (petList != null) {
			model.addAttribute("matchNum", matchNum);
			model.addAttribute("option", option);
			model.addAttribute("id", id);
			model.addAttribute("nickName", nickName);
			model.addAttribute("petList", petList);
			model.addAttribute("matchContent", matchContent);
			return "matchPetInfo";
		} else {
			throw new MemberException("매칭 펫 목록 조회에 실패하였습니다.");
		}
	}

	@RequestMapping("acceptMatch.me")
	public String acceptMatch(@SessionAttribute("loginUser") Member m, @ModelAttribute MatchMember mm, RedirectAttributes redirect) {

		int result = mcService.acceptMatch(mm);

		if (result > 0) {
			redirect.addFlashAttribute("msg", "매칭을 수락하였습니다.");
			redirect.addFlashAttribute("action", "window.opener.location.reload();");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			return "redirect:alert.do";
		} else {
			throw new MemberException("매칭 수락에 실패하였습니다.");
		}

	}

	@RequestMapping("rejectMatch.me")
	public String rejectMatch(@SessionAttribute("loginUser") Member m, @ModelAttribute MatchMember mm, RedirectAttributes redirect) {
		int result = mcService.rejectMatch(mm);

		if (result > 0) {
			redirect.addFlashAttribute("msg", "매칭을 거절하였습니다.");
			redirect.addFlashAttribute("action", "window.opener.location.reload();");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			return "redirect:alert.do";
		} else {
			throw new MemberException("매칭 거절에 실패하였습니다.");
		}
	}

	@RequestMapping("reqMatchList.me")
	public String reqMatchListView(@SessionAttribute("loginUser") Member m, @RequestParam(value = "option", required = false) String option, Model model) {
		if (option == null) {
			option = "P";
		}

		m.setStatus(option);

		ArrayList<Match> list = (ArrayList<Match>) mcService.selectRMatchList(m);

		if (list != null) {
			model.addAttribute("list", list);
			model.addAttribute("option", option);

			return "requestManagement";
		} else {
			throw new MemberException("매칭 목록 조회에 실패하였습니다.");
		}
	}

	@RequestMapping("matchChat.me")
	public String getChatViewPage(@SessionAttribute("loginUser") Member loginMember, @RequestParam("matchNum") int matchNum, @RequestParam("memberId") String memberId, @RequestParam("nickName") String nickName, @RequestParam("option2") String option2, Model model) {

		if (loginMember != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("matchNum", matchNum);
			map.put("id1", loginMember.getId());
			map.put("id2", memberId);
			
			ArrayList<MatchChat> chatList = (ArrayList<MatchChat>) mcService.selectChatLog(map);
			Collections.reverse(chatList);

			Member m = mService.selectChatMemberInfo(memberId);
//			m.setId(memberId);
//			m.setNickName(nickName);

			model.addAttribute("matchNum", matchNum);
			model.addAttribute("option", option2);
			model.addAttribute("member", m);
			model.addAttribute("chatList", chatList);

			return "matchChat";
		} else {
			throw new MemberException("채팅 입장에 실패하였습니다.");
		}
	}

	@RequestMapping("selectPetType.me")
	@ResponseBody
	public ArrayList<String> selectPetType(@RequestBody HashMap<String, String> map) {
		ArrayList<String> list = (ArrayList<String>) mService.selectPetType(map);

		return list;
	}
	
	@RequestMapping("matchSuccess.me")
	@ResponseBody
	public boolean matchSuccess(@RequestBody HashMap<String, Object> map) {
		int result = mcService.matchSuccess(map);
		
		if(result >= 2) {
			return true;
		} else {
			return false;
		}
	}

}
