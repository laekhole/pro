//package com.kosa.pro.service.dao;
//
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.stream.Collectors;
//
//import javax.annotation.PostConstruct;
//
//import org.apache.ibatis.annotations.Mapper;
//import org.springframework.stereotype.Repository;
//
//import com.kosa.pro.model.ChatRoomVO;
//
//
//@Mapper
//@Repository
//public class ChatRoomDAO {
//  private Map<String, ChatRoomVO> chatRoomMap;
//
//  // 빈이 초기화될 때 호출되는 메서드
//  @PostConstruct
//  private void init() {
//      // 채팅 방 목록을 저장할 맵을 초기화 - LinkedHashMap은 입력된 순서에 따라 튀어나옴
//      chatRoomMap = new LinkedHashMap<>();
//  }
//
//  // 모든 채팅 방 정보를 채팅방 이름 순으로 정렬하여 반환하는 메서드
//  public List<ChatRoomVO> findAllRoom() {
//    // 채팅방 이름 순으로 반환
//		return chatRoomMap.values().stream().sorted().collect(Collectors.toList());
//  }
//
//  // 특정 채팅 방의 정보를 가져오는 메서드
//  public ChatRoomVO findRoomById(String id) {
//      return chatRoomMap.get(id);
//  }
//
//  // 채팅 방을 생성하고 맵에 추가한 후 해당 채팅 방 정보를 반환하는 메서드
//  public ChatRoomVO createChatRoom(String name) {
//      ChatRoomVO chatRoom = ChatRoomVO.create(name, null); //ChatRoomVo의 VolunteerProceed객체 넣어둠.
//      chatRoomMap.put(chatRoom.getChatRoomId(), chatRoom);
//      return chatRoom;
//  }
//  
//  // 봉사신청 게시글에 따른 신청자들과 단체회원 채팅방 목록
//  public List<ChatRoomVO> findAllRecruitRoom(){
//	  
//	  return chatRoomMap.values().stream().sorted().collect(Collectors.toList());
//  }
//  
//}
