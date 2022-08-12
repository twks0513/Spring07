package com.care.root.board.controller;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;
	@Autowired BoardFileService bfs;
	
	@GetMapping("boardAllList")
	public String board(Model model, @RequestParam(value = "num",required = false, defaultValue = "1") int num ) {
		bs.boardAllList(model,num);
		return "board/boardAllList";
	}
	
	@GetMapping("writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	
	@GetMapping("download")
	public void download(String file,HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; filename="+file); //파일을 다운로드형식으로 응답
		File f = new File(bfs.IMAGE_REPO+"/"+file); //파일경로를 파일객체로 만듦
		FileInputStream in = new FileInputStream(f); // InputStream으로 경로에 있는 파일을 읽어옮
		FileCopyUtils.copy(in, response.getOutputStream()); // OutputStream으로 파일을 출력
		in.close();
	}
	@PostMapping("write")
	public String write(MultipartHttpServletRequest mul) {
		bfs.fileProcess(mul);
		return "redirect:writeForm";
	}
	
	@GetMapping("contentView")
	public String contentView(Model model,String title,String write_no) {
		bs.getContent(model,title,write_no);
		return "board/contentView";
	}
	
	@GetMapping("modifyForm")
	public String modifyForm(Model model,String title,String write_no) {
		bs.getContent(model, title, write_no);
		return "board/modifyForm";
	}
	
	@PostMapping("modify")
	public String modify(MultipartHttpServletRequest mul) {
		bs.modify(mul);
		return "redirect:boardAllList";
	}
	
	@GetMapping("delete")
	public String delete(String file,String write_no) {
		bs.delete(file, write_no);
		return "redirect:boardAllList";
	}
}
