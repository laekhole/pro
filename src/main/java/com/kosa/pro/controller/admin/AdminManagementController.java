package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.admin.MemberService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminManagementController {

	@Autowired
	private MemberService _memberService;
	
	@RequestMapping("/adminmanagement")
	public String adminMangementMain(MemberSearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 회원/단체 관리");
		Map<String, List<MemberVO>> map = _memberService.memberList(search);
		model.addAttribute("list", map.get("memberList"));
		model.addAttribute("search", search);
		
		return "admin/adminmanagement";
	}
}
