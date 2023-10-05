package com.jspiders.carmvc.controller;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping; 
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.carmvc.pojo.UserPojo;
import com.jspiders.carmvc.service.UserService;



@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/createAccount")
	public String createAccountPage(ModelMap map) {
		UserPojo user = service.getAdmin();
		if (user != null) {
			map.addAttribute("warMsg", "Account Already Exist...");
			return "Login";
		}
		return "CreateAccount";
	}
	
	@PostMapping("/createAccount")
	public String createAccount(@RequestParam String username, @RequestParam String password, ModelMap map) {
		UserPojo user = service.createAccount(username, password);
		if (user != null) {
			map.addAttribute("succMsg", "Account Created Successfully...Login to Proceed");
			return "Login";
		}
		else {
		map.addAttribute("failMsg", "Account Not Created...Please Retry");
		return "CreateAccount";
		}
	
	}
	
	
	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, ModelMap map, HttpSession session) {
		UserPojo user = service.login(username, password);
		if (user != null) {
			session.setAttribute("login", user);
			map.addAttribute("wlcMsg", "Welcome "+user.getUsername());
			return "Home";
		}
		map.addAttribute("failMsg", "Login Failed, Invalid Credentials...!!!");
		return "Login";
	}
	
	
	@GetMapping("/logout")
	public String logout(ModelMap map, HttpSession session) {
		session.invalidate();
		
		
		map.addAttribute("warMsg", "Logged Out Successfully...");
		return "Login";
	}
	

}
