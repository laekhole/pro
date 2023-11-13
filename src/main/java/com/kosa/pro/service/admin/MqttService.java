package com.kosa.pro.service.admin;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.kosa.pro.model.ChatRoomVO;
import com.kosa.pro.service.dao.ChatRoomDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MqttService {

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

	// MQTT 메시지를 처리하는 메서드
	public void execute(String topic, String payload) {
		// MQTT 토픽과 페이로드 정보를 출력
	    String[] cmdParams = StringUtils.split(topic, "/");
	    System.out.println("topic = " + topic);
	    System.out.println("payload = " + payload);
	}
}
