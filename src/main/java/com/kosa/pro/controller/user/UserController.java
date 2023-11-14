package com.kosa.pro.controller.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
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
	public String myPageMain(SearchVO search, Model model, HttpSession session) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 마이페이지", model);
		log.info(">>>>>>>>>>>>>>개인 메인");
		Map<String, Object> map = _userService.userMain(search);
		model.addAttribute("todayProceed", map.get("volunteerProceed"));
		model.addAttribute("temperature", map.get("volunteerTime"));
		
		
//		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		return "user/mypageMain";
	}

	
	// void로 할 지, 실패했을 때 로그든 에러메세지든 보여줘야 하는지 모르겠음
	// 출석 체크 시 table insert 메소드
	@RequestMapping("/attend")
	public void volunteerAttend(SearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>출석 체크");
		_userService.attend(search);
		}
	
	// void로 할 지, 실패했을 때 로그든 에러메세지든 보여줘야 하는지 모르겠음
	// 퇴근 버튼 클릭 시 update 메소드
	@RequestMapping("/recordUpdate")
	public void recordUpdate(SearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>record 테이블 시간 업데이트");
		_userService.timeRecord(search);
		}

	@RequestMapping("/finished")
	public String mypageFinished(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 종료된 봉사", model);
		log.info(">>>>>>>>>>>>>>개인 종료된 봉사");
		search.setRecordCount(5);

		Map<String, Object> map = _userService.finishedList(search);
		model.addAttribute("list", map.get("finishedList"));

		return "user/mypageFinished";
	}


	@RequestMapping("/list")
	public String myPageList(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 나의 봉사 목록", model);
		log.info(">>>>>>>>>>>>>>개인 나의 봉사 목록");

		Map<String, Object> map = _userService.proceedingList(search);
		model.addAttribute("list", map.get("proceedingList"));
	
		return "user/mypageList";
	}

	
	@RequestMapping("/reviewed")
	public String myPageReviewed(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 내가 쓴 후기", model);
		log.info(">>>>>>>>>>>>>>개인 후기");

		Map<String, Object> map = _userService.reviewedList(search);
		model.addAttribute("list", map.get("reviewedList"));
		
		return "user/mypageReviewed";
	}
	
	@RequestMapping("/template")
	public String myPageTemplate(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 마이페이지 리스트 템플릿", model);
		log.info(">>>>>>>>>>>>>>개인 템플릿 샘플");
//		model.addAttribute("test", getConfig().getAdminName());
		return "user/myPageTemplate";
	}
	
	
}
