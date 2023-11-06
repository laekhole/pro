package com.kosa.pro.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.VolunteeringVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.MypageGroupService;
import com.kosa.pro.service.admin.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/group")
public class MypageGroupController extends PrtController {

	@Autowired
	private MypageGroupService _mypageGroupService;
	
	@Autowired
	private MemberService _memberService;

//	5마이페이지 메인
//	끝)봉사활동 신청 글 작성
//	1봉사활동 신청 목록/승인 및 거절
//	2진행중인 봉사
//	4봉사활동 후기글
//	3캘린더 확인
//	6개인정보 및 프로필 수정
	
	// ============================ 마이페이지 ============================
	
	// 1. 마이 페이지(메인)
	@GetMapping("/main")
	public String main(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 메인페이지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_main";
		
	}
	
	
	// 2. 봉사활동 신청 글 작성 -> recruitGroupContoller에 작성
	
	
	
	/*
	 * @GetMapping("/list") public String recruitList(BoardSearchVO search, Model
	 * model) throws Exception { super.setPageSubTitle("봉사신청 목록 페이지", model); //
	 * log.info(">>>>>>>>>>>>>>서치 = " + search.); search.setRecordCount(5);
	 * Map<String, List<RecruitBoardVO>> map =
	 * _recruitBoardService.recruitList(search); model.addAttribute("list",
	 * map.get("recruitList")); model.addAttribute("search", search);
	 * 
	 * return "recruit/recruit_list";
	 * 
	 * }
	 */
	
	// 3. 신청 목록/승인 및 거절
	@GetMapping("/updateState")
	public String updateState(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 승인 페이지", model);
		log.info(">>>>>>>>>>>>>>서치 = " + search);
		
		Map<String, List<VolunteerProceedVO>> map = _mypageGroupService.volunteerProceedList(search);
		model.addAttribute("state", map.get("list")); 
		model.addAttribute("search", search);

		return "mypage/group/mypage_recruit_list";
		
	}
	
	@ResponseBody
	@PostMapping("/approve")
	public Map<String, Object> approve (@RequestBody VolunteerProceedVO vpvo) throws Exception {
		log.info(">>>>>>>>>>>>>>단체 신청 승인 컨트롤러");
		
		Map<String, Object> result = new HashMap<>();
		int status = _mypageGroupService.updateApprove(vpvo);
		
    	if(status > 0) {
    		result.put("status", true);
    		result.put("message", "봉사신청 '승인' 처리 되었습니다.");
    	} else {
    		result.put("status", false);
    		result.put("message", "오류가 발생했습니다. 다시 시도해주세요.");
    	}
		
		return result;
	} //approve
	
	@ResponseBody
	@PostMapping("/reject")
	public Map<String, Object> reject (@RequestBody VolunteerProceedVO vpvo) throws Exception {
		log.info(">>>>>>>>>>>>>>단체 신청 거절 컨트롤러");
		
		Map<String, Object> result = new HashMap<>();
		int status = _mypageGroupService.updateReject(vpvo);

		
    	if(status > 0) {
    		result.put("status", true);
    		result.put("message", "봉사신청 '거절' 처리 되었습니다.");
    	} else {
    		result.put("status", false);
    		result.put("message", "오류가 발생했습니다. 다시 시도해주세요.");
    	}
		
		return result;
	} //reject
	
	
	
	
	
	// 4. 진행 중인 봉사
	@GetMapping("/volunteering")
	public String working(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("진행 중인 봉사 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 진행 중인 봉사");
		
		try {
			
			Map<String, List<VolunteeringVO>> map = _mypageGroupService.volunteeringList(search);
			model.addAttribute("list", map.get("list")); 
			System.out.println("map : " + map);
			System.out.println("map.get(\"list\") : " + map.get("list"));
			System.out.println("전달잘됐나");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "mypage/group/mypage_volunteering";
	}
	
	
	
	
	// 5. 봉사활동 후기 글
	@GetMapping("/review")
	public String review(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 후기 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 봉사활동 후기 글");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_review_list";
		
	}
	
	// 6. 캘린더 관리
	@GetMapping("/calendar")
	public String calender(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("캘린더 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 캘린더");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_calendar";
		
	}
	
	// 7. 개인 정보 및 프로필 수정
	@GetMapping("/profile")
	public String profile(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("단체 개인 정보 및 프로필 수정 페이지", model);
		log.info(">>>>>>>>>>>>>>단체 개인 정보 및 프로필 수정");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/group/mypage_profile";
		
	}
	
	
} // end class
