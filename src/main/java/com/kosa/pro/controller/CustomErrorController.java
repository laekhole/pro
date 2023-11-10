//package com.kosa.pro.controller;
//
//import org.springframework.boot.web.servlet.error.ErrorController;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.kosa.pro.model.common.AlertModel;
//import com.kosa.pro.model.common.SearchVO;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@Controller
//@RequestMapping("/errorCustom")
//public class CustomErrorController extends PrtController implements ErrorController {
//	
//	
////	@RequestMapping("/loginstate")
////	public String loginban(Model model, @RequestParam(value = "error", required = false) String error) {
////		AlertModel alert = new AlertModel();
////		
////		alert.setHref("/main");
////		
////		model.addAttribute("alert", alert);
////		return getConfig().getViewAlert();
////	}
//	
//	
//	@RequestMapping("/throw")
//	public String thrwoable(Model model) {
//		model.addAttribute("messageEng", "Throwable");
//		model.addAttribute("message", "예외가 발생했습니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/exception")
//	public String exception(Model model) {
//		model.addAttribute("messageEng", "Exception");
//		model.addAttribute("message", "예외가 발생했습니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/400")
//	public String error400(Model model) {
//		model.addAttribute("messageEng", "Bad Request");
//		model.addAttribute("message", "잘못된 요청입니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/403")
//	public String error403(Model model) {
//		model.addAttribute("messageEng", "Forbidden");
//		model.addAttribute("message", "접근할 수 없는 요청입니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/404")
//	public String error404(Model model) {
//		model.addAttribute("messageEng", "Not Found");
//		model.addAttribute("message", "잘못된 요청입니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/405")
//	public String error405(Model model) {
//		model.addAttribute("messageEng", "Method Not Allowed");
//		model.addAttribute("message", "요청된 메서드는 허용되지 않습니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/500")
//	public String error500(Model model) {
//		model.addAttribute("messageEng", "Internal Server Error");
//		model.addAttribute("message", "요청된 메서드는 허용되지 않습니다.");
//		return getConfig().getViewError();
//	}
//	
//	@RequestMapping("/503")
//	public String error503(Model model) {
//		model.addAttribute("messageEng", "Service Temporarily Unavailable");
//		model.addAttribute("message", "서버를 일시적으로 사용할 수 없습니다.");
//		return getConfig().getViewError();
//	}
//
//}
