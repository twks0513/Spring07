package com.care.root.mybatis.board;

import java.util.List;

import com.care.root.board.dto.BoardDTO;

public interface BoardMapper {
	public List<BoardDTO> boardAllList();
	public void saveData(BoardDTO dto);
	public BoardDTO getContent(String title);
	public void hitUp(String write_no);
	public void modify(BoardDTO dto);
	public int delete(String write_no);
}
