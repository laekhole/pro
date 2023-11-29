package com.kosa.pro.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.MemberVO;
import com.kosa.pro.model.NoticeVO;
import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.NoticeSearchVO;
import com.kosa.pro.service.admin.AdminNoticeService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminNoticeController {
	
	@Autowired
	AdminNoticeService _adminnoticeService;

	@RequestMapping("/adminnotice")
	public String adminMangementMain(NoticeSearchVO search, Model model) throws Exception {
		log.info(">>>>>>>>>>>>>>관리자 공지사항");
		
		List<NoticeVO> adminnoticeList = _adminnoticeService.AdminNoticeList(search).get("noticeList");
		System.out.println("--noticeList-- : " + adminnoticeList);
		model.addAttribute("adminnoticeList", adminnoticeList);
		model.addAttribute("search", search);
		return "admin/adminnotice";
	}
	
	@PostMapping("/insertnotice")
    public ResponseEntity<Map<String, Object>> insertNotice(@RequestBody NoticeVO notice) {
        Map<String, Object> response = new HashMap<>();
        try {
            log.info("공지사항 등록 요청: {}", notice);

            // 공지사항 등록 로직
            _adminnoticeService.insertNotice(notice);

            response.put("message", "공지사항이 성공적으로 등록되었습니다.");
            log.info("등록성공임");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            log.error("공지사항 등록 중 오류 발생: {}", e.getMessage());
            response.put("error", "공지사항 등록 중 오류가 발생했습니다.");
            log.info("등록실패임");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
	
	
	
	
	
	
	
	
	
}

