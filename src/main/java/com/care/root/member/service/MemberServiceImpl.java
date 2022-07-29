package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mapper;

	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.getUser(request.getParameter("id"));
		if(dto!=null) {
			if(dto.getPw().equals(request.getParameter("pw")))
				return 0;
		}
		return 1;
	}
	
	@Override
	public void register(MemberDTO dto) {
		mapper.register(dto);		
	}

	@Override
	public void getMembers(Model model) {
		model.addAttribute("list",mapper.getMembers());
		
	}

	@Override
	public MemberDTO getMember(HttpServletRequest request) {
		MemberDTO dto = mapper.getUser(request.getParameter("id"));
		
		return dto;
	}
	
	
	
	
	
}
