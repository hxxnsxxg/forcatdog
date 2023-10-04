package com.kh.forcatdog.board.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.board.model.exception.BoardException;
import com.kh.forcatdog.board.model.service.BoardService;
import com.kh.forcatdog.board.model.vo.Board;
import com.kh.forcatdog.board.model.vo.BoardFile;
import com.kh.forcatdog.board.model.vo.Comment;
import com.kh.forcatdog.common.FileIO;
import com.kh.forcatdog.common.PageInfo;
import com.kh.forcatdog.common.Pagination;
import com.kh.forcatdog.member.model.vo.Member;
import com.kh.forcatdog.sellshare.model.exception.SellshareException;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("boardList.bo")
	public String boardList(@RequestParam(value = "page", required = false) Integer page, Model model, HttpServletResponse response) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getBoardListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> bList = (ArrayList<Board>) bService.selectBoardList(pi);
		
		//쿠키 생성
		Cookie cookie = new Cookie("view",null); 	//view라는 이름의 쿠키 생성
		try {
			cookie.setComment(URLEncoder.encode("글 조회 확인", "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24*365);				//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);	//사용자에게 해당 쿠키를 추가
		
		if(bList != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("bList", bList);
			model.addAttribute("pi", pi);
			return "mainBoard";
		} else {
			throw new BoardException("게시글 목록 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("boardWriteForm.bo")
	public String boardWriteForm(@ModelAttribute Board b, Model model) {
		model.addAttribute("b", b);
		return "mainBoard_write";
	}
	
	@RequestMapping("boardWrite.bo")
	public String boardWrite(@SessionAttribute("loginUser") Member m, @ModelAttribute Board b, @RequestParam(value = "setFile", required = false) ArrayList<MultipartFile> fileList, HttpServletRequest request, RedirectAttributes redirect) {
		b.setMemberId(m.getId());
		
		ArrayList<BoardFile> fileName = new ArrayList<BoardFile>();
		int checkCount = 0;
		if(fileList != null && !(fileList.size() <= 0)) {
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "boardUploadFiles");
				BoardFile bf = new BoardFile();
				bf.setOriginalFileName(file.getOriginalFilename());
				bf.setChangeFileName(changeFileName);
				fileName.add(bf);
			}
			b.setFileList(fileName);
			checkCount += fileList.size();
		}
		
		int result = bService.insertBoard(b);
		if(result > checkCount) {
			redirect.addFlashAttribute("msg", "게시글이 작성되었습니다.");
			redirect.addFlashAttribute("path", "boardList.bo");
			
			return "redirect:alert.do";
		} else {
			throw new BoardException("게시글 작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("boardDetail.bo")
	public String boardDetail(@CookieValue(name = "view", required = false) String cookie, HttpServletRequest request, HttpServletResponse response, @RequestParam("bNum") int bNum, Model model) {

		if(cookie != null) {
			if (!(cookie.contains(String.valueOf(bNum)))) {
				cookie += bNum + "/";
				bService.updateBcount(bNum);
			}
			response.addCookie(new Cookie("view", cookie));
		}

		Board b = bService.selectBoard(bNum);
		ArrayList<Comment> cList = (ArrayList<Comment>)bService.selectComment(bNum);
		
		if(b != null && cList != null) {
			model.addAttribute("b", b);
			model.addAttribute("cList", cList);
			return "mainBoard_detail";
		} else {
			throw new BoardException("게시글 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("boardFileDown.bo")
	@ResponseBody
	public boolean boardFileDown(@RequestParam("fileId") int fileId) {
		int result = bService.updateFileCount(fileId);
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("boardUpdateForm.bo")
	public String boardUpdateForm(@RequestParam("bNum") int bNum, Model model) {
		Board b = bService.selectUpdateBoard(bNum);
		
		if(b != null) {
			model.addAttribute("b", b);
			return "mainBoard_update";
		} else {
			throw new BoardException("게시글 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("boardUpdate.bo")
	public String boardUpdate(@SessionAttribute("loginUser") Member m, @ModelAttribute Board b, @RequestParam(value = "setFile", required = false) ArrayList<MultipartFile> fileList, @RequestParam(value = "exFile", required = false) ArrayList<Integer> exFile, @RequestParam(value = "delFile", required = false) ArrayList<String> delFile, HttpServletRequest request, RedirectAttributes redirect) {
		b.setMemberId(m.getId());
		
		if(delFile != null && !(delFile.size() <= 0)) {
			for(String fileName : delFile) {
				FileIO.moveFileToTemp(fileName, request, "boardUploadFiles");
			}
		}
		
		int checkCount = 0;
		
		if(fileList != null && !(fileList.size() <= 0)) {
			ArrayList<BoardFile> fileName = new ArrayList<BoardFile>();
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "boardUploadFiles");
				BoardFile bf = new BoardFile();
				bf.setOriginalFileName(file.getOriginalFilename());
				bf.setChangeFileName(changeFileName);
				fileName.add(bf);
			}
			b.setFileList(fileName);
			checkCount += fileList.size();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNum", b.getBoardNum());
		map.put("exFile", exFile);
		
		int result = bService.updateBoard(map, b);
		
		if(result > checkCount) {
			redirect.addFlashAttribute("msg", "게시글이 수정되었습니다.");
			redirect.addFlashAttribute("path", "boardList.bo");
			
			return "redirect:alert.do";
		} else {
			throw new BoardException("게시글 수정에 실패하였습니다.");
		}		
	}
	
	@RequestMapping("commentWrite.bo")
	public ModelAndView bCommentWrite(@ModelAttribute Comment c, @RequestParam("b_num") int b_num, ModelAndView mv) {
		
		c.setB_num(b_num);
		
		int result = bService.insertComment(c);
		
		if(result > 0) {
			mv.addObject("bNum", c.getB_num())
			.setViewName("redirect:boardDetail.bo");
		} else {
			throw new BoardException("댓글 작성에 실패하였습니다.");
		}		
		return mv;
	}
	
	@RequestMapping("commentDelete.bo")
	public String bCommentDelete(@RequestParam("cNum") int cNum, @RequestParam("bNum") int bNum, RedirectAttributes redirect) {
		
		int result = bService.deleteComment(cNum);
		
		String resultMsg = "";
		if(result > 0) {
			resultMsg = "삭제되었습니다.";
			redirect.addFlashAttribute("msg", resultMsg);
			redirect.addFlashAttribute("path", "boardDetail.bo?bNum=" + bNum);
		} else {
			throw new SellshareException("댓글 삭제에 실패하였습니다.");
		}
		return "redirect:alert.do";
	}
	
	@RequestMapping("deleteBoard.do")
	public String boardDelete(@RequestParam("bNum") int bnum) {
		int result = bService.deleteBoard(bnum);
		
		if(result > 0) {
			return "redirect:boardList.bo";
		} else {
			throw new BoardException("게시물 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("commentUpdate.bo")
	public String bCommentUpdate(@ModelAttribute Comment c, @RequestParam("cNum") int cNum, @RequestParam("bNum") int bNum, RedirectAttributes redirect) {
		
		c.setC_num(cNum);

		int result = bService.updateComment(c);
		
		String resultMsg = "";
		if(result > 0) {
			resultMsg = "수정되었습니다.";
			redirect.addFlashAttribute("msg", resultMsg);
			redirect.addFlashAttribute("path", "boardDetail.bo?bNum=" + bNum);
		} else {
			throw new SellshareException("댓글 수정에 실패하였습니다.");
		}
		return "redirect:alert.do";
	}
	
	@RequestMapping("commentPluse.bo")
	public String bCommentPlus(@ModelAttribute Comment c, @RequestParam("cNum") int cNum, @RequestParam("bNum") int bNum, RedirectAttributes redirect) {
		c.setC_Gnum(cNum);
		c.setB_num(bNum);
		
		int result = bService.ReplyComment(c);
		
		String resultMsg = "";
		if(result > 0) {
			resultMsg = "작성되었습니다.";
			redirect.addFlashAttribute("msg", resultMsg);
			redirect.addFlashAttribute("path", "boardDetail.bo?bNum=" + bNum);
		} else {
			throw new SellshareException("대댓 작성에 실패하였습니다.");
		}
		return "redirect:alert.do";
	}
	
	@RequestMapping("boardSearchList.bo")
	public String boardSearchList(@RequestParam(value = "page", required = false) Integer page, @RequestParam("word") String word, @RequestParam("searchOption") String option, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("option", option);
		map.put("word", word);
		
		int listCount = bService.getSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> bList = (ArrayList<Board>)bService.searchBoardList(pi, map);
		
		if(bList != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("bList", bList);
			model.addAttribute("pi", pi);
			model.addAttribute("option", option);
			model.addAttribute("word", word);
			return "mainBoard";
		} else {
			throw new BoardException("게시글 목록 조회에 실패하였습니다.");
		}
	} 
	
	@RequestMapping("infoBoard.bo")
	public String infoBoard(@RequestParam(value = "infoId", required = false) String infoId, @SessionAttribute("loginUser") Member m, @RequestParam(value = "page", required = false) Integer page, Model model, HttpServletResponse response) {
		if(infoId == null) {
			infoId = m.getId();
		}
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		Member info = bService.selectInfoBoardMember(infoId);
		
		int listCount = bService.getInfoBoardListCount(infoId);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> bList = (ArrayList<Board>) bService.selectInfoBoardList(infoId, pi);
		
		//쿠키 생성
		Cookie cookie = new Cookie("view",null); 	//view라는 이름의 쿠키 생성
		cookie.setComment("글 조회 확인");				//해당 쿠키가 어떤 용도인지 커멘트
		cookie.setMaxAge(60*60*24*365);				//해당 쿠키의 유효시간을 설정 (초 기준)
		response.addCookie(cookie);					//사용자에게 해당 쿠키를 추가
		
		if(bList != null) {
			model.addAttribute("info", info);
			model.addAttribute("listCount", listCount);
			model.addAttribute("bList", bList);
			model.addAttribute("pi", pi);
			return "InfoBoard";
		} else {
			throw new BoardException("게시글 목록 조회에 실패하였습니다.");
		}
	}
}
