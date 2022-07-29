package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	public void register(MemberDTO dto);
	
	public int user_check(HttpServletRequest request);
	
	public void getMembers(Model model);
	
	public MemberDTO getMember(HttpServletRequest request);
}
