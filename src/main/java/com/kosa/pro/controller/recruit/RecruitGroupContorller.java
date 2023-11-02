package com.kosa.pro.controller.recruit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.RecruitBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitGroupContorller extends PrtController {

	@Autowired
	private RecruitBoardService _recruitBoardService;
	
	// ============================ 봉사활동 목록 & 상세 페이지 ============================
	
	
	// 봉사활동 - 목록 페이지
	@RequestMapping("/list")
	public String recruitList(ReviewSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사신청 목록 페이지", model);
		log.info(">>>>>>>>>>>>>>서치 = " + search.getType1());
		search.setRecordCount(5);
		Map<String, List<RecruitBoardVO>> map = _recruitBoardService.recruitList(search);
		model.addAttribute("list", map.get("recruitList"));
		model.addAttribute("search", search);
		return "recruit/recruit_list";
		
	}
	
	
	// 봉사활동 - 상세페이지
	@RequestMapping("/detail")
	public String recruitDetail(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 상세페이지", model);
		log.info(">>>>>>>>>>>>>>상세보기");
//		model.addAttribute("test", getConfig().getAdminName());
		return "recruit/recruit_detail";
	}
	
	
// ============================ 마이페이지 ============================

	
	// 봉사활동 - 신청 등록 페이지
	@RequestMapping("/register")
	public String recruitRegister(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지", model);
		log.info(">>>>>>>>>>>>>>봉사신청 등록하기");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/recruit_register";
	}
	
} // end class
