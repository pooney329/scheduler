package com.spring.scheduler.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.support.RequestContextUtils;

@Controller
public class MainController {
	
	//메인페이지 
	@RequestMapping("/")
	public String main(@RequestParam(required = false) String message,  Model model ,HttpServletRequest request) {
		System.out.println("메인페이지 실행");
		if(message!=null) {
			model.addAttribute("message",message);
		}
		
		
		return "index";
	}

}
