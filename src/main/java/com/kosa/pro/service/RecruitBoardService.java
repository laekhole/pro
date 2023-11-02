package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;

/** 후기 게시판 
 * @author kky
 *
 */
@Service
@Slf4j
public class RecruitBoardService extends BaseService {
	
	// 신청 목록 페이지
	public Map<String, List<RecruitBoardVO>> recruitList(ReviewSearchVO search) throws Exception {
		Map<String, List<RecruitBoardVO>> map = new HashMap<>();
		
		map.put("recruitList", (List<RecruitBoardVO>) getDAO().selectBySearch("recruit.selectRecruitList", search, "totalCount"));
		
		
		return map;
		
	}
	
	
//	// 신청 상세 페이지
//	public RecruitBoardVO recruitDetail()  throws Exception {
//		
//		
////		map.put("recruitList", (List<RecruitBoardVO>) getDAO().selectBySearch("recruit.selectRecruitList", search, "totalCount"));
////		
////		
//		return map;
//		
//	}

}
