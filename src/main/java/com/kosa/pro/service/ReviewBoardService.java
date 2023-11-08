package com.kosa.pro.service;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosa.pro.model.BoardVO;
import com.kosa.pro.model.CategoryVO;
import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.TestVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.common.BaseService;
import com.kosa.pro.utils.StringUtil;

import lombok.extern.slf4j.Slf4j;
/** 후기 게시판 
 * @author kky
 *
 */
@Service
@Slf4j
public class ReviewBoardService extends BaseService {
	public Map<String, Object> reviewList(ReviewSearchVO search) throws Exception {
		Map<String, Object> map = new HashMap<>();

		map.put("reviewList", (List<ReviewBoardVO>) getDAO().selectBySearch("review.selectReviewList", search, "totalCount"));
		map.put("popularList", (List<ReviewBoardVO>) getDAO().selectList("review.selectPopularList", search));
		map.put("categoryList", (List<MasterCodeVO>)getDAO().selectList("code.selectCategoryCode", search));
		return map;
	}
	
	public MasterCodeVO codeName(ReviewSearchVO search) {
		return (MasterCodeVO) getDAO().selectOne("code.selectCodeName", search);
	}
	
	public Map<String, Object> reviewInfo(ReviewSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("popularList", (List<ReviewBoardVO>) getDAO().selectList("review.selectPopularList", search));
		map.put("reviewInfo", getDAO().selectOne("review.selectOne", search));
		map.put("categoryList", (List<MasterCodeVO>)getDAO().selectList("code.selectCategoryCode", search));
		map.put("categoryName", (List<MasterCodeVO>)getDAO().selectList("code.selectCategoryCodeName", search));
		
		return map;
	}
	
	public Map<String, Object> reviewWriteForm(ReviewSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		map.put("categoryList", (List<MasterCodeVO>)getDAO().selectList("code.selectCategoryCode", search));
		
		return map;
	}
	
	@Transactional
	public int reviewInsert(ReviewBoardVO reviewBoard) {
		log.info("등록 전 게시판 시퀀스 = " + reviewBoard.getReviewSeq());
		getDAO().insert("review.merge", reviewBoard);
		log.info("등록 후 게시판 시퀀스 = " + reviewBoard.getReviewSeq());
		return reviewBoard.getReviewSeq();
	}
	
	public void reviewViewCount(ReviewSearchVO search) {
		
		getDAO().update("review.updateViewCount", search);
		
	}
	
	
	
}
