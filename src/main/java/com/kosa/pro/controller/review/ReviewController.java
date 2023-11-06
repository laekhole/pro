package com.kosa.pro.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosa.pro.controller.PrtController;
import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.ReviewBoardService;
import com.kosa.pro.service.common.FileTokenService;
import com.kosa.pro.service.common.FileUploadService;
import com.kosa.pro.utils.StringUtil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/")
public class ReviewController extends PrtController {
	
	@Autowired
	private ReviewBoardService _reviewBoardService;
	@Autowired
	private FileTokenService _fileFileTokenService;
	@Autowired
	private FileUploadService _fileUploadService;
	
	
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
	public String reviewWriteForm(ReviewSearchVO search, Model model) {
		final String token = _fileFileTokenService.getToken();
		log.debug("token = ", token);
		search.setTableName("review");
		Map<String, Object> map = _reviewBoardService.reviewWriteForm(search);
		
		model.addAttribute("categoryList", map.get("categoryList"));
		model.addAttribute("search", search);
		model.addAttribute("token", token);
		return "review/review_write";
	}
	
	
	@PostMapping(value = "write")
	@ResponseBody
	public Map<String, Object> reviewWrite(
			@RequestPart("file") MultipartFile file, 
	        @RequestPart("editor") String editorValue,
	        @RequestPart("tableName") String tableName,
	        @RequestPart("token") String token,
	        @RequestPart("title") String title ) throws Exception {
		Map<String, Object> map = new HashMap<>();
		ReviewSearchVO search = new ReviewSearchVO();
		search.setTableName(tableName);
		search.setToken(token);
		map.put("token", token);
		map.put("editor", editorValue);
		
		log.info("파일 = " + file);
		log.info("에디터데이터 = " + editorValue);
		log.info("테이블이름 = " + tableName);
		log.info("토큰 = " + token);
		log.info("제목 = " + title);

		//에디터의 이미지파일 처리
		_fileUploadService.updateUseStatus(map);
		
		//insert 데이터 구성(봉사게시판번호, 글제목, 글내용, 작성자, 이미지파일번호)
		ReviewBoardVO reviewBoard = ReviewBoardVO.of(0, title, editorValue, "작성자", 0);
		int refSeq = _reviewBoardService.reviewInsert(reviewBoard);
		
		search.setRefSeq(String.valueOf(refSeq));
		//썸네일 이미지 업로드
		int imageSeq = (int) _fileUploadService.fileUploadProcess(search, file);
		
		//게시판에 이미지 번호 업데이트 (해당 로직 썸네일 테이블 새로 만들지 고민)
		log.info("파일업로드된 이미지 번호 >>>>" + imageSeq);
		log.info("글 등록된 게시판 번호 >>>>> " + refSeq);
		reviewBoard.setImageSeq(imageSeq);
		reviewBoard.setReviewSeq(refSeq);
		
		_reviewBoardService.reviewInsert(reviewBoard);
		
		Map<String, Object> result = new HashMap<>();
		result.put("uploaded", true); // 업로드 완료

		return result;
	}

}
