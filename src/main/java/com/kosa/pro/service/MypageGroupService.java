package com.kosa.pro.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.VolunteerRecordVO;
import com.kosa.pro.model.VolunteeringVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.common.BaseService;

import lombok.extern.slf4j.Slf4j;

/** 마이페이지(단체) 게시판 
 * @author kky
 *
 */
@Service
@Slf4j
public class MypageGroupService extends BaseService {
	
	
	/** 신청 수락/거절 페이지
	 * 기존 신청 내역
	 * 1. state 부분을 수락/거절로 변경할 것
	 * 2. 확정일 당일 날짜로 변경할 것
	 */
	// 신청확인(수락/거절) 목록 페이지
	public Map<String, List<VolunteerProceedVO>> volunteerProceedList(BoardSearchVO search) throws Exception {
		Map<String, List<VolunteerProceedVO>> map = new HashMap<>();
		
		map.put("list", (List<VolunteerProceedVO>) getDAO().selectBySearch("mypage.selectVolunteerProceedList", search, "totalCount"));

		return map;		
	}
	
	public int updateApprove(VolunteerProceedVO vpvo) throws Exception {
		System.out.println("신청 수락 서비스 진입");
		
		return getDAO().update("mypage.updateApprove", vpvo);	
	}
	
	public int updateReject(VolunteerProceedVO vpvo) throws Exception {
		System.out.println("신청 거절 서비스 진입");
		
		return getDAO().update("mypage.updateReject", vpvo);	
	}
	
	
	
	/** 진행 중인 봉사 페이지
	 * 기존 신청 내역
	 * 1. 진행 중인 봉사 날짜를 띄울 것
	 * 
	 */
	// 진행 중인 봉사 페이지
	public Map<String, List<VolunteeringVO>> volunteeringList(BoardSearchVO search) throws Exception {
		Map<String, List<VolunteeringVO>> map = new HashMap<>();
		System.out.println("진행 중인 봉사 페이지 진입");
		
		map.put("list", (List<VolunteeringVO>) getDAO().selectBySearch("mypage.selectVolunteeringdList", search, "totalCount"));
		
		return map;
	}

}
