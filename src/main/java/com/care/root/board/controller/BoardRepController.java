package com.care.root.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.board.dto.BoardRepDTO;
import com.care.root.board.service.BoardService;

@RestController
@RequestMapping("board")
public class BoardRepController {
	@Autowired BoardService bs;
	@PostMapping(value = "addReply", produces = "application/json;charset=utf-8")
	public void addReply(@RequestBody Map<String, String> map, HttpSession session) {
		bs.addReply(map,(String) session.getAttribute("loginUser"));
	}
	@GetMapping(value = "replyData/{write_group}", produces = "application/json;charset=utf-8")
	public List<BoardRepDTO> replyData(@PathVariable int write_group) { 
		return bs.getReplyList(write_group);
	}
	@ResponseBody
	@GetMapping(value = "deleteRep", produces = "application/json;charset=utf-8")
	public void deleteRep(@RequestParam("write_group") String write_group,String replynum) {
		bs.deleteRep(write_group,replynum);
	}
}
