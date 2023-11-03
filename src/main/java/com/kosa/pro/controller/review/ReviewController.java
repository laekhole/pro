package com.kosa.pro.controller.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.ReviewBoardService;
import com.kosa.pro.utils.StringUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/")
public class ReviewController extends PrtController {
	
	@Autowired
	private ReviewBoardService _reviewBoardService;
	
	@RequestMapping("list")
	public String reviewList(ReviewSearchVO search, Model model) throws Exception {
		super.setPageSubTitle("후기게시판 목록", model);
		log.info(">>>>>>>>>>>>>>서치 = " + search.getCodeNumber());
		search.setRecordCount(5);
		search.setGroupCode("0001");
		if (!StringUtil.isEmpty(search.getCodeNumber()))
			model.addAttribute("categoryName", _reviewBoardService.codeName(search));
		
		Map<String, Object> map = _reviewBoardService.reviewList(search);
		model.addAttribute("list", map.get("reviewList"));
		model.addAttribute("polist", map.get("popularList"));
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("search", search);
		
		return "review/review_list";
	}
	
	@RequestMapping("info")
	public String reviewInfo(ReviewSearchVO search, Model model) {
		Map<String, Object> map = _reviewBoardService.reviewInfo(search);
		model.addAttribute("info", map.get("reviewInfo"));
		model.addAttribute("polist", map.get("popularList"));
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("categoryName", map.get("categoryName"));
		
		return "review/review_info";
	}
	
	@RequestMapping("writeForm")
	public String reviewWriteForm(Model model) {
		
		return "";
	}

}
