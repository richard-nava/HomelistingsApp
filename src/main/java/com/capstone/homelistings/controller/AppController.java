package com.capstone.homelistings.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.capstone.homelistings.Utils.WebUtils;
import com.capstone.homelistings.model.Users;

@Controller
public class AppController {
	
	@Autowired
	private WebUtils webUtils;
	

	
	@GetMapping({"/","/index"})
	String index(Model model) {
		
		model.addAttribute("user", new Users());
		model.addAttribute("msg", "Welcome to the Spring Application");
		
		return "index";
	}
	
	@GetMapping("/about")
	String about(Model model) {
		
		model.addAttribute("msg", "We are in the ABOUT page. How great is that?");
		
		return "about";
	}
	
	@GetMapping("/services")
	String services(Model model) {
		
		model.addAttribute("_services", "active");
		
		return "services";
	}
	
	@GetMapping("/contact")
	String contact(Model model) {
		
		model.addAttribute("_contact", "active");
		
		return "contact";
	}
	
	
	
	@GetMapping("name")
	String name(@RequestParam String  id, @RequestParam String dob, Model model) {
		
		model.addAttribute("msg", "My name is: "+id + "." + "<br>" + "Birthday: " +dob);
		
		
		return "index";
	}
	
	
	
	@PostMapping("sendmessage")
	String signup(@RequestParam String name, @RequestParam String email,  
					@RequestParam String subject,  @RequestParam String message,  
					RedirectAttributes model) {
		
		
		webUtils.sendMail(email, message, subject);
		model.addAttribute("msg", "Your message has been sent. Thanks, " + name + "!");
		
		
		return "contact";
	}


	
	
	
	
}
