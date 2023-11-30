package com.kosa.pro.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.admin.AdminMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
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
    
    // 회원 제제버튼 Ajax 처리 메서드
    @RequestMapping(value = "/adminBlockMember", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> adminBlockMember(@RequestBody MemberVO memberVO) {
    	Map<String, Object> response = _memberService.adminBlockMember(memberVO);
    	
    	if (response.containsKey("status") && response.get("status").equals("success")) {
    		log.info("회원 제재 성공: memSeq = " + memberVO.getMemSeq());
    		System.out.println(response + "Controller에서 if문 속 response ");
    	} else {
    		System.out.println(response + "Controller에서 if문 속 response 에러");
    		log.error("회원 제재 실패: memSeq 값이 없거나 처리 중 오류 발생");
    	}
    	
    	return response;
    }
    
    // 회원 제제버튼 해제 Ajax 처리 메서드
    @RequestMapping(value="/adminBlockClearBut", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> adminBlockClearBut(@RequestBody MemberVO memberVO){
    	Map<String, Object> response = _memberService.adminBlockClearBut(memberVO);
    	
    	if (response.containsKey("status") && response.get("status").equals("success")) {
    		log.info("회원 제재 해제 성공: memSeq = " + memberVO.getMemSeq());
    		System.out.println(response + "Controller에서 if문 속 response ");
    	} else {
    		System.out.println(response + "Controller에서 if문 속 response 에러");
    		log.error("회원 제재 해제 실패: memSeq 값이 없거나 처리 중 오류 발생");
    	}
    	
    	return response;
    }
    
    //선택 체크 제제 리스트
    @RequestMapping(value = "/adminCheckListBlockButMember", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> adminCheckListBlockMember(@RequestBody Map<String, List<Long>> data) {
        Map<String, Object> result = new HashMap<>();
        System.out.println("체크 선택 제재 컨트롤러");
        
        try {
            List<Long> memberList = data.get("checkmemSeq"); // JSON 요청에서 checkmemSeq를 가져옴
            // 멤버를 일괄 제재하는 서비스 메서드 호출
            _memberService.adminCheckListBlockMember(memberList);
            
            result.put("status", "success");
            result.put("message", "선택된 멤버가 일괄 제재되었습니다.");
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "일괄 제재 중 오류가 발생했습니다.");
        }
        
        return result;
    }    
    
 // 선택 체크 제제 해제 리스트
    @RequestMapping(value = "/adminCheckListUnblockButMember", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> adminCheckListUnblockButMember(@RequestBody Map<String, List<Long>> data) {
        Map<String, Object> result = new HashMap<>();
        System.out.println("체크 선택 제재 해제 컨트롤러");
        
        try {
            List<Long> memberList = data.get("memSeqArray"); // JSON 요청에서 memSeqArray를 가져옴
            // 멤버를 일괄 제재 해제하는 서비스 메서드 호출
            _memberService.adminCheckListUnblockButMember(memberList);
            
            result.put("status", "success");
            result.put("message", "선택된 멤버의 제재가 해제되었습니다.");
        } catch (Exception e) {
            result.put("status", "error");
            result.put("message", "일괄 제재 해제 중 오류가 발생했습니다.");
        }
        
        return result;
    } 
    
    
	//정렬 컨트롤러
    // 클라이언트로부터 정렬 방식을 받아와서 회원 목록을 정렬하여 반환
    @GetMapping("/sortMembers")
    @ResponseBody
    public List<MemberVO> sortMembers(@RequestParam String sortType) {
        List<MemberVO> sortedMembers = _memberService.getMembersSortedByTemperature(sortType);
        System.out.println( "정렬된 애들 누구 있노 "+sortedMembers);
        return sortedMembers;
    }
    
    
    
}
	
	

