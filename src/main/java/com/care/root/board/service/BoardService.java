package com.care.root.board.service;


import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardRepDTO;

public interface BoardService {
	public String IMAGE_REPO = "D:/220509방은혁/2022SPRINGWorkspace/s_project/image_repo";
	public void boardAllList(Model model,int num);	
	public void getContent(Model model,String title,String write_no);
	public void modify(MultipartHttpServletRequest mul);
	public void delete(String file,String write_no);
	public void addReply(Map<String,String>map,String userId);
	public List<BoardRepDTO> getReplyList(int write_group);
	public void deleteRep(String write_group,String replynum);
}
