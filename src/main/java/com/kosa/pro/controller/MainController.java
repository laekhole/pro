package com.kosa.pro.controller;

import java.time.LocalTime;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.NoticeVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.service.MainService;
import com.kosa.pro.service.RecruitBoardService;
import com.kosa.pro.service.ReviewBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MainController extends PrtController {
	
	@Autowired
	MainService _mainService;
	
	@RequestMapping(value = {"/", "main"})
	public String mainIndex(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 메인", model);
		search.setCash(0);
		long tick = System.nanoTime();
		Map<String, Object> map = _mainService.mainList(search);
		
		model.addAttribute("listTop3", map.get("listTop3")); 
		model.addAttribute("recruitList", map.get("recruitList"));
		model.addAttribute("noticeList", map.get("noticeList"));
		
		
		System.out.println("걸린 시간 = " + (System.nanoTime() - tick));
		
		
		log.info("서버 배포 테스트!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		return "index";
	}
	
	@GetMapping("/notice")
	public String noticeList(SearchVO search, Model model) {
		super.setPageSubTitle("공지사항 게시판", model);
		
		model.addAttribute("list", _mainService.noticeList(search));
		model.addAttribute("search", search);
		
		return "menu/notice_list";
	}

}
