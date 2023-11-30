package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.GroupMemberVO;
import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.general.GeneralModel;
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
	
	//제재 해제 버튼 클릭시 실행되는 메소드
	public Map<String, Object> adminBlockClearBut(MemberVO memberVO) {
		
		System.out.println("제재 버튼 ajax 서비스");
		System.out.println("뭐들어있어 : ------"+memberVO.toString()+ memberVO);
		
		Map<String, Object> MemberBlockClear = new HashMap<>();
		
		int updateResult = getDAO().update("adminmember.AdminBlockClearMember", memberVO);
		MemberBlockClear.put("status",(updateResult > 0) ? "success" : "error");
		
		if (updateResult > 0) {
			MemberBlockClear.put("message", "제재함 버튼 해제 성공.");
	    } else {
	    	MemberBlockClear.put("message", "제재함 버튼 해제 실패");
	    }
	    
	    return MemberBlockClear;
	}
	
	// 체크 선택된 회원들의 회원 제제 벤 이력을 'Y'로 업데이트하는 메소드
	public Map<String, Object> adminCheckListBlockMember(List<Long> memSeqArray) {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("체크선택삭제서비스");
	    
	    try {
	        int updateCount = 0; // 업데이트된 회원 수를 카운트

	        // 회원 제제 벤 이력을 'Y'로 업데이트하는 쿼리 호출
	        int updateResult = getDAO().update("adminmember.CheckBanupdateMember", memSeqArray);


	        // 업데이트 결과에 따라 처리
	        if (updateResult > 0) {
	            updateCount = updateResult;
	            result.put("status", "success");
	            result.put("message", "선택된 " + updateCount + "명의 회원의 제제 벤 이력이 업데이트되었습니다.");
	        } else {
	            result.put("status", "error");
	            result.put("message", "선택된 회원 제제 벤 이력 업데이트 실패");
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	        result.put("status", "error");
	        result.put("message", "일괄 업데이트 중 오류가 발생했습니다.");
	    }
	    
	    System.out.println("찍는다 result 서비스" + result);
	    return result;
	}

	//체크 선택 해제 리스트
	// 체크 선택된 회원들의 회원 제재를 해제하는 메소드
	public Map<String, Object> adminCheckListUnblockButMember(List<Long> memSeqArray) {
	    Map<String, Object> result = new HashMap<>();
	    System.out.println("체크 선택 제재 해제 서비스");
	    
	    try {
	        int updateCount = 0; // 업데이트된 회원 수를 카운트

	        // 회원 제재 벤 이력을 'N'으로 업데이트하는 쿼리 호출
	        int updateResult = getDAO().update("adminmember.CheckUnbanupdateMember", memSeqArray);

	        // 업데이트 결과에 따라 처리
	        if (updateResult > 0) {
	            updateCount = updateResult;
	            result.put("status", "success");
	            result.put("message", "선택된 " + updateCount + "명의 회원의 제재가 해제되었습니다.");
	        } else {
	            result.put("status", "error");
	            result.put("message", "선택된 회원 제재 해제 실패");
	        }
	    } catch (Exception e) {
	        result.put("status", "error");
	        result.put("message", "일괄 제재 해제 중 오류가 발생했습니다.");
	    }
	    
	    System.out.println("찍는다 result 서비스" + result);
	    return result;
	}
	
	
	// 온도에 따라 회원을 정렬하여 가져오는 메소드
	public List<MemberVO> getMembersSortedByTemperature(String sortType) {
	    
		// "asc" 또는 "desc"에 따라 오름차순 또는 내림차순 정렬 쿼리를 선택합니다.
	    String sqlMapID = (sortType.equals("asc")) ? "adminmember.selectMembersSortedByTemperatureAsc" : "adminmember.selectMembersSortedByTemperatureDesc";

	    // 정렬된 회원 목록을 가져옵니다.
	    return (List<MemberVO>) getDAO().selectList(sqlMapID, null);
	}

	

	
	


}
