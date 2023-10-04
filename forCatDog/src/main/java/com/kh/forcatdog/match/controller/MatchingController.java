package com.kh.forcatdog.match.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.common.Pagination;
import com.kh.forcatdog.match.model.exception.MatchException;
import com.kh.forcatdog.match.model.service.MatchService;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.member.model.exception.MemberException;
import com.kh.forcatdog.member.model.service.MemberService;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.member.model.vo.MyPet;

@Controller
public class MatchingController {

	@Autowired
	private MatchService mcService;
	
	@Autowired
	private MemberService mService;

	@RequestMapping("findMatchList.mc")
	public String findMatchList(@RequestParam("cate") int cate, @RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int listCount = mcService.getFindMatchListCount(cate);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Match> mList = (ArrayList<Match>) mcService.selectFindMatchList(cate, pi);

		if (mList != null) {

			model.addAttribute("listCount", listCount);
			model.addAttribute("mList", mList);
			model.addAttribute("pi", pi);
			model.addAttribute("cate", cate);

			if (cate == 1) {
				return "FindMatch";
			} else if (cate == 2) {
				return "FindMate";
			} else if (cate == 3) {
				return "FindPetSitter";
			} else {
				throw new MatchException("게시글 리스트 조회에 실패하였습니다");
			}
		} else {
			throw new MatchException("게시글 리스트 조회에 실패하였습니다");
		}
	}

	@RequestMapping("insertMatchForm.mc")
	public String insertMatchView(@RequestParam("cate") int cate, Model model) {
		model.addAttribute("cate", cate);

		if (cate == 1) {
			return "insertMatch";
		} else if (cate == 2) {
			return "insertMate";
		} else if (cate == 3) {
			return "insertPetsitter";
		} else {
			throw new MatchException("게시글 쓰기 진입에 실패하였습니다");
		}
	}

	@RequestMapping("insertMatch.mc")
	public String insertMatch(@SessionAttribute("loginUser") Member m, @ModelAttribute Match match) {
		match.setMemberId(m.getId());

		int result = mcService.insertMatch(match);

		if (result > match.getPetList().size()) {
			return "redirect:findMatchList.mc?cate=" + match.getMatchCate();
		} else {
			throw new MatchException("등록에 실패하였습니다");
		}

	}

	@RequestMapping("findMatchDetail.mc")
	public String MatchDetail(@RequestParam int mcNum, Model model) {

		Match match = mcService.selectMatchDetail(mcNum);
		int matchCount = mcService.selectMatchCount(mcNum);
		int matchYCount = mcService.selectMatchYCount(mcNum);
		
		if (match != null) {
			model.addAttribute("mc", match);
			model.addAttribute("matchCount", matchCount);
			model.addAttribute("matchYCount", matchYCount);

			int cate = match.getMatchCate();

			if (cate == 1) {
				return "FindMatchDetail";
			} else if (cate == 2) {
				return "FindMateDetail";
			} else if (cate == 3) {
				return "FindPetSitterDetail";
			} else {
				throw new MatchException("조회에 실패하였습니다");
			}
		} else {
			throw new MatchException("조회에 실패하였습니다");
		}

	}

	@RequestMapping("matchUpdateForm.mc")
	public String matchUpdateView(@RequestParam("matchNum") int mcNum, Model model) {
		Match match = mcService.selectUpdateMatch(mcNum);

		if (match != null) {
			model.addAttribute("mc", match);

			int cate = match.getMatchCate();

			if (cate == 1) {
				return "MatchUpdate";
			} else if (cate == 2) {
				return "MateUpdate";
			} else if (cate == 3) {
				return "PetSitterUpdate";
			} else {
				throw new MatchException("조회에 실패하였습니다");
			}
		} else {
			throw new MatchException("게시글 조회에 실패하였습니다.");
		}
	}

	@RequestMapping("updateMatch.mc")
	public String matchUpdate(@SessionAttribute("loginUser") Member m, @ModelAttribute Match match) {
		match.setMemberId(m.getId());

		int result = mcService.updateMatch(match);

		if (result > 0) {
			return "redirect:findMatchList.mc?cate=" + match.getMatchCate();
		} else {
			throw new MatchException("게시글 수정에 실패하였습니다.");
		}
	}

