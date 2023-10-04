package com.kh.forcatdog;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.forcatdog.board.model.service.BoardService;
import com.kh.forcatdog.board.model.vo.Board;
import com.kh.forcatdog.catdog.model.service.CatdogService;
import com.kh.forcatdog.catdog.model.vo.Catdog;
import com.kh.forcatdog.customerService.model.service.CustomerService;
import com.kh.forcatdog.customerService.model.vo.Notice;
import com.kh.forcatdog.match.model.service.MatchService;
import com.kh.forcatdog.match.model.vo.Match;
import com.kh.forcatdog.sellshare.model.exception.SellshareException;
import com.kh.forcatdog.sellshare.model.service.SellshareService;
import com.kh.forcatdog.sellshare.model.vo.Sellshare;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	@Autowired 
	private CustomerService cService;
	@Autowired 
	private CatdogService ccService;
	@Autowired 
	private BoardService bService;
	@Autowired 
	private SellshareService ssService;
	@Autowired 
	private MatchService mcService;
	
	@RequestMapping("/")
	public String main(Model m) {

		ArrayList<Notice> noticeList = (ArrayList<Notice>) cService.selectMainNoticeList(); 
		
		ArrayList<Catdog> dogList = (ArrayList<Catdog>) ccService.selectMainDogList();
		
		ArrayList<Catdog> catList = (ArrayList<Catdog>) ccService.selectMainCatList();
		
		ArrayList<Match> matchCList = (ArrayList<Match>) mcService.selectMainCoupleMatchList();
		
		ArrayList<Match> matchWList = (ArrayList<Match>) mcService.selectMainWalkMatchList();
		
		m.addAttribute("matchCList", matchCList);
		m.addAttribute("matchWList", matchWList);
		m.addAttribute("noticeList", noticeList);
		m.addAttribute("dogList", dogList);
		m.addAttribute("catList", catList);
		return "main";
	}
	
	@RequestMapping("alert.do")
	public String alertPage() {
		return "common/alertPage";
	}
	
	@RequestMapping("/findHospital")
	public String findH() {
		return "findHospital";
	}
	
	@RequestMapping("allSearch.all")
	public String allSearch(@RequestParam("word") String word, Model model, HttpServletRequest request) {
		ArrayList<Catdog> ccList = (ArrayList<Catdog>)ccService.allSearchDog(word);
		ArrayList<Catdog> catList = (ArrayList<Catdog>)ccService.allSearchCat(word);
		ArrayList<Board> bList = (ArrayList<Board>)bService.allSearchBoard(word);
		ArrayList<Sellshare> sellList = (ArrayList<Sellshare>) ssService.allSearchSell(word);
		ArrayList<Sellshare> shareList = (ArrayList<Sellshare>) ssService.allSearchShare(word);
		
		if(ccList != null && catList != null && bList != null) {
			model.addAttribute("ccList", ccList);
			model.addAttribute("catList", catList);
			model.addAttribute("bList", bList);
			model.addAttribute("sellList", sellList);
			model.addAttribute("shareList", shareList);
			model.addAttribute("word", word);
			return "common/allSearch";
		} else {
			throw new SellshareException("전체 검색에 실패하였습니다.");
		}	

	}
}
