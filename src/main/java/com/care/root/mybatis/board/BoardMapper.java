package com.care.root.mybatis.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;

public interface BoardMapper {
	public List<BoardDTO> boardAllList(@Param("s") int start, @Param("e")int end); //mapper에 매개변수가 2개 이상 일땐 @Param이 필수
	public int selectBoardCount();
	public void saveData(BoardDTO dto);
	public BoardDTO getContent(String title);
	public void hitUp(String write_no);
	public void modify(BoardDTO dto);
	public int delete(String write_no);
	public void addReply(Map<String,String>map);
	public List<BoardRepDTO> getReplyList(int write_group);
	public void deleteRep(String write_no,String title);
}
