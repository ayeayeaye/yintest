package com.my.yintest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public String home() {		
		return "home";
	}
	
	@RequestMapping(value="/hello")
	public String createtSignup(){
		return "z";		
	}

}