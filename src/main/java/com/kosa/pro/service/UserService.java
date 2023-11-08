package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class UserService extends BaseService {
	
//	// [개인] 마이페이지 메인 화면 출력 메소드
//	public Map<String, Object> userMain(ReviewSearchVO search) throws Exception {
//		Map<String, Object> map = new HashMap<>();
//		
////		map.put("userInfo", (MemberVO) getDAO().selectOne("user.userInfo", search));
////		map.put("volunteerList", (List<VolunteerProceedVO>) getDAO().selectList("personal.selectVolunteerProceedList", search, ));
//		return map;
//	}
	
//	// 봉사활동 출근/퇴근 시 봉사활동 누적 총 시간(실제 시간) 업데이트
//	public int timeRecord(ReviewSearchVO search) {
//		return getDAO().update("personal.timeRecord", search);
//	}

	// [개인] 종료된 봉사
	public Map<String, Object> finishedList(SearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("finishedList", (List<RecruitBoardVO>) getDAO().selectList("user.selectFinishedList", search));
		
		return map;
	}

	// [개인] 나의 봉사 목록
	public Map<String, Object> proceedingList(SearchVO search) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("proceedingList", (List<RecruitBoardVO>) getDAO().selectList("user.selectRecruitList", search));
		
		return map;
	}
	// [개인] 내가 쓴 후기
	public Map<String, Object> reviewedList(SearchVO search) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("진입점");
		map.put("reviewedList", (List<ReviewBoardVO>) getDAO().selectList("user.selectReviewList", search));
		System.out.println("출력잘되나");
		System.out.println(map);
		return map;
	}

}
