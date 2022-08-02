package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	public void register(MemberDTO dto);
	
	public int user_check(HttpServletRequest request);
	
	public void getMembers(Model model);
	
	public MemberDTO getMember(HttpServletRequest request);
	
	public void delete(HttpServletRequest request);
	
	public void update(MemberDTO dto);
	
	public void keepLogin(String id,String cookieId);
	
	public MemberDTO getCookieUser(String cookie);
}
