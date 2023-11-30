package com.kosa.pro.controller.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosa.pro.model.RecruitBoardVO;
import com.kosa.pro.model.VolunteerProceedVO;
import com.kosa.pro.service.UserChatRoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/userchat")
public class UserChatController {

	@Autowired
	private UserChatRoomService _userChatRoomService;


//	채팅방 개인 다중채팅방 목록 
	@GetMapping("/chatRoom")
	public String findmyChatRoom(@RequestParam(name = "memSeq") String memSeq, HttpServletRequest request, Model model) throws Exception {

		log.info("나의 채팅 목록 메인뷰");
		List<VolunteerProceedVO> mychatInfoList = _userChatRoomService.findmyChatRoom(memSeq);
		model.addAttribute("mychatInfoList", mychatInfoList);
	    model.addAttribute("memSeq", memSeq);
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("mychatInfoList", mychatInfoList);
	    System.out.println("컨트롤러 ->> " + mychatInfoList);

		return "chat/myChatRoomList";
	}
	
	//채팅방 입장시 세션에 정보저장
	@PostMapping("/setChatmyInfo")
	public ResponseEntity<?> setChatmyInfo(HttpSession session, @RequestParam("recruitSeq") String recruitSeq,
			@RequestParam("sender") String sender, @RequestParam("recruitTitle") String recruitTitle, @RequestParam("manager") String manager,
			@RequestParam("phone") String phone, @RequestParam("volunaddr") String volunaddr) {
	    // 세션에 채팅 정보 저장
		System.out.println("세션에 저장할 --> " + recruitTitle);
	    session.setAttribute("chat.recruitSeq", recruitSeq);
	    session.setAttribute("chat.recruitTitle", recruitTitle);
	    session.setAttribute("chat.sender", sender);
	    session.setAttribute("chat.manager", manager);
	    session.setAttribute("chat.phone", phone);
	    session.setAttribute("chat.volunaddr",volunaddr);

	    return ResponseEntity.ok().build();
	}
	
	// 개인 채팅 방 입장 페이지를 반환하는 핸들러
	@GetMapping("/room/enter")
	public String roomEnter(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		List<VolunteerProceedVO> myChatRoomList = (List<VolunteerProceedVO>) session.getAttribute("mychatInfoList");
//	    String title = (String) session.getAttribute("chat.title");
	    String recruitTitle = (String) session.getAttribute("chat.recruitTitle");
	    String name = (String) session.getAttribute("chat.sender");
	    String manager = (String) session.getAttribute("chat.manager");
	    String phone = (String) session.getAttribute("chat.phone");
	    String volunaddr = (String) session.getAttribute("chat.volunaddr");
	    
//	    model.addAttribute("title", title);
	    model.addAttribute("recruitTitle", recruitTitle);
	    model.addAttribute("name", name);
	    model.addAttribute("manager", manager);
	    model.addAttribute("phone", phone);
	    model.addAttribute("volunaddr", volunaddr);
	    
	    System.out.println("recruitTitle --> " + recruitTitle);
//	    System.out.println("title --> " + title);
	    
		return "/chat/myChatRoom";
	}
	
//	단체 다중 채팅방 list
	@GetMapping("/chatGroupRoom")
	public String findGroupmyChatRoom(@RequestParam(name = "groupMemSeq") int groupMemSeq, HttpServletRequest request, Model model)
			throws Exception {
		
		log.info("나의 채팅 목록 메인뷰");
		List<RecruitBoardVO> groupChatRoomList = _userChatRoomService.findGroupChatRooms(groupMemSeq);
		model.addAttribute("groupChatRoomList", groupChatRoomList);
		model.addAttribute("groupMemSeq", groupMemSeq);
		
		HttpSession session = request.getSession();
		session.setAttribute("groupChatRoomList", groupChatRoomList);
		System.out.println("컨트롤러 ->> " + groupChatRoomList);
		
		return "chat/myGroupChatRoomList";
	}

	
	//단체 채팅방 입장시에 들고갈 정보 ajax 통신
	@PostMapping("/setChatInfo")
	public ResponseEntity<?> setChatInfo(HttpSession session,
	                                     @RequestParam("recruitSeq") String recruitSeq,
	                                     @RequestParam("sender") String sender,
	                                     @RequestParam("title") String title) {
	    // 세션에 채팅 정보 저장
	    session.setAttribute("chat.recruitSeq", recruitSeq);
	    session.setAttribute("chat.sender", sender);
	    session.setAttribute("chat.title", title);

	    return ResponseEntity.ok().build();
	}

	//단체 채팅방 입장
	@GetMapping("/room/groupEnter")
	public String roomGroupEnter(HttpServletRequest request, Model model) {
	    HttpSession session = request.getSession();
	    
	 // 세션에서 채팅방 목록과 제목을 가져옵니다.
	    List<RecruitBoardVO> groupChatRoomList = (List<RecruitBoardVO>) session.getAttribute("groupChatRoomList");
	    String title = (String) session.getAttribute("chat.title");
	    String groupname = (String) session.getAttribute("chat.sender");

	    model.addAttribute("title", title);
	    model.addAttribute("groupname", groupname);
	    
	    return "/chat/myGroupChatRoom";
	}

}
