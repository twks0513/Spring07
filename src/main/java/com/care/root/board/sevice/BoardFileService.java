package com.care.root.board.sevice;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardFileService {
	public String IMAGE_REPO = "D:/220509방은혁/2022SPRINGWorkspace/s_project/image_repo";
	public void fileProcess(MultipartHttpServletRequest mul);
	public void reply(MultipartHttpServletRequest mul);
}
