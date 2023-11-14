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
	
	// [개인] 마이페이지 메인 화면 출력 메소드
	public Map<String, Object> userMain(SearchVO search) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
//		map.put("userInfo", (MemberVO) getDAO().selectOne("user.userInfo", search)); // 프사 획득하기
		map.put("volunteerProceed", getDAO().selectOne("user.selectVolunteerProceed", search)); // 진행중 봉사 획득 용도
		map.put("volunteerTime", getDAO().selectOne("user.selectVolunteerTime", search)); // 봉사 온도 획득 용도
		map.put("volunteerRecord", getDAO().selectOne("user.volunteerRecord", search)); // 타임인 타임아웃 시간 획득 용도
		return map;
	}
	
	// 봉사활동 출석 시 데이터 insert. volunteer_proceed->volunteer_record
	public int attend(SearchVO search) {
		return getDAO().insert("user.volunteerAttend", search);
	}
	
	// 봉사활동 종료 시 시간 업데이트 // 봉사활동 종료 시 퇴근 찍으면 timeout 찍히는 용도
	public int recordUpdate(SearchVO search) {
		return getDAO().update("user.recordUpdate", search); 
	}
	
	// 봉사활동 종료 시 시간 업데이트
	public int updateTemperature(SearchVO search) {
		return getDAO().update("user.updateTemperature", search);
	}

	
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
