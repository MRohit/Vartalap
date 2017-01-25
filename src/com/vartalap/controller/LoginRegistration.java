package com.vartalap.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import com.vartalap.model.LoginBean;
import com.vartalap.model.User;
import com.vartalap.service.VartalapService;
@Controller
public class LoginRegistration {
	/*@RequestMapping(value={"/home"},method=RequestMethod.GET)
	public String showHomePage(){
		return "home";
	}
	*/
	@Autowired
	private VartalapService service;
	@RequestMapping(value={"/register"},method=RequestMethod.GET)
	public String showQuestionPage(){
		return "registration/register";
	}
	
	/*HttpServletRequest request, HttpServletResponse response, @ModelAttribute("userBean")User userBean*/
	@RequestMapping(value={"/submitForm"},method=RequestMethod.POST)
	public String registerNewUser1(@RequestParam("firstName")String firstName,
			@RequestParam("lastName")String lastName,
			@RequestParam("middleName")String middleName,
			@RequestParam("userName")String userName,
			@RequestParam("email")String email,
			@RequestParam("password")String password,
			@RequestParam("confirmPassword")String confirmPassword,
			@RequestParam("gender")String gender,
			@RequestParam("birthday")Date birthday,
			@RequestParam("skills")String skills
			){
		/*System.out.println("Name:"+firstName);
		System.out.println("lastName:"+lastName);
		System.out.println("middleName:"+middleName);
		System.out.println("userName:"+userName);
		System.out.println("email:"+email);
		System.out.println("password:"+password);
		System.out.println("confirmPassword:"+confirmPassword);
		System.out.println("gender:"+gender);
		System.out.println("birthday:"+birthday);*/
		System.out.println("password:"+password);
		
		//System.out.println(birthday2);
		User user=new User();
		user.setFirstName(firstName);
		user.setMiddleName(middleName);
		user.setLastName(lastName);
		user.setDOB(birthday);
		user.setEmail(email);
		user.setGender(gender);
		user.setSkills(skills);
		user.setUserName(userName);
		service.addUser(user,password);
		
		return "registration/register";
	}
	
	
	/*@RequestMapping(value={"/login"},method=RequestMethod.POST)
	public String Login(@RequestParam("userName") String userName,@RequestParam("password") String password,Model model){
		System.out.println("In Login" +userName+"  Password:"+password);
		service.validateUser(userName, password);
		return "home";
	}*/
	
	@RequestMapping(value={"/login2"},method=RequestMethod.POST)
	public ModelAndView Login2(@RequestParam("userName") String userName,@RequestParam("password") String password){
		System.out.println("In Login  Password:"+userName);
		
				ModelAndView model = new ModelAndView("login");
		
		       LoginBean loginBean=new LoginBean();
		
		        model.addObject("loginBean", loginBean);
		        
		       return model;
	}
		
		//int id=service.validateUser(userName, password);
		/*if(id==0){
			model.addAttribute("error", "Invalid Username and password");
			return null;
		}*/
//		service.validateUser(userName, password);
		
	 @RequestMapping(value="/login",method=RequestMethod.POST)
	 public ModelAndView executeLogin(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("loginBean")LoginBean loginBean){
		 	//executeLogin(request, response, loginBean)
		 	//Login2(userName, password);
	         ModelAndView model= null;
	 
	         try
	 
	         {
	 
	        	 boolean isValidUser = service.validateUser(loginBean.getUserName(),loginBean.getPassword());
	 
	             if(isValidUser)
	 
	             {
	 
	                 System.out.println("User Login Successful");
	 
	                 request.setAttribute("loggedInUser", loginBean.getUserName());
	 
	                 model = new ModelAndView("home");
	                 
	             }
	 
	             else
	 
	             {
	 
	                 model = new ModelAndView("login");
	 
	 model.addObject("loginBean", loginBean);
	 
	                 request.setAttribute("message", "Invalid credentials!!");
	                 System.out.println("Invalid");
	             }
	 
	  
	 
	         }
	 
	         catch(Exception e)
	 
	         {
	 
	             e.printStackTrace();
	 
	         }
	 
	  
	 
	         return model;
	 
	     }
	 public void registerNewUser(){
		 
	 }
	
}
