package com.kosa.pro.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/group")
public class MypageGroupController extends PrtController {

	
	
	// ============================ 마이페이지 ============================
	
	// 마이 페이지(메인)
	@GetMapping("/main")
	public String main(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 메인페이지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/group_main";
		
	}
	
	
	// 신청 글 작성
	@PostMapping("/register")
	public String register(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지", model);
		log.info(">>>>>>>>>>>>>>봉사활동 등록");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/recruit_register";
		
	}
	
	
	// 신청 목록/승인 및 거절
	@PostMapping("/approve")
	public String approve (SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("신청 목록/승인 및 거절 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 신청 목록/승인 및 거절");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/recruit_approve";
		
	}
	
	// 진행 중인 봉사
	@PostMapping("/working")
	public String working(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("진행 중인 봉사 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 진행 중인 봉사");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/group_working";
		
	}
	
	// 봉사활동 후기 글
	@GetMapping("/review")
	public String review(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 후기 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 봉사활동 후기 글");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/group_review";
		
	}
	
	// 캘린더 관리
	@PostMapping("/calender")
	public String calender(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("캘린더 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 캘린더");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/group_calender";
		
	}
	
	// 개인 정보 및 프로필 수정
	@RequestMapping("/profile")
	public String profile(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("단체 개인 정보 및 프로필 수정 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 개인 정보 및 프로필 수정");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/group_profile";
		
	}
	
	
} // end class
