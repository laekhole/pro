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
	
	//회원리스트
	public Map<String, List<MemberVO>> memberList(MemberSearchVO search) throws Exception {
		
		Map<String, List<MemberVO>> map = new HashMap<>();
		map.put("memberList", (List<MemberVO>) getDAO().selectBySearch("member.selectMemberWithVolunteerTimeList", search, "totalCount"));
		return map;															
	}

}
