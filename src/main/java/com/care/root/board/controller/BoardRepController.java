package com.care.root.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.sevice.BoardFileService;
import com.care.root.board.sevice.BoardService;

@Controller
@RequestMapping("board")
public class BoardRepController {
	@Autowired BoardFileService bfs;
	@Autowired BoardService bs;
	
	@GetMapping("replyForm")
	public String replyForm(Model model, String title, String write_no) {
		bs.getContent(model, title, write_no);
		return "board/replyForm";
	}
	
	@PostMapping("reply")
	public String reply() {
		return "redirect:boardAllList";
	}
}
