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
//			public Map<String, List<ChatRoomVO>> findAllRecruitChatRoom(MemberSearchVO search) throws Exception {
//
//				Map<String, List<ChatRoomVO>> chatRoomMap = new HashMap<>();
//				
//				chatRoomMap.put("RecruitChatRoomList", (List<ChatRoomVO>) getDAO().selectBySearch("adminchat.findAllRecruitChatRoom",
//						search, "totalCountChatroom"));
//				System.out.println("채팅 서비스 뭐 있음-->" + chatRoomMap);
//				return chatRoomMap;
//			}
			
			  // 봉사신청 게시글에 따른 신청자들과 단체회원 채팅방 목록
		    public Map<String, List<ChatRoomVO>> findAllRecruitChatRoom(MemberSearchVO search) throws Exception {

		        Map<String, List<ChatRoomVO>> chatRoomMap = new HashMap<>();

		        // MyBatis 쿼리 실행 이전에 로그 디버깅 추가
		        System.out.println("채팅 서비스 - findAllRecruitChatRoom 호출");
		        System.out.println("파라미터 search: " + search);

		        List<ChatRoomVO> chatRoomList = (List<ChatRoomVO>) getDAO().selectBySearch("adminchat.findAllRecruitChatRoom",
		                search, "totalCountChatroom");

		        // MyBatis 쿼리 결과 확인
		        System.out.println("채팅 서비스 - 조회 결과 chatRoomList: " + chatRoomList);

		        // 결과 객체를 모델에 추가하기 전에 로그 디버깅 추가
		        chatRoomMap.put("RecruitChatRoomList", chatRoomList);
		        System.out.println("채팅 서비스 - chatRoomMap: " + chatRoomMap);

		        return chatRoomMap;
 }
	





}		
			
			

