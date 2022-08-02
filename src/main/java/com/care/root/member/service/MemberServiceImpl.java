package com.care.root.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper mapper;
	BCryptPasswordEncoder en = new BCryptPasswordEncoder(); //비밀번호 암호화
	
	@Override
	public int user_check(HttpServletRequest request) {
		MemberDTO dto = mapper.getUser(request.getParameter("id"));
		if(dto!=null) {
			if(en.matches(request.getParameter("pw"), dto.getPw()) || //암호화 된 비밀번호 비교
					dto.getPw().equals(request.getParameter("pw")))
				return 0;
		}
		return 1;
	}
	
	@Override
	public void register(MemberDTO dto) {
		//System.out.println("암호화전 : "+dto.getPw());
		String seq = en.encode(dto.getPw());
		//System.out.println("암호화후 : "+seq);
		dto.setPw(seq);
		try {
			mapper.register(dto);				
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	@Override
	public void delete(HttpServletRequest request) {
		mapper.delete(request.getParameter("id"));		
	}

	@Override
	public void update(MemberDTO dto) {
		String seq = en.encode(dto.getPw());
		dto.setPw(seq);
		mapper.update(dto);		
	}

	@Override
	public void keepLogin(String id, String cookieId) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("cookieId", cookieId);
		mapper.keepLogin(map);
		
	}

	@Override
	public MemberDTO getCookieUser(String cookie) {
		return mapper.getCookieUser(cookie);
	}
	
	
	
	
	
}
