package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.ReviewBoardVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

/**
 * 회원관리 -kmj
 */

@Service
public class MemberService extends BaseService {

	// 회원리스트
	public Map<String, List<MemberVO>> memberList(MemberSearchVO search) throws Exception {

		Map<String, List<MemberVO>> map = new HashMap<>();
		map.put("memberList", (List<MemberVO>) getDAO().selectBySearch("adminmember.selectMemberWithVolunteerTimeList",
				search, "totalCount"));
		return map;
	}

	// 단체리스트
	public List<MemberVO> groupMemberList(MemberSearchVO search) throws Exception {
		// 단체 회원 리스트를 가져오는 쿼리 실행
		List<MemberVO> groupList = (List<MemberVO>) getDAO().selectList("adminmember.selectGroupMemberList", search);
		return groupList;
	}

}
