package com.kosa.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MsgController extends PrtController {
	
	@RequestMapping("/msg")
	public String mainIndex(SearchVO search, Model model) throws Exception {
		super.setPageSubTitle("채팅/쪽지", model);
		log.info(">>>>>>>>>>>>>>채팅/쪽지");
//		model.addAttribute("test", getConfig().getAdminName());
		return "msg";
	}

}