	@RequestMapping("matchDelete.mc")
	public String matchDelete(@RequestParam("matchNum") int mcNum, @RequestParam("cate") int cate, @SessionAttribute("loginUser") Member m, @ModelAttribute Match match, RedirectAttributes redirect) {
		match.setMemberId(m.getId());
		match.setMatchCate(cate);
		
		int result = mcService.deleteMatch(match);
		if (result > 0) {
			redirect.addFlashAttribute("msg", "게시글이 삭제되었습니다.");
			redirect.addFlashAttribute("path", "findMatchList.mc?cate=" + match.getMatchCate());

			return "redirect:alert.do";
		} else {
			throw new MatchException("게시글 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("matchPetSelect.mc")
	public String matchPetSelect(@SessionAttribute("loginUser") Member m, @RequestParam(value = "num", required = false) Integer num, @RequestParam(value = "page", required = false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getMyPetListCount(m);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MyPet> mpList = (ArrayList<MyPet>) mService.selectMyPetAllList(m, pi);
		
		if(mpList != null) {
			model.addAttribute("mpList", mpList);
			model.addAttribute("pi", pi);
			
			if(num != null) {
				model.addAttribute("num", num);
			}
			
			return "selectMyPet";
		} else {
			throw new MemberException("마이펫 목록 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("MatchingPopup.mc")
	public String matchingPopup(@SessionAttribute("loginUser") Member m, @RequestParam("matchNum") int matchNum, @RequestParam("matchCate") int matchCate, @RequestParam(value = "checkPet", required = false) ArrayList<String> checkPet, @RequestParam(value = "page", required = false) Integer page, Model model, RedirectAttributes redirect) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", m.getId());
		map.put("matchNum", matchNum);
		int result = mcService.searchMatchMember(map);
		
		if(result <= 0) {
			model.addAttribute("matchNum", matchNum);
			model.addAttribute("matchCate", matchCate);
			if(matchCate == 3) {
				return "MatchingPopup3";
			}
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			int listCount = mService.getMyPetListCount(m);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			ArrayList<MyPet> mpList = (ArrayList<MyPet>) mService.selectMyPetAllList(m, pi);
			
			model.addAttribute("mpList", mpList);
			model.addAttribute("pi", pi);
			
			if(matchCate == 1) {
				return "MatchingPopup1";
			} else if(matchCate == 2) {
				if(checkPet != null) {
					model.addAttribute("checkPet", checkPet);
				}
				return "MatchingPopup2";
			} else {
				throw new MatchException("카테고리 오류 발생");
			}
		} else {
			redirect.addFlashAttribute("msg", "이미 신청하였습니다.");
			redirect.addFlashAttribute("action", "window.opener.location.reload();");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			
			return "redirect:alert.do";
		}
	}
	
	@RequestMapping("matchMember.mc")
	public String matchMember(@SessionAttribute("loginUser") Member m, @RequestParam("matchNum") int matchNum, @RequestParam(value = "petNum", required = false) ArrayList<Integer> petNum, @RequestParam("mContent") String mContent, RedirectAttributes redirect) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", m.getId());
		map.put("matchNum", matchNum);
		map.put("petNum", petNum);
		map.put("mContent", mContent);
		
		int result = mcService.matchMember(map);
		
		if(result > 0) {
			redirect.addFlashAttribute("msg", "매칭 신청에 성공하였습니다.");
			redirect.addFlashAttribute("path", "javascript:self.close();");
			
			return "redirect:alert.do";
		} else {
			throw new MatchException("매칭 신청에 실패하였습니다.");
		}
	}
	
//	@RequestMapping("matchInfoView.mc")
//	@ResponseBody
//	public ArrayList<MyPet> matchInfoView(@SessionAttribute("loginUser") Member m, @RequestBody HashMap<String, String> map) {
//		map.put("id", m.getId());
//		
//		ArrayList<MyPet> list = (ArrayList<MyPet>) mcService.selectMatchInfo(map);
//		
//		return list;
//	}
//	
//	@RequestMapping("matchReqInfoView.mc")
//	@ResponseBody
//	public ArrayList<MyPet> matchReqInfoVIew(@RequestBody HashMap<String, String> map) {
//		ArrayList<MyPet> list = (ArrayList<MyPet>) mcService.selectMatchInfo(map);
//		return list;
//	}
	
	@RequestMapping("infoMatch.mc")
	public String infoMatch(@RequestParam(value = "cate", required = false) Integer cate, @RequestParam(value = "infoId", required = false) String infoId, @SessionAttribute("loginUser") Member m, @RequestParam(value = "page", required = false) Integer page, Model model) {
		if(cate == null) {
			cate = 1;
		}
		if(infoId == null) {
			infoId = m.getId();
		}
		if (page == null) {
			page = 1;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cate", cate);
		map.put("infoId", infoId);
		
		int listCount = mcService.getInfoMatchListCount(map);
		PageInfo pi = Pagination.getPageInfo(page, listCount);
		ArrayList<Match> mList = (ArrayList<Match>) mcService.selectInfoMatchList(map, pi);
		
		if(mList != null) {
			model.addAttribute("infoCheck", true);
			model.addAttribute("listCount", listCount);
			model.addAttribute("mList", mList);
			model.addAttribute("pi", pi);
			model.addAttribute("cate", cate);

			if (cate == 1) {
				return "InfoMatch";
			} else if (cate == 2) {
				return "InfoMate";
			} else if (cate == 3) {
				return "InfoPetSitter";
			} else {
				throw new MatchException("게시글 리스트 조회에 실패하였습니다");
			}
		} else {
			throw new MatchException("매치 리스트 조회 실패");
		}
		
		
	}
}
