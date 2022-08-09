package com.care.root.board.sevice;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{	
	@Autowired BoardMapper bm;
	public void boardAllList(Model model){
		model.addAttribute("list",bm.boardAllList());		
	}
	
	@Override
	public void getContent(Model model,String title,String write_no) {
		model.addAttribute("dto",bm.getContent(title));
		bm.hitUp(write_no);
	}
	@Override
	public void modify(MultipartHttpServletRequest mul) {
		BoardDTO dto = new BoardDTO();
		dto.setId(mul.getParameter("id"));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setWrite_no(Integer.parseInt(mul.getParameter("write_no")));
		MultipartFile file = mul.getFile("file");
		
		if(!file.isEmpty()) { //이미지 변경
			File d = new File(IMAGE_REPO+"/"+mul.getParameter("origin"));
			d.delete();
			
			SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss-");
			String sysFileName = f.format(new Date());
			sysFileName += file.getOriginalFilename();
			dto.setImage_file_name(sysFileName);
			
			File savefile = new File(IMAGE_REPO+"/"+sysFileName);
			try {
				file.transferTo(savefile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else { //이미지 변경 안할경우
			dto.setImage_file_name(mul.getParameter("origin"));
		}
		bm.modify(dto);
		
	}
	@Override
	public void delete(String file, String write_no) {
		int result = bm.delete(write_no);
		if(result ==1) {
			File d = new File(IMAGE_REPO+"/"+file);
			d.delete();
		}
		
	}
	
	

}
