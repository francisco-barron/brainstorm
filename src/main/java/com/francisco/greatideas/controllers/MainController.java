package com.francisco.greatideas.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.francisco.greatideas.models.Idea;
import com.francisco.greatideas.models.User;
import com.francisco.greatideas.services.IdeaService;
import com.francisco.greatideas.services.UserService;
import com.francisco.greatideas.validator.UserValidator;

@Controller
public class MainController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final IdeaService iS;

	public MainController(UserService userService, UserValidator userValidator, IdeaService iS) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.iS = iS;
	}

	@RequestMapping("/")
	public String index(@ModelAttribute("user") User user) {
		return "index.jsp";
	}

	@RequestMapping("/signup")
	public String signup(@ModelAttribute("user") User user) {
		return "register.jsp";
	}
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			
			return "register.jsp";
		}
		User u = userService.registerUser(user);
		session.setAttribute("userId", u.getId());
		return "redirect:/storms";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
			HttpSession session) {
		boolean isAuthenticated = userService.authenticateUser(email, password);
		if (isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/storms";
		} else {
			model.addAttribute("user", new User());
			model.addAttribute("error", "Invalid Credentials. Please try again.");
			return "index.jsp";
		}
	}
	
	// HOMEPAGE
	@RequestMapping("/storms")
	public String homepage(HttpSession session, Model model) {

		if (session.getAttribute("userId") != null) {
			Long userId = (Long) session.getAttribute("userId");
			User u = userService.findUserById(userId);
			model.addAttribute("user", u);

			// IDEA TABLE
			List<Idea> ideaList = iS.findAllIdeas();
			model.addAttribute("ideas", ideaList);
			return "homePage.jsp";

		} else {
			System.out.println("You have not logined");
			return "redirect:/";
		}
	}
	
	// LOG OUT USER
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// RENDER NEW IDEA FORM
	@RequestMapping("/storms/new")
	public String ideaCreation(HttpSession session, Model model, @ModelAttribute("idea") Idea myIdea) {
		Long userId = (Long) session.getAttribute("userId");
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		return "idea.jsp";
	}
	
	// CREATE NEW IDEA
	@PostMapping("/storms/new")
	public String createIdea(@Valid @ModelAttribute("idea") Idea myIdea, BindingResult result) {


		
		if (result.hasErrors()) {

			System.out.println("Error creating idea");
			return "idea.jsp";
		} else {
			System.out.println(" Create Idea ");
			iS.createIdea(myIdea);
			return "redirect:/storms";
		}
	}
	// DISPLAY IDEA PAGE
		@RequestMapping("storms/{id}")
		public String displayIdea(@PathVariable("id") Long myId, Model model, HttpSession session) {
			Idea myIdea = iS.findIdeaById(myId);
			model.addAttribute("idea", myIdea);


			return "ideainfo.jsp";
		}
		// ADD LIKE 
		@RequestMapping("/storms/like/{id}")
		public String likeIdea(@PathVariable("id") Long myId, Model model, HttpSession session) {
			Long userId = (Long) session.getAttribute("userId");
			User u = userService.findUserById(userId);
			Idea idea = iS.findIdeaById(myId);
			
			u.getIdeas().add(idea);
			userService.updateUser(u);
			
			
			return "redirect:/storms";
		}
		
		//REMOVE LIKE

		@RequestMapping("/storms/{id}/unlike")
		public String unlikeIdea(@PathVariable("id") Long myId, Model model, HttpSession session) {
			Long userId = (Long) session.getAttribute("userId");
			User u = userService.findUserById(userId);
			Idea idea = iS.findIdeaById(myId);
			
			u.getIdeas().remove(idea);
			userService.updateUser(u);
			
			return "redirect:/storms";
		}
		
		// RENDER EDIT FORM FOR IDEA
		@RequestMapping("/storms/{id}/edit")
		public String editPage(@ModelAttribute("idea") Idea myIdea, @PathVariable("id") Long myId, Model model) {
			Idea idea = iS.findIdeaById(myId);
			model.addAttribute("idea", idea);
			return "edit.jsp";
		}
		// UPDATE IDEA
		@PostMapping("/storms/update")
		public String updateIdea(@Valid @ModelAttribute("idea") Idea myIdea, BindingResult result) {
			if (result.hasErrors()) {
				return "edit.jsp";
			} else {
	
				iS.updateIdea(myIdea);
				
				return "redirect:/storms";
			}
		}
		
		// DELETE IDEA
		@RequestMapping("/storms/delete/{id}")
		public String deleteIdea(@PathVariable("id") Long id) {
			Idea myIdea = iS.findIdeaById(id);
			if (myIdea != null) {
				iS.deleteIdea(myIdea);
				return "redirect:/storms";
			} else {
				System.out.println("Idea don't exist");
				return "redirect:/storms";
			}

		}
	
	
	
}

