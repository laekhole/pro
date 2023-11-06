package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;

/** 봉사 신청 목록 게시판 
 * @author kky
 *
 */
@Service
@Slf4j
public class RecruitBoardService extends BaseService {
	
	// 신청 목록 페이지
	public Map<String, List<RecruitBoardVO>> recruitList(BoardSearchVO search) throws Exception {
		Map<String, List<RecruitBoardVO>> map = new HashMap<>();
		
		map.put("recruitList", (List<RecruitBoardVO>) getDAO().selectBySearch("recruit.selectRecruitList", search, "totalCount"));
		
		
		return map;
		
	}
	
	// 신청 상세 페이지
	public Object recruitDetail(RecruitBoardVO recruit)  throws Exception {
		
		return getDAO().selectOne("recruit.selectRecruitGet", recruit);
	}
	
	
	// 신청 등록 페이지
	public int recruitInsert(RecruitBoardVO recruit)  throws Exception {
		
		return getDAO().insert("recruit.insertRecruit", recruit);
	}
	
//	
//	
//	// 신청 수정 페이지
//	public Object recruitUpdate(RecruitBoardVO recruit)  throws Exception {
//		
//		return getDAO().selectOne("recruit.updateRecruit", recruit);
//	}
//	
//	
//	// 신청 삭제
//	public Object recruitDelete(RecruitBoardVO recruit)  throws Exception {
//		
//		return getDAO().selectOne("recruit.deleteRecruit", recruit);
//	}
	
	

}
