package com.care.root.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController{
	@Autowired MemberService ms;
	
	@GetMapping("index")
	public String index() {
		return "index";
	}
	
	@GetMapping("login")
	public String login() {
		return "/member/login";
	}
	
	@PostMapping("user_check")
	public String user_check(HttpServletRequest request,RedirectAttributes ra) {
		int result = ms.user_check(request);
		if(result == 0) {
			ra.addAttribute("id",request.getParameter("id"));
			ra.addAttribute("AutoLogin",request.getParameter("AutoLogin"));
			return "redirect:successLogin";
		}
		return "/member/loginerror";
	}
	@GetMapping("loginerror")
	public String loginerror() {
		return "redirect:login";
	}
	
	@GetMapping("successLogin")
	public String successLogin(HttpServletResponse response,HttpSession session,@RequestParam String id,@RequestParam(required = false) String AutoLogin) {		
		session.setAttribute("loginUser", id);
		System.out.println("id : "+id);
		System.out.println("AutoLogin : "+AutoLogin);
		if(AutoLogin !=null) {
			int time = 60*60*24*90; //90일
			Cookie cookie = new Cookie("loginCookie",id);
			cookie.setMaxAge(time);
			cookie.setPath("/");
			response.addCookie(cookie);
			
			ms.keepLogin(id,id);
			}
		return "/member/successLogin";
	}
	
	@GetMapping("register")
	public String regist() {		
		return "/member/register";
	}
	
	@PostMapping("regist")
	public String insert(MemberDTO dto) {
		ms.register(dto);
		return "redirect:index";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session,@CookieValue(required = false)Cookie loginCookie,HttpServletResponse response) {
		if(loginCookie !=null) {
			loginCookie.setMaxAge(0);
			loginCookie.setPath("/");
			response.addCookie(loginCookie);
			ms.keepLogin((String) session.getAttribute("loginUser"),"nan");
		}
		session.invalidate();
		return "redirect:index";
	}
	
	@GetMapping("memberInfo")
	public String memberInfo(Model model) {
		ms.getMembers(model);
		return "/member/memberInfo";
	}
	
	@GetMapping("info")
	public String info(Model model,MemberDTO dto,HttpServletRequest request) {
		dto = ms.getMember(request);
		model.addAttribute("dto",dto);		
		return "/member/info";
	}
	
	@GetMapping("delete")
	public String delete(HttpServletRequest request,HttpSession session) {
		ms.delete(request);
		session.invalidate();
		return "/member/delete";
	}
	
	@GetMapping("update")
	public String update(MemberDTO dto) {
		ms.update(dto);
		return "/member/update";
	}
	
	
}
