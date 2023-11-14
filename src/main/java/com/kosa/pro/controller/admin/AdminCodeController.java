package com.kosa.pro.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosa.pro.model.common.SearchVO;
import com.kosa.pro.model.search.CodeSearchVO;
import com.kosa.pro.service.admin.AdminCodeService;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminCodeController {

	@Autowired
	AdminCodeService _adminCodeService;
	
	@RequestMapping("/admincodemanagement")
	public String adminMangementMain(CodeSearchVO search, Model model) throws Exception {
		
		model.addAttribute("groupCode", _adminCodeService.groupCode(search));
		
		return "admin/admincodemanagement";
	}
}
