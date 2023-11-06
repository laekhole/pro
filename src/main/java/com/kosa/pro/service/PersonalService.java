package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kosa.pro.model.MasterCodeVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.search.ReviewSearchVO;
import com.kosa.pro.service.common.BaseService;

public class PersonalService extends BaseService {
	
	// [개인] 마이페이지 메인 화면 출력
	public Map<String, Object> personalMain(ReviewSearchVO search) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("personalInfo", (MemberVO) getDAO().selectOne("personal.personalInfo", search));
//		map.put("volunteerList", (List<VolunteerProceedVO>) getDAO().selectList("personal.selectVolunteerProceedList", search, ));
		return map;
	}
	
	// 봉사활동 출근/퇴근 시 봉사활동 누적 총 시간(실제 시간) 업데이트
	public int timeRecord(ReviewSearchVO search) {
		return getDAO().update("personal.timeRecord", search);
	}
	
	public Map<String, Object> reviewInfo(ReviewSearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("popularList", (List<ReviewBoardVO>) getDAO().selectList("review.selectPopularList", search));
		map.put("reviewInfo", getDAO().selectOne("review.selectOne", search));
		map.put("categoryList", (List<MasterCodeVO>)getDAO().selectList("code.selectCategoryCode", search));
		map.put("categoryName", (List<MasterCodeVO>)getDAO().selectList("code.selectCategoryCodeName", search));
		
		return map;
	}


}
