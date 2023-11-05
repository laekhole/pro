package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.admin.AdminMemberService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminManagementController {

	@Autowired
	private AdminMemberService _memberService;
	
	@RequestMapping("/adminmanagement")
	public String adminMangementMain(MemberSearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 회원/단체 관리");
		Map<String, List<MemberVO>> map = _memberService.memberList(search);
		model.addAttribute("list", map.get("memberList"));
		model.addAttribute("search", search);
		
		return "admin/adminmanagement";
	}
	
    // 개인 회원 목록을 가져오는 AJAX 처리 메서드
    @GetMapping("/getIndividualMembers")
    @ResponseBody
    public List<MemberVO> getIndividualMembers(MemberSearchVO search) throws Exception {
        log.info("Fetching 개인 회원 AJAX call");
        Map<String, List<MemberVO>> map = _memberService.memberList(search);
        System.out.println("개인---------------------------" + map);
        return map.get("memberList");
    }

    // 단체 회원 목록을 가져오는 AJAX 처리 메서드
    @GetMapping("/getGroupMembers")
    @ResponseBody
    public List<GroupMemberVO> getGroupMembers(GroupMemberSearchVO search, Model model) throws Exception {
    	   log.info("Fetching 단체 AJAX call");
        Map<String, List<GroupMemberVO>> map = _memberService.groupMemberList(search);
        model.addAttribute("search", search);
        System.out.println(map + "뭐들어있음");
        return map.get("groupList");
    }
    
    
    
    
}
	
	

