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

import com.kosa.pro.model.BoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.TestVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;
/** 후기 게시판 
 * @author kky
 *
 */
@Service
@Slf4j
public class ReviewBoardService extends BaseService {
	public Map<String, List<ReviewBoardVO>> reviewList(ReviewSearchVO search) throws Exception {
		Map<String, List<ReviewBoardVO>> map = new HashMap<>();
		map.put("reviewList", (List<ReviewBoardVO>) getDAO().selectBySearch("review.selectReviewList", search, "totalCount"));
		map.put("popularList", (List<ReviewBoardVO>) getDAO().selectList("review.selectPopularList", search));
		
		return map;
	}
	
	
	
	
	
}
