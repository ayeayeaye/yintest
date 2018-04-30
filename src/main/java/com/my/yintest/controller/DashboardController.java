package com.my.yintest.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.yintest.service.CustomerService;
import com.my.yintest.service.DeviceService;



@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	
	@Autowired
	DeviceService deviceService;
	@Autowired
	CustomerService custService;
	
	@RequestMapping("/view")
	public String home(Model model) {		
		model.addAttribute("custList", custService.getAllCust());
		return "popup-dashboard";
	}
	

}