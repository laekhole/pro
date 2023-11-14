package com.kosa.pro.controller.recruit;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.config.auth.PrincipalDetails;
import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.model.search.RecruitSearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.RecruitBoardService;
import com.kosa.pro.service.common.FileTokenService;
import com.kosa.pro.service.common.FileUploadService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/recruit")
public class RecruitGroupContorller extends PrtController {

	@Autowired
	private RecruitBoardService _recruitBoardService;
	@Autowired
	private FileTokenService _fileFileTokenService;
	@Autowired
	private FileUploadService _fileUploadService;
	// ============================ 봉사활동 목록 & 상세 페이지 ============================
	
	
	// 봉사활동 - 목록 페이지
	@GetMapping("/list")
	public String recruitList(BoardSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사신청 목록 페이지", model);
//		log.info(">>>>>>>>>>>>>>서치 = " + search.);
		search.setRecordCount(5);
		Map<String, List<RecruitBoardVO>> map = _recruitBoardService.recruitList(search);
		model.addAttribute("list", map.get("recruitList"));
		model.addAttribute("search", search);
		
		return "recruit/recruit_list";
		
	}
	
	
	// 봉사활동 - 상세페이지
	@GetMapping("/detail")
	public String recruitDetail(RecruitBoardVO recruit, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 상세페이지", model);
		log.info(">>>>>>>>>>>>>>상세보기");

		model.addAttribute("recruit", _recruitBoardService.recruitDetail(recruit));
		
		return "recruit/recruit_detail";
	}
	
	
// ============================ 마이페이지 내 있는 신청글 작성 부분 ============================

	// 봉사활동 - 신청 등록 페이지
	@GetMapping("/registerForm")
	public String recruitRegisterForm(RecruitSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사활동 등록 페이지 - GET", model);
		log.info(">>>>>>>>>>>>>>봉사신청 등록하기");
		
		final String token = _fileFileTokenService.getToken();
		Map<String, Object> map = _recruitBoardService.recruitWriteForm(search);
		
		model.addAttribute("token", token);
		model.addAttribute("groupCodeList", map.get("groupCodeList"));
		model.addAttribute("search", search);
		return "mypage/group/recruit_registerForm";
	} //recruitRegisterForm
	
	@PostMapping(value = "write")
	@ResponseBody
	public Map<String, Object> reviewWrite(@RequestPart("token") String token, @RequestPart("editor") String editorValue, RecruitBoardVO recruit, Authentication authentication) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("token", token);
		map.put("editor", editorValue);

		//에디터의 이미지파일 처리
		_fileUploadService.updateUseStatus(map);
		PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
		log.info("principal 데이터 확인 " + principal);
		
		recruit.setGroupMemSeq(principal.getUser().getMemSeq());
		recruit.setGroupName(principal.getUser().getLoginName());
		recruit.setRecruitContent(editorValue);
		recruit.setRecruitState("모집중");
		
		log.info("봉사모집 데이터 확인 = " + recruit);
		
		//봉사모집 게시판에 insert
		_recruitBoardService.recruitInsert(recruit);
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료

		return result;
	}
	
	
	
	// 봉사활동 - 신청 등록
//	@PostMapping("/register")
//	public String recruitRegister(RecruitBoardVO recruit, Model model) throws Exception {
//		super.setPageSubTitle("봉사활동 등록 페이지", model);
//		log.info(">>>>>>>>>>>>>>봉사신청 등록하기 - POST");
//		
//		try {
//			int success = _recruitBoardService.recruitInsert(recruit);
//			log.info("봉사활동 등록 성공 여부 : ", success);
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//
//		return "redirect:/recruit/list";
//	} // recruitRegister
	
	
	
	
//	--> 시연 안 할 것은 구현안해도 됨
//	
//	// 봉사활동 - 신청 수정 페이지
//	@GetMapping("/modify")
//	public String recruitModifyForm(RecruitBoardVO recruit, Model model) throws Exception {
//		super.setPageSubTitle("봉사활동 등록 페이지", model);
//		log.info(">>>>>>>>>>>>>>봉사신청 등록하기 - GET");
////		model.addAttribute("test", getConfig().getAdminName());
//		return "mypage/group/recruit_modify";
//	}
//	
//	// 봉사활동 - 신청 수정
//	@PostMapping("/modify")
//	public String recruitModify(RecruitBoardVO recruit, Model model) throws Exception {
//		super.setPageSubTitle("봉사활동 등록 페이지", model);
//		log.info(">>>>>>>>>>>>>>봉사신청 등록하기");
////		model.addAttribute("test", getConfig().getAdminName());
//		return "redirect:/list";
//	}
	
	
} // end class
