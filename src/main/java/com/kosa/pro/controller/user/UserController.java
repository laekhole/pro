package com.kosa.pro.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosa.pro.config.auth.PrincipalDetails;
import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.search.UserSearchVO;
import com.kosa.pro.service.UserService;

/**메인 컨트롤러
 * @author kky
 *
 */
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/user")
public class UserController extends PrtController {

	@Autowired
	private UserService _userService;
	
	@RequestMapping(value={"", "/", "/main"})
	public String myPageMain(UserSearchVO search, Model model, Authentication authentication) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 마이페이지", model);
		log.info(">>>>>>>>>>>>>>개인 메인");
//		log.info("개인 메인 시퀀스 오냐 = " + search.getMemSeq());

		getMemSeq(search, authentication); // memSeq 획득용
		Map<String, Object> map = _userService.userMain(search); // 서비스 메소드 실행
		
		model.addAttribute("profil", map.get("profil")); // 프로필 사진 획득 용도
		model.addAttribute("todayProceed", map.get("volunteerProceed")); // 진행중 봉사 획득 용도
		model.addAttribute("temperature", map.get("volunteerTime")); // 봉사 온도 획득 용도
		model.addAttribute("timeinout", map.get("volunteerRecord")); // 타임인 타임아웃 시간 획득 용도
		
		return "user/mypageMain";
	}

	// 종료된 봉사
	@RequestMapping("/finished")
	public String mypageFinished(UserSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 종료된 봉사", model);
		log.info(">>>>>>>>>>>>>>개인 종료된 봉사");
		search.setRecordCount(5);
//		log.info("시퀀스 오냐 = " + search.getMemSeq());

		Map<String, Object> map = _userService.finishedList(search);
		model.addAttribute("list", map.get("finishedList"));
		model.addAttribute("search", search);
		
		return "user/mypageFinished";
	}

	// 나의 봉사 목록
	@RequestMapping("/list")
	public String myPageList(UserSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 나의 봉사 목록", model);
		log.info(">>>>>>>>>>>>>>개인 나의 봉사 목록");
		search.setRecordCount(5);
//		log.info("시퀀스 오냐 = " + search.getMemSeq());

		Map<String, Object> map = _userService.proceedingList(search);
		model.addAttribute("list", map.get("proceedingList"));
	
		return "user/mypageList";
	}

	// 내가 쓴 후기
	@RequestMapping("/reviewed")
	public String myPageReviewed(UserSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 내가 쓴 후기", model);
		log.info(">>>>>>>>>>>>>>개인 후기");
		search.setRecordCount(5);
		log.info("시퀀스 오냐 = " + search.getMemSeq());
		
		Map<String, Object> map = _userService.reviewedList(search);
		model.addAttribute("list", map.get("reviewedList"));
		
		return "user/mypageReviewed";
	}
	
	
	// 진행 중 봉사 출석 체크 메소드
	@RequestMapping("/attend")
	public ResponseEntity<String> volunteerAttend(UserSearchVO search, Authentication authentication) throws Exception {
	    log.info(">>>>>>>>>>>>>>출석 체크");
	    // UserSearchVO에 memSeq 셋팅
	    getMemSeq(search, authentication);
	    
	    boolean success = _userService.attend(search);
	    
	    if (success) {
	        return ResponseEntity.ok("출석이 정상적으로 처리되었습니다.");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("데이터 삽입 중 오류가 발생했습니다.");
	    }
	}

	
	// void로 할 지, 실패했을 때 로그든 에러메세지든 보여줘야 하는지 모르겠음
	// 퇴근 버튼 클릭 시 update 메소드
	@RequestMapping("/recordUpdate")
	public void recordUpdate(UserSearchVO search, Authentication authentication) throws Exception {
		log.info(">>>>>>>>>>>>>>record 테이블 시간 업데이트");
		// UserSearchVO에 memSeq 셋팅
		getMemSeq(search, authentication);
		_userService.recordUpdate(search);		
		}

	
	// 풀캘린더 데이터 조회 메소드
    @RequestMapping("/calendar")
    @ResponseBody
    public List<Map<String, Object>> scheduleFind(UserSearchVO search, Authentication authentication) {

    	System.out.println("search.toString : "+search.toString());
		
    	getMemSeq(search, authentication);
    	System.out.println("search.toString : "+search.toString());

    	List<RecruitBoardVO> listAll = _userService.scheduleFind(search);
 
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();

        for (RecruitBoardVO board : listAll) {
            hash.put("title", board.getRecruitTitle());
            hash.put("start", board.getVolunStartDate());
            hash.put("end", board.getVolunEndDate());

            jsonArr.add(hash);
        }

        log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr;
    }
	
	
	//로그인 유저 데이터 구성
	public void getMemSeq(UserSearchVO search, Authentication authentication) {
		if (authentication != null) {
			PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
			search.setMemSeq(principal.getUser().getMemSeq());
		}
		
	}

	
	
	// 공용 템플릿 샘플
	@RequestMapping("/msg")
	public String myPageTemplate(UserSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 마이페이지 리스트 템플릿", model);
		log.info(">>>>>>>>>>>>>>개인 템플릿 샘플");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}
	
	
//	// 공용 템플릿 샘플
//	@RequestMapping("/template")
//	public String myPageTemplate(UserSearchVO search, Model model) throws Exception {
//		super.setPageSubTitle("봉사커뮤니티 마이페이지 리스트 템플릿", model);
//		log.info(">>>>>>>>>>>>>>개인 템플릿 샘플");
////		model.addAttribute("test", getConfig().getAdminName());
//		return "user/myPageTemplate";
//	}
	
}
