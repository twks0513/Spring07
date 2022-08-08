package com.care.root.board.sevice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {
	String IMAGE_REPO = "D:/220509방은혁/2022SPRINGWorkspace/s_project/image_repo";
	public void boardAllList(Model model);
	public void fileProcess(MultipartHttpServletRequest mul);
	public void getContent(Model model,String title,String write_no);
	public void modify(MultipartHttpServletRequest mul);
	public void delete(String file,String write_no);
}
