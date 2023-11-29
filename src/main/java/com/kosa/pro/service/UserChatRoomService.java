package com.kosa.pro.service;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class UserChatRoomService extends BaseService{


//개인회원 채팅방
	public VolunteerProceedVO findmyChatRoom(String memSeq) {
		
		VolunteerProceedVO chatRoomInfo = (VolunteerProceedVO) getDAO().selectOne("adminchat.findMyChatRoom", memSeq);
		
		return chatRoomInfo;
	}

//단체회원 채팅방
	public RecruitBoardVO findGroupmyChatRoom(int groupMemSeq) {

		RecruitBoardVO chatRoomGroupInfo = (RecruitBoardVO) getDAO().selectOne("adminchat.findGroupmyChatRoom", groupMemSeq);
		
		System.out.println("단체회원채팅");
		
		return chatRoomGroupInfo;
	}

	
	
}
