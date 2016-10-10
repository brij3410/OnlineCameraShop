package com.brijesh.onlinecamera.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.onlinecamera.model.User;
import com.brijesh.onlinecamera.service.BrandService;
import com.brijesh.onlinecamera.service.CategoryService;
import com.brijesh.onlinecamera.service.UserService;

@Controller
public class UserController {
	
	
	@Autowired
	UserService userService;
	
	@Autowired
	BrandService brandService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired 
	private HttpSession session;
	
	
	@RequestMapping(value = "/getAllUserss")
	@ResponseBody
	public List<User> getAllUsers() {
		return userService.listAll();
	}
	
	@RequestMapping("/Register")
	public ModelAndView regpage(){
		ModelAndView m = new ModelAndView("register");
		return m;
	}
	
	@RequestMapping("/Login")
	public ModelAndView loginpage(){
		ModelAndView m = new ModelAndView("login");
		return m;
	}
	
	@ModelAttribute("save_user")
	public User createFormModelAttribute() {
		return new User();
	}
	
	//Add Category
			@RequestMapping(value = "/saveUser", method=RequestMethod.POST)
			public ModelAndView getSaveCategory(@Valid @ModelAttribute("save_user") User userobj, BindingResult result, Model model)
			{
				ModelAndView mv = new ModelAndView("register");
				ModelAndView m = new ModelAndView("index");
				m.addObject("brandList", brandService.listAll());
				m.addObject("categoryList", categoryService.listAll());
				if(result.hasErrors())
				{
					return mv;
				}
				
				if(userService.getUserByID(userobj.getEmail())== null){
					userService.saveUser(userobj);
					m.addObject("user", userService.getUserByID(userobj.getEmail()));
					m.addObject("success", "Registratation Successfully");
					return m;
				}
				else
				{ mv.addObject("msg", "User exists with this email id");
				 return mv;
				}
				 
				
			}
			
				//try
				//{
					
				//	userService.saveUser(userobj);
				//	m.addObject("user", userService.getUserByID(userobj.getEmail()));
				//}
				//catch(Exception ex){
				//	model.addAttribute("error", ex.getMessage());
				//	return mv;
				//}
				//return m;
			//}
			
			@ModelAttribute("log")
			public User createModelAttribute() {
				return new User();
			}
			
			@RequestMapping(value="/loginUser",method=RequestMethod.POST)
			public ModelAndView loginfun(@Valid @ModelAttribute("log") User userobj, BindingResult result, Model model){
			ModelAndView mv = new ModelAndView("login");
			ModelAndView m = new ModelAndView("index");
			ModelAndView ma = new ModelAndView("adminhome");
			m.addObject("brandList", brandService.listAll());
			m.addObject("categoryList", categoryService.listAll());
			if(userService.isValidUser(userobj.getEmail(), userobj.getPassWord())==null){
				mv.addObject("loginfail", "Please register");
				return mv;
			}
			else{
				if((userobj.getEmail().equals("brij3410@yahoo.co.in")) &&((userobj.getPassWord()).equals("brij3410#"))){
					System.out.println("in Admin");
					session.setAttribute("brandList", brandService.listAll());
					session.setAttribute("categoryList", categoryService.listAll());
					session.setAttribute("loginuser", userService.getUserByID(userobj.getEmail()));
					return ma;
				}
				session.setAttribute("brandList", brandService.listAll());
				session.setAttribute("categoryList", categoryService.listAll());
				session.setAttribute("loginuser", userService.getUserByID(userobj.getEmail()));
				return m;
				
			}
			}
			
			// Logout admin/user
			
			@RequestMapping("/Logout")
			public ModelAndView logoutau(HttpServletRequest request){
				ModelAndView m = new ModelAndView("index");
				session.invalidate();
				session = request.getSession(true);
				session.setAttribute("brandList", brandService.listAll());
				session.setAttribute("categoryList", categoryService.listAll());
				m.addObject("logoutmsg", "You are successfully logout");
				return m;
				
			}
			
			//Edit Operation
			@RequestMapping(value = "/editUser")
			public ModelAndView getBrand_Edit(@RequestParam("email") String  email)
			{
				System.out.println(email);
				User getUser = userService.getUserByID(email);
				return new ModelAndView("editProfile","UserData", getUser);
			}
			
			@ModelAttribute("save_edit_user")
			public User createFormModelAttributeForEdit() {
				return new User();
			}
			
			//Add Category
			@RequestMapping(value = "/saveEditUser", method=RequestMethod.POST)
			public ModelAndView getEditSaveUser(@Valid @ModelAttribute("save_edit_user") User userobj, BindingResult result, Model model)
			{
				ModelAndView mv = new ModelAndView("editProfile");
				ModelAndView m = new ModelAndView("index");
				if(result.hasErrors())
				{
					return mv;
				}
				try
				{
					userService.editUser(userobj);
				}
				catch(Exception ex){
					model.addAttribute("error", ex.getMessage());
					return mv;
				}
				return m;
			}
			
			//Delete Operation
			@RequestMapping(value = "/delUser")
			public String removeUser(@RequestParam("email") String email){
				userService.removeUser(email);
				return "index";
			}
}
