package com.capstone.homelistings.controller;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.capstone.homelistings.Utils.WebUtils;
import com.capstone.homelistings.model.Users;
import com.capstone.homelistings.repository.UsersRepository;

@Controller
@SessionAttributes("loggedInUser")
public class LoginController {
	
	@Autowired
	private UsersRepository repo;
	
	@Autowired
	private WebUtils webUtils;
	
	@PostMapping("Register")
	String register(@ModelAttribute Users user, RedirectAttributes redirect) {
		
		try {
			Optional<Users> usr = repo.getByEmail(user.getEmail());
			if(usr.isPresent()) {
				
				redirect.addFlashAttribute("error", "User already exists");
				return "redirect:/Register";
			}
			repo.save(user);
			redirect.addFlashAttribute("msg", "Registration Successful");
		}catch(Exception e) {
			
		}
		
	return "redirect:/Login";
	}
	
	@GetMapping("Login")
	String login() {
		return "Login";
	}
	
	@GetMapping("profile")
	String profile() {
		return "profile";
	}
	
	@GetMapping("logout")
	String logout(SessionStatus status, Model model) {
		
		status.setComplete();
		model.addAttribute("loggedInUser", "");
		model.addAttribute("msg", "Farewell!");
		return "Login";
	}
	
	@PostMapping("Login")
	String login(@RequestParam String email,
				 @RequestParam String password, Model model) {
		
		Optional<Users>  usr = repo.login(email,password);
		if(usr.isPresent()) {
			
			model.addAttribute("msg", "Sup babe");
			model.addAttribute("loggedInUser", usr.get());
			return "profile";
		}
		
		model.addAttribute("error", "Invalid credentials");
		return "Login";
	}
	
	
	@GetMapping("Register")
	String register(Model model) {
		
		model.addAttribute("user", new Users());
		return "Register";
	}
	
	@GetMapping("users")
	String users(Model model) {
		
		model.addAttribute("users", repo.findAll());
		model.addAttribute("msg", "All Users");
		
		
		
		return "users";
	}
	
	@PostMapping("search")
	String search(@RequestParam String name, Model model) {
		
		model.addAttribute("users", repo.searchByName(name));
		model.addAttribute("msg","Users found" + name);
		
		
		return "users";
	}
	
	
	@GetMapping("delete")
	String delete(@RequestParam Long id, RedirectAttributes redirect) {
		
		try {
			repo.deleteById(id);
			redirect.addFlashAttribute("success", "Delete success");
		} catch (Exception e) {
			
			e.printStackTrace();
			redirect.addFlashAttribute("success", "Delete failure...");
		}
		
		
		
		return "redirect:/users";
	}
	
	@PostMapping("editrole")
	String editrole(@RequestParam String role, @RequestParam Long id, RedirectAttributes redirect) {
		
		try {
			repo.findById(id).ifPresent(user->{
				user.setRole(role);
				repo.save(user);
			}
			);
			redirect.addFlashAttribute("success", role + " Role granted!");
		} catch (Exception e) {
			
			e.printStackTrace();
			redirect.addFlashAttribute("success", "- Request Failed");
		}
		
		
		
		return "redirect:/users";
	}
	
	@PostMapping("update")
	String update(@ModelAttribute Users user, Model model) {
		
		repo.findById(user.getId()).
		ifPresent(a->{a.setAddress(user.getAddress());
		a.setCity(user.getCity());
		a.setState(user.getState());
		a.setFname(user.getFname());
		a.setLname(user.getLname());
		a.setPhone(user.getPhone());
		repo.save(a);
		model.addAttribute("loggedInUser", a);
		});
		model.addAttribute("msg", "Update Successful");
		
		return "profile";
	}
	
	@PostMapping("addimages")
	public String add(@RequestParam("file") MultipartFile file, 
	@RequestParam Long id, Model model) {
	        
	Pattern ext = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg))$)");
	try {

	  if(file != null && file.isEmpty()){
	  model.addAttribute("error", "Error No file Selected "); 
	      return "redirect:profile"; 
	      } 
	  if(file.getSize()>1073741824){
	  model.addAttribute("error","File size "+file.getSize()+"KB excceds max allowed, try another photo ");
	  return "redirect:profile"; 
	      } 
	  Matcher mtch = ext.matcher(file.getOriginalFilename());
	 
	  if (!mtch.matches()) {
	  model.addAttribute("error", "Invalid Image type "); 
	      return "redirect:profile";  
	  }

	//save image
	webUtils.addProfilePhoto(file, id, "users");
	model.addAttribute("msg", "Upload success "+ file.getSize()+" KB");
	model.addAttribute("loggedInUser", repo.findById(id).get());
	model.addAttribute("_profile", "active");
	} catch (Exception e) {
	 e.printStackTrace();
	}

	return "profile";
	}
	
	
}
