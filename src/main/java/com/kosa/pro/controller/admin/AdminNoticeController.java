package com.kosa.pro.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
public class AdminNoticeController {
	
	@Autowired
	AdminNoticeService _adminnoticeService;

	@RequestMapping("/adminnotice")
	public String adminMangementMain(NoticeSearchVO search, Model model) throws Exception {
		Map<String, List<NoticeVO>> map = _adminnoticeService.AdminNoticeList(search);
		model.addAttribute("search", search);
		log.info(">>>>>>>>>>>>>>관리자 공지사항");
		return "admin/adminnotice";
	}
}
