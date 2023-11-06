package com.kosa.pro.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.BoardService;
import com.kosa.pro.service.PersonalService;

/**메인 컨트롤러
 * @author kky
 *
 */
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/mypage/personal")
public class MypagePersonalController extends PrtController {

	@Autowired
	private PersonalService _personalService;
	
	@RequestMapping(value={"/", "/main"})
	public String myPageMain(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 마이페이지", model);
		log.info(">>>>>>>>>>>>>>메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/personal/mypageMain";
	}

	@RequestMapping("/finished")
	public String mypageFinished(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 종료된 봉사", model);
		log.info(">>>>>>>>>>>>>>메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/personal/mypageFinished";
	}
	
	
	@RequestMapping("/list")
	public String myPageList(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 나의 봉사 목록", model);
		log.info(">>>>>>>>>>>>>>메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/personal/mypageList";
	}

	
	@RequestMapping("/reviewed")
	public String myPageReviewed(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 내가 쓴 후기", model);
		log.info(">>>>>>>>>>>>>>메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/personal/mypageReviewed";
	}
	
	@RequestMapping("/template")
	public String myPageTemplate(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("봉사커뮤니티 마이페이지 리스트 템플릿", model);
		log.info(">>>>>>>>>>>>>>메인");
//		model.addAttribute("test", getConfig().getAdminName());
		return "mypage/personal/myPageTemplate";
	}
	
	
}
