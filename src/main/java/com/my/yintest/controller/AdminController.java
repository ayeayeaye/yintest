package com.my.yintest.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.yintest.model.User;
import com.my.yintest.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/view/all/agent")
	public String viewAllAgents(Model model) {		

		List<User> userList = userService.getAllUser();
	/*  List<User> agentList = new ArrayList<User>();
		for (User user : userList) {
			if(user.isAgent() == true)
			{
				agentList.add(user);
			}
		}
		model.addAttribute("agentList", agentList);*/
		model.addAttribute("userList", userList);
		model.addAttribute("newUserAgent", new User());
		return "admin-view-all-agent" ;		
	}
	
	@RequestMapping("/register/agent")
	public String createNewAgent(Model model) {		
		model.addAttribute("newUserAgent", new User());
		return "admin-register-agent";		
	}
	
	@RequestMapping(value="/registered/agent", method=RequestMethod.POST)
	public String registeredAgent(Model model, @ModelAttribute("newUserAgent") User userAgent) {		
		userAgent.setAgent(true);
		userAgent.setPassword("agent");/*dummy*/
		userService.saveUser(userAgent);
		return "success";		
	}
}
