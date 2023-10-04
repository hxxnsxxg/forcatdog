package com.kh.forcatdog.sellshare.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.common.FileIO;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.sellshare.model.exception.SellshareException;
import com.kh.forcatdog.sellshare.model.service.SellshareService;
import com.kh.forcatdog.sellshare.model.vo.PageInfo;
import com.kh.forcatdog.sellshare.model.vo.Pagination;
import com.kh.forcatdog.sellshare.model.vo.SComment;
import com.kh.forcatdog.sellshare.model.vo.Sellshare;
import com.kh.forcatdog.sellshare.model.vo.SellshareFile;

@Controller
public class SellshareController {
	
	@Autowired
	private SellshareService ssService;
	
	@RequestMapping("sell.ss")
	public String sellList(@RequestParam(value = "page", required = false) Integer page, Model model, HttpServletResponse response) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ssService.getSellListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Sellshare> ssList = (ArrayList<Sellshare>) ssService.selectSellList(pi);
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
		
		//쿠키 생성
		Cookie cookie = new Cookie("sellView", null); 	//view라는 이름의 쿠키 생성
		try {
			cookie.setComment(URLEncoder.encode("팔아요 조회 확인","UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}				//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24*365);					//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);						//사용자에게 해당 쿠키를 추가
		
		if(ssList != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("ssList", ssList);
			model.addAttribute("pi", pi);
			model.addAttribute("location1",sidoList);
			return "sell";
		} else {
			throw new SellshareException("목록 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("share.ss")
	public String shareList(@RequestParam(value = "page", required = false) Integer page, Model model, HttpServletResponse response) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ssService.getShareListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Sellshare> ssList2 = (ArrayList<Sellshare>) ssService.selectShareList(pi);
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
		
		//쿠키 생성
		Cookie cookie = new Cookie("shareView",null); 	//view라는 이름의 쿠키 생성
		try {
			cookie.setComment(URLEncoder.encode("나눠요 조회 확인","UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}				//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24*365);					//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);						//사용자에게 해당 쿠키를 추가
		
		if(ssList2 != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("ssList2", ssList2);
			model.addAttribute("pi", pi);
			model.addAttribute("location1", sidoList);
			return "share";
		} else {
			throw new SellshareException("목록 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("sellSearch.ss")
	public String sellSearch(@RequestParam(value = "page", required = false) Integer page, @RequestParam("word") String word, Model model, HttpServletRequest request) {
		String addr1 = request.getParameter("addr1");
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("addr1", addr1);
		map.put("word", word);

		int listCount = ssService.getSellListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sellshare> ssList = (ArrayList<Sellshare>) ssService.searchSellList(pi,map);
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
	
		if(ssList != null) {
			model.addAttribute("ssList", ssList);
			model.addAttribute("pi", pi);
			model.addAttribute("location1", sidoList);
			model.addAttribute("addr1", addr1);
			model.addAttribute("word", word);
			return "sell";
		} else {
			throw new SellshareException("팔아요 검색에 실패하였습니다.");
		}
	}
	
	@RequestMapping("shareSearch.ss")
	public String shareSearch(@RequestParam(value = "page", required = false) Integer page, @RequestParam("word") String word, Model model, HttpServletRequest request) {
		String addr1 = request.getParameter("addr1");
				
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("addr1", addr1);
		map.put("word", word);
		
		int listCount = ssService.getShareListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Sellshare> ssList2 = (ArrayList<Sellshare>) ssService.searchShareList(pi,map);
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
		
		if(ssList2 != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("ssList2", ssList2);
			model.addAttribute("pi", pi);
			model.addAttribute("addr1", addr1);
			model.addAttribute("location1",sidoList);
			model.addAttribute("word", word);
			return "share";
		} else {
			throw new SellshareException("나눠요 검색에 실패하였습니다.");
		}
	}
	
	@RequestMapping("sellWriteForm.ss")
	public String sellWriteForm(Model model, @ModelAttribute Sellshare ss) {
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
		
		model.addAttribute("location1",sidoList);
		model.addAttribute("ss", ss);
		return "sell_write";
	}
	
	@RequestMapping("shareWriteForm.ss")
	public String shareWriteForm(Model model, @ModelAttribute Sellshare ss) {
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
		
		model.addAttribute("location1",sidoList);
		model.addAttribute("ss", ss);
		return "share_write";
	}
	
	@RequestMapping("sellWrite.ss")
	public String sellWrite(@SessionAttribute("loginUser") Member m, @RequestParam("mainImg") boolean mainImg, @RequestParam(value = "setFile", required = false) ArrayList<MultipartFile> fileList, @ModelAttribute Sellshare ss, HttpServletRequest request, RedirectAttributes redirect) {
		
		ss.setMemberId(m.getId());
		
		ArrayList<SellshareFile> fileName = new ArrayList<SellshareFile>();

		int checkCount = 0;
		if(fileList != null && !(fileList.size() <= 0)) {
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "sellshareUploadFiles");
				SellshareFile ssf = new SellshareFile();
				ssf.setOriginalFileName(file.getOriginalFilename());
				ssf.setChangeFileName(changeFileName);
				if(mainImg) {
					ssf.setStatus("M");
					mainImg = false;
				}
				fileName.add(ssf);
			}
			ss.setFileList(fileName);
			checkCount += fileList.size();
		}
		int result = ssService.insertSellshare(ss);
		if(result > checkCount) {
			redirect.addFlashAttribute("msg", "물품 등록이 완료되었습니다.");
			redirect.addFlashAttribute("path", "sell.ss");
			
			return "redirect:alert.do";
		} else {
			throw new SellshareException("물품 등록에 실패하였습니다.");
		}
	}
	@RequestMapping("shareWrite.ss")
	public String shareWrite(@SessionAttribute("loginUser") Member m, @RequestParam("mainImg") boolean mainImg, @RequestParam(value = "setFile", required = false) ArrayList<MultipartFile> fileList, @ModelAttribute Sellshare ss, HttpServletRequest request, RedirectAttributes redirect) {
		
		ss.setMemberId(m.getId());
		
		ArrayList<SellshareFile> fileName = new ArrayList<SellshareFile>();
		
		int checkCount = 0;
		if(fileList != null && !(fileList.size() <= 0)) {
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "sellshareUploadFiles");
				SellshareFile ssf = new SellshareFile();
				ssf.setOriginalFileName(file.getOriginalFilename());
				ssf.setChangeFileName(changeFileName);
				if(mainImg) {
					ssf.setStatus("M");
					mainImg = false;
				}
				fileName.add(ssf);
			}
			ss.setFileList(fileName);
			checkCount += fileList.size();
		}
		int result = ssService.insertSellshare(ss);
		if(result > checkCount) {
			redirect.addFlashAttribute("msg", "물품 등록이 완료되었습니다.");
			redirect.addFlashAttribute("path", "share.ss");
			
			return "redirect:alert.do";
		} else {
			throw new SellshareException("물품 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("sellDetail.ss")
	public String sellDetail(@CookieValue(name = "sellView", required = false) String cookie, HttpServletRequest request, HttpServletResponse response, @RequestParam("ssNum") int ssNum, Model model) {
		
		if(cookie != null) {
			if (!(cookie.contains(String.valueOf(ssNum)))) {
				cookie += ssNum + "/";
				ssService.updateScount(ssNum);
			}
			response.addCookie(new Cookie("sellView", cookie));
		}
		
		Sellshare ss = ssService.selectSellshare(ssNum);
		ArrayList<SComment> cList = (ArrayList<SComment>)ssService.selectSComment(ssNum);
		
		if(ss != null && cList != null) {
			model.addAttribute("ss", ss);
			model.addAttribute("cList", cList);
			return "sell_detail";
		} else {
			throw new SellshareException("상세 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("shareDetail.ss")
	public String shareDetail(@CookieValue(name = "shareView") String cookie, HttpServletRequest request, HttpServletResponse response, @RequestParam("ssNum") int ssNum, Model model) {
		
		if (!(cookie.contains(String.valueOf(ssNum)))) {
			cookie += ssNum + "/";
			ssService.updateScount(ssNum);
		}
		response.addCookie(new Cookie("shareView", cookie));
		
		Sellshare ss = ssService.selectSellshare(ssNum);
		ArrayList<SComment> cList = (ArrayList<SComment>)ssService.selectSComment(ssNum);
		
		if(ss != null && cList != null) {
			model.addAttribute("ss", ss);
			model.addAttribute("cList", cList);
			return "share_detail";
		} else {
			throw new SellshareException("상세 조회에 실패하였습니다.");
		}
	}
	
	
	@RequestMapping("sellshareUpdateForm.ss")
	public String sellshareUpdateForm(@RequestParam("ssNum") int ssNum, Model model) {
		
		Sellshare ss = ssService.selectUpdateSellshare(ssNum);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sido", ss.getAddr1());
		map.put("sigungu", ss.getAddr2());
		
		ArrayList<String> sidoList = (ArrayList<String>) ssService.selectSido();
		ArrayList<String> sigunguList = (ArrayList<String>) ssService.selectSigungu(map);
		ArrayList<String> dongList = (ArrayList<String>) ssService.selectDong(map);
		
		model.addAttribute("ss", ss);
		model.addAttribute("location1", sidoList);
		model.addAttribute("location2", sigunguList);
		model.addAttribute("location3", dongList);
		
		return "sell_update";
	}
	
	@RequestMapping("sellshareUpdate.ss")
	public String seelshareUpdate(@SessionAttribute("loginUser") Member m, @ModelAttribute Sellshare ss, @RequestParam("mainImg") boolean mainImg, @RequestParam(value = "setFile",  required = false) ArrayList<MultipartFile> fileList, @RequestParam(value = "exFile", required = false) ArrayList<Integer> exFile, @RequestParam(value = "delFile", required = false) ArrayList<String> delFile, HttpServletRequest request, RedirectAttributes redirect) {
		ss.setMemberId(m.getId());
		
		if(delFile != null && !(delFile.size() <= 0)) {
			for(String fileName : delFile) {
				FileIO.moveFileToTemp(fileName, request, "sellshareUploadFiles");
			}
		}
		
		int checkCount = 0;
		
		if(fileList != null && !(fileList.size() <= 0)) {
			ArrayList<SellshareFile> fileName = new ArrayList<SellshareFile>();
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "sellshareUploadFiles");
				SellshareFile ssf = new SellshareFile();
				ssf.setOriginalFileName(file.getOriginalFilename());
				ssf.setChangeFileName(changeFileName);
				if(mainImg) {
					ssf.setStatus("M");
					mainImg = false;
				}
				fileName.add(ssf);
			}
			ss.setFileList(fileName);
			checkCount += fileList.size();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ssNum", ss.getProductNum());
		map.put("exFile", exFile);
		
		int result = ssService.updateSellshare(map, ss);
		
		if(result > checkCount) {
			if(ss.getCategory().equals("팔아요")) {
				redirect.addFlashAttribute("msg", "물품정보가 수정되었습니다.");
				redirect.addFlashAttribute("path", "sell.ss");
				
				return "redirect:alert.do";
			} else {
				redirect.addFlashAttribute("msg", "물품정보가 수정되었습니다.");
				redirect.addFlashAttribute("path", "share.ss");
				
				return "redirect:alert.do";
			}
			
		} else {
			throw new SellshareException("물품정보 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("sellDelete.ss")
	public String sellDelete(@RequestParam("ssNum") int ssNum) {
		int result = ssService.sellshareDelete(ssNum);
		
		if(result > 0) {
			return "redirect:sell.ss";
		} else {
			throw new SellshareException("물품 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("shareDelete.ss")
	public String shareDelete(@RequestParam("ssNum") int ssNum) {
		int result = ssService.sellshareDelete(ssNum);
		
		if(result > 0) {
			return "redirect:share.ss";
		} else {
			throw new SellshareException("물품 삭제에 실패하였습니다.");
		}
	}

	
	@RequestMapping("CommentWrite.ss")
	public ModelAndView bCommentWrite(@RequestParam("sNum") int ssNum, @RequestParam("cate") String cate, @ModelAttribute SComment sc, ModelAndView mv) {
		
		sc.setS_num(ssNum);
		int result = ssService.insertComment(sc);
	
		if(result > 0) {
			if(cate.equals("se")) {
				mv.addObject("ssNum", sc.getS_num())
				.setViewName("redirect:sellDetail.ss");
			} else {
				mv.addObject("ssNum", sc.getS_num())
				.setViewName("redirect:shareDetail.ss");
			}
			
		} else {
			throw new SellshareException("댓글 작성에 실패하였습니다.");
		}		
		return mv;
	}
	
	@RequestMapping("sCommentUpdate.ss")
	public String bCommentUpdate(@ModelAttribute SComment sc, @RequestParam("cNum") int cNum, @RequestParam("sNum") int ssNum, @RequestParam("cate") String cate, RedirectAttributes redirect) {
		
		sc.setS_num(ssNum);
		sc.setC_num(cNum);
		
		int result = ssService.updateComment(sc);
		
		String resultMsg = "";
		if(result > 0) {
			if(cate.equals("se")) {
				resultMsg = "수정되었습니다.";
				redirect.addFlashAttribute("msg", resultMsg);
				redirect.addFlashAttribute("path", "sellDetail.ss?ssNum=" + ssNum);
			} else {
				resultMsg = "수정되었습니다.";
				redirect.addFlashAttribute("msg", resultMsg);
				redirect.addFlashAttribute("path", "shareDetail.ss?ssNum=" + ssNum);
			}
			
		} else {
			throw new SellshareException("댓글 수정에 실패하였습니다.");
		}
		return "redirect:alert.do";
	}
	
	@RequestMapping("commentDelete.ss")
	public ModelAndView bCommentDelete(@RequestParam("cNum") int cNum, @RequestParam("cate") String cate, @RequestParam("sNum") int sNum, ModelAndView mv) {
		
		int result = ssService.deleteComment(cNum);
		if(result > 0) {
			if(cate.equals("se")) {
				mv.addObject("ssNum", sNum)
				.setViewName("redirect:sellDetail.ss");
			} else {
				mv.addObject("ssNum", sNum)
				.setViewName("redirect:shareDetail.ss");
			}
			
		} else {
			throw new SellshareException("댓글 삭제에 실패하였습니다.");
		}		
		return mv;
	}
	
	@RequestMapping("sCommentPluse.ss")
	public String bCommentPlus(@ModelAttribute SComment sc, @RequestParam("cate") String cate, @RequestParam("cNum") int cNum, @RequestParam("sNum") int ssNum, RedirectAttributes redirect) {
		sc.setC_Gnum(cNum);
		sc.setS_num(ssNum);
		
		int result = ssService.ReplyComment(sc);
		
		String resultMsg = "";
		if(result > 0) {
			if(cate.equals("se")) {
				resultMsg = "답댓글이 작성되었습니다. ";
				redirect.addFlashAttribute("msg", resultMsg);
				redirect.addFlashAttribute("path", "sellDetail.ss?ssNum=" + ssNum);
			} else {
				resultMsg = "답댓글이 작성되었습니다. ";
				redirect.addFlashAttribute("msg", resultMsg);
				redirect.addFlashAttribute("path", "shareDetail.ss?ssNum=" + ssNum);
			}
			
		} else {
			throw new SellshareException("댓글 수정에 실패하였습니다.");
		}
		return "redirect:alert.do";
	}
	
	@RequestMapping("infoSS.ss")
	public String infoSS(@RequestParam(value = "option", required = false) String option, @RequestParam(value = "infoId", required = false) String infoId, @SessionAttribute("loginUser") Member m, @RequestParam(value = "page", required = false) Integer page, Model model, HttpServletResponse response) {
		if(option == null) {
			option = "팔아요";
		}
		if(infoId == null) {
			infoId = m.getId();
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("infoId", infoId);
		map.put("option", option);
		
		int listCount = ssService.getInfoSSListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Sellshare> ssList = (ArrayList<Sellshare>) ssService.selectInfoSSList(map, pi);
		
		//쿠키 생성
		Cookie cookie = new Cookie("sellView",null); 	//view라는 이름의 쿠키 생성
		cookie.setComment("팔아요 조회 확인");				//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24*365);					//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);						//사용자에게 해당 쿠키를 추가
		
		if(ssList != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("ssList", ssList);
			model.addAttribute("pi", pi);
			
			if(option.equals("팔아요")) {
				return "InfoSell";
			} else if(option.equals("나눠요")) {
				return "InfoShare";
			} else {
				throw new SellshareException("목록 조회에 실패하였습니다.");
			}
		} else {
			throw new SellshareException("목록 조회에 실패하였습니다.");
		}
		
	}
	
}
