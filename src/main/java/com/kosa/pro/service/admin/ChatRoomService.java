package com.kosa.pro.service.admin;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.BoardSearchVO;
import com.kosa.pro.service.common.BaseService;
import com.kosa.pro.service.dao.ChatRoomDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomService  extends BaseService {

	private final ChatRoomDAO chatRoomDAO;
	
	
	// 모든 채팅 방 정보를 반환하는 메서드
	public List<ChatRoomVO> findAllRoom() {
		return chatRoomDAO.findAllRoom();
	}

	// 채팅 방을 생성하고 생성된 채팅 방 정보를 반환하는 메서드
	public ChatRoomVO createChatRoom(String name) {
		return chatRoomDAO.createChatRoom(name);
	}

	// 특정 채팅 방의 정보를 가져오는 메서드
	public ChatRoomVO findRoomById(String roomId) {
		return chatRoomDAO.findRoomById(roomId);
	}
	
	// 봉사신청 게시글에 따른 신청자들과 단체회원 채팅방 목록
		public Map<String, List<ChatRoomVO>> findAllRecruitChatRoom(SearchVO search) throws Exception {

			Map<String, List<ChatRoomVO>> chatRoomMap = new HashMap<>();
			
			chatRoomMap.put("findAllRecruitChatRoom", (List<ChatRoomVO>) getDAO().selectBySearch("adminchat.findAllRecruitChatRoom",
					search, "totalCountChatrecruit"));
			
			return chatRoomMap;
		}

}
