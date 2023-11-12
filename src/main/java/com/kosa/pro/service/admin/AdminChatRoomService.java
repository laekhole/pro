package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class AdminChatRoomService extends BaseService{

	// 봉사신청 게시글에 따른 신청자들과 단체회원 채팅방 목록
			public Map<String, List<ChatRoomVO>> findAllRecruitChatRoom(MemberSearchVO search) throws Exception {

				Map<String, List<ChatRoomVO>> chatRoomMap = new HashMap<>();
				
				chatRoomMap.put("RecruitChatRoomList", (List<ChatRoomVO>) getDAO().selectBySearch("adminchat.findAllRecruitChatRoom",
						search, "totalCountChatrecruit"));
				System.out.println("채팅 서비스 뭐 있음-->" + chatRoomMap);
				return chatRoomMap;
			}
}
