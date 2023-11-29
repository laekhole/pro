package com.kosa.pro.service.admin;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.VolunteerTimeVO;
import com.kosa.pro.model.search.GroupMemberSearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

/**
 * 회원관리 -kmj
 */

@Service
public class AdminMemberService extends BaseService {

	// 회원리스트
	public Map<String, List<MemberVO>> memberList(MemberSearchVO search) throws Exception {

		Map<String, List<MemberVO>> map = new HashMap<>();
		map.put("memberList", (List<MemberVO>) getDAO().selectBySearch("adminmember.selectMemberWithVolunteerTimeList",
				search, "totalCount"));
		return map;
	}

	// 단체리스트
	public Map<String, List<GroupMemberVO>> groupMemberList(GroupMemberSearchVO search) throws Exception {
		
		// 단체 회원 리스트를 가져오는 쿼리 실행	
		System.out.println("단체 리스트 ajax 테스트");
		
		Map<String, List<GroupMemberVO>> groupmap = new HashMap<>();
		
		groupmap.put("groupList", (List<GroupMemberVO>) getDAO().selectBySearch("adminmember.selectgroupmemberwithgradelist",
				search, "totalCount"));
		
		System.out.println("서비스 groupList 이거");
	
		return groupmap;
	}

	//제재 버튼 클릭시 제제함으로 변경되는 메소드
	public Map<String, Object> adminBlockMember(MemberVO memberVO) {
		
		System.out.println("제재 버튼 ajax 서비스");
		System.out.println("뭐들어있어 : ------"+memberVO.toString()+ memberVO);
		
		Map<String, Object> MemberBlock = new HashMap<>();
		int updateResult = getDAO().update("adminmember.AdminBlockMember", memberVO);
		MemberBlock.put("status", (updateResult > 0) ? "success" : "error");
		
		if (updateResult > 0) {
	        MemberBlock.put("message", "회원에게 제재를 하였습니다");
	    } else {
	        MemberBlock.put("message", "회원에게 제재 실패");
	    }
	    
	    return MemberBlock;
	}
	
	
	
	// 온도에 따라 회원을 정렬하여 가져오는 메소드
	public List<MemberVO> getMembersSortedByTemperature(String sortType) {
	    
		// "asc" 또는 "desc"에 따라 오름차순 또는 내림차순 정렬 쿼리를 선택합니다.
	    String sqlMapID = (sortType.equals("asc")) ? "adminmember.selectMembersSortedByTemperatureAsc" : "adminmember.selectMembersSortedByTemperatureDesc";

	    // 정렬된 회원 목록을 가져옵니다.
	    return (List<MemberVO>) getDAO().selectList(sqlMapID, null);
	}


}
