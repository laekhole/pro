package com.kosa.pro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.model.search.MemberSearchVO;
import com.kosa.pro.service.common.BaseService;

@Service
public class UserChatRoomService extends BaseService{


	
	//개인 채팅방 목록
	public List<VolunteerProceedVO> findmyChatRoom(String memSeq) {
		List<VolunteerProceedVO> chatRoomMyList = (List<VolunteerProceedVO>) getDAO().selectList("adminchat.findMyChatRoomList", memSeq);
	    System.out.println("개인회원채팅목록");
		// TODO Auto-generated method stub
		return chatRoomMyList;
	}
	

	//단체 채팅방 목록
	public List<RecruitBoardVO> findGroupChatRooms(int groupMemSeq) {
	    List<RecruitBoardVO> chatRoomGroupList = (List<RecruitBoardVO>) getDAO().selectList("adminchat.findGroupmyChatRoom", groupMemSeq);
	    System.out.println("단체회원채팅");
	    return chatRoomGroupList;
	}


}
