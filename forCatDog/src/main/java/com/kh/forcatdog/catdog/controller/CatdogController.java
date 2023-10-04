
package com.kh.forcatdog.catdog.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.forcatdog.catdog.model.exception.CatdogException;
import com.kh.forcatdog.catdog.model.service.CatdogService;
import com.kh.forcatdog.catdog.model.vo.Catdog;
import com.kh.forcatdog.catdog.model.vo.CatdogFile;
import com.kh.forcatdog.catdog.model.vo.PageInfo;
import com.kh.forcatdog.catdog.model.vo.Pagination;
import com.kh.forcatdog.common.FileIO;

@Controller
public class CatdogController {
	
	@Autowired
	private CatdogService ccService;
	
	@RequestMapping("dog.cc")
	public ModelAndView catdogList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ccService.getDogListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Catdog> ccList = (ArrayList<Catdog>)ccService.selectDogList(pi);
		
		if(ccList != null) {
			mv.addObject("ccList", ccList);
			mv.addObject("pi", pi);
			mv.setViewName("dog");
		} else {
			throw new CatdogException("캣독 목록 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("cat.cc")
	public String catdogList2(@RequestParam(value = "page", required = false) Integer page, Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ccService.getCatListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Catdog> ccList = (ArrayList<Catdog>) ccService.selectCatList(pi);
	
		if(ccList != null) {
			model.addAttribute("listCount", listCount);
			model.addAttribute("ccList", ccList);
			model.addAttribute("pi", pi);
			return "cat";
		} else {
			throw new CatdogException("캣독 목록 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("catdogWriteForm.cc")
	public String catdogWriteForm(@ModelAttribute Catdog c, Model model) {
		model.addAttribute("c", c);
		return "catdog_write";
	}
	
	@RequestMapping("catdogWrite.cc")
	public String catdogWrite(@ModelAttribute Catdog cd, @RequestParam(value = "setFile", required = false) ArrayList<MultipartFile> fileList, HttpServletRequest request, RedirectAttributes redirect) {
		
		String cate = cd.getCd_cate();
		
		ArrayList<CatdogFile> fileName = new ArrayList<CatdogFile>();
		int checkCount = 0;
		if(fileList != null && !(fileList.size() <= 0)) {
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "catdogUploadFiles");
				CatdogFile cdf = new CatdogFile();
				cdf.setOriginalFileName(file.getOriginalFilename());
				cdf.setChangeFileName(changeFileName);
				fileName.add(cdf);
			}
			cd.setFileList(fileName);
			checkCount += fileList.size();
		}
		
		int result = ccService.insertCatdog(cd);

		if(result > checkCount) {	
			if(cate.equals("DOG")) {
				redirect.addFlashAttribute("msg", "등록이 완료되었습니다.");
				redirect.addFlashAttribute("path", "managerMain.mn");
				
				return "redirect:alert.do";
			} else {
				redirect.addFlashAttribute("msg", "등록이 완료되었습니다.");
				redirect.addFlashAttribute("path", "managerMain.mn");
				
				return "redirect:alert.do";
			}
		} else {
			throw new CatdogException("캣독 등록에 실패하였습니다.");
		}
	}
	
	@RequestMapping("catdogDetail.cc")
	public String catdogDetail(@RequestParam("cdNum") int cdNum, Model model) {
		
		Catdog cd = ccService.selectCatdog(cdNum);
		if(cd != null) {
			model.addAttribute("cd", cd);
			return "catdog_detail";
		} else {
			throw new CatdogException("캣독 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("catdogUpdateForm.cc")
	public String catdogUpdateForm(@RequestParam("cdNum") int cdNum, Model model) {
		Catdog cd = ccService.selectUpdateCatdog(cdNum);
		
		if(cd != null) {
			model.addAttribute("cd", cd);
			return "catdog_update";
		} else {
			throw new CatdogException("캣독 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("catdogUpdate.cc")
	public String catdogUpdate(@ModelAttribute Catdog cd, @RequestParam(value = "setFile",  required = false) ArrayList<MultipartFile> fileList, @RequestParam(value = "exFile", required = false) ArrayList<Integer> exFile, @RequestParam(value = "delFile", required = false) ArrayList<String> delFile, HttpServletRequest request, RedirectAttributes redirect) {

		String cate = cd.getCd_cate();
		
		if(delFile != null && !(delFile.size() <= 0)) {
			for(String fileName : delFile) {
				FileIO.moveFileToTemp(fileName, request, "catdogUploadFiles");
			}
		}
		
		int checkCount = 0;
		
		if(fileList != null && !(fileList.size() <= 0)) {
			ArrayList<CatdogFile> fileName = new ArrayList<CatdogFile>();
			for(MultipartFile file : fileList) {
				String changeFileName = FileIO.saveFile(file, request, "catdogUploadFiles");
				CatdogFile cdf = new CatdogFile();
				cdf.setOriginalFileName(file.getOriginalFilename());
				cdf.setChangeFileName(changeFileName);
				fileName.add(cdf);
			}
			cd.setFileList(fileName);
			checkCount += fileList.size();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cdNum", cd.getCd_num());
		map.put("exFile", exFile);
		
		int result = ccService.updateCatdog(map, cd);
		
		if(result > checkCount) {
			if(cate.equals("DOG")) {
				redirect.addFlashAttribute("msg", "캣독정보가 수정되었습니다.");
				redirect.addFlashAttribute("path", "manager_catdog.cc");
				return "redirect:alert.do";
			} else {
				redirect.addFlashAttribute("msg", "캣독정보가 수정되었습니다.");
				redirect.addFlashAttribute("path", "manager_catdog.cc");
				return "redirect:alert.do";
			}		
		} else {
			throw new CatdogException("캣독정보 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("catdogDelete.cc")
	public String catdogDelete(@RequestParam("cdNum") int cdNum) {
		int result = ccService.catdogDelete(cdNum);
		
		if(result > 0) {
			return "redirect:manager_catdog.cc";
		} else {
			throw new CatdogException("캣독 정보 삭제에 실패하였습니다.");
		}
	}
	
	@RequestMapping("dogSearch.cc")
	public ModelAndView dogSearch(@RequestParam(value = "page", required = false) Integer page, @RequestParam("word") String word, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ccService.getDogSearchListCount(word);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Catdog> ccList = (ArrayList<Catdog>) ccService.searchDog(pi, word);
	
		if(ccList != null) {
			mv.addObject("ccList", ccList);
			mv.addObject("pi", pi);
			mv.addObject("word", word);
			mv.setViewName("dog");
		} else {
			throw new CatdogException("DOG 검색에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("catSearch.cc")
	public ModelAndView catSearch(@RequestParam(value = "page", required = false) Integer page, @RequestParam("word") String word, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ccService.getCatSearchListCount(word);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Catdog> ccList = (ArrayList<Catdog>)ccService.searchCat(pi, word);
	
		if(ccList != null) {
			mv.addObject("ccList", ccList);
			mv.addObject("pi", pi);
			mv.addObject("word", word);
			mv.setViewName("cat");
		} else {
			throw new CatdogException("CAT 검색에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("manager_catdog.cc")
	public ModelAndView managerdList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = ccService.getCatDogListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Catdog> ccList = (ArrayList<Catdog>)ccService.selectCatDogList(pi);
		
		if(ccList != null) {
			mv.addObject("ccList", ccList);
			mv.addObject("pi", pi);
			mv.setViewName("managerCatDogList");
		} else {
			throw new CatdogException("캣독 목록 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("searchCatDog.cc")
	@ResponseBody
	public ArrayList<String> searchCatDog(@RequestBody HashMap<String, String> map) {
		return (ArrayList<String>) ccService.searchCatDog(map);
	}
	

}
