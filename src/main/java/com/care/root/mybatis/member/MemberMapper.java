package com.care.root.mybatis.member;

import java.util.List;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO getUser(String id);
	
	public void register(MemberDTO dto);
	
	public List<MemberDTO> getMembers();
	
	public void delete(String id);
	
	public void update(MemberDTO dto);
}
