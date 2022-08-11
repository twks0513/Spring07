package com.care.root.board.sevice;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardFileServiceImpl implements BoardFileService {
	@Autowired BoardMapper bm;
	
	@Override
	public void fileProcess(MultipartHttpServletRequest mul) {
		System.out.println("id : "+mul.getParameter("id"));
		System.out.println("title : "+mul.getParameter("title"));
		System.out.println("content : "+mul.getParameter("content"));
		
		BoardDTO dto = new BoardDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		System.out.println("dto.content : "+dto.getContent());
		MultipartFile file = mul.getFile("file");
		System.out.println(file.getOriginalFilename());
		if(!file.isEmpty()) { //파일이 있을경우
			SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss-");
			String sysFileName = f.format(new Date());
			System.out.println(sysFileName);
			sysFileName += file.getOriginalFilename();
			dto.setImage_file_name(sysFileName);
			
			File savefile = new File(IMAGE_REPO+"/"+sysFileName);
			try {
				file.transferTo(savefile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else { //파일이 없을경우
			dto.setImage_file_name("nan");
		}
		bm.saveData(dto);
	}

	@Override
	public void reply(MultipartHttpServletRequest mul) {
		System.out.println("id : "+mul.getParameter("id"));
		System.out.println("title : "+mul.getParameter("title"));
		System.out.println("content : "+mul.getParameter("content"));
		
		BoardDTO dto = new BoardDTO();
		BoardRepDTO repdto = new BoardRepDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		System.out.println("dto.content : "+dto.getContent());
		MultipartFile file = mul.getFile("file");
		System.out.println(file.getOriginalFilename());
		if(!file.isEmpty()) { //파일이 있을경우
			SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss-");
			String sysFileName = f.format(new Date());
			System.out.println(sysFileName);
			sysFileName += file.getOriginalFilename();
			dto.setImage_file_name(sysFileName);
			
			File savefile = new File(IMAGE_REPO+"/"+sysFileName);
			try {
				file.transferTo(savefile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else { //파일이 없을경우
			dto.setImage_file_name("nan");
		}
		bm.saveData(dto);
	}
	

}
