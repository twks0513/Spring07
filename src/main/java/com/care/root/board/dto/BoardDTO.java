package com.care.root.board.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardDTO {
	private int write_no,hit;
	private String title,content,image_file_name,id;
	private String savedate;
	public int getWrite_no() {
		return write_no;
	}
	public void setWrite_no(int write_no) {
		this.write_no = write_no;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		this.image_file_name = image_file_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSavedate() {
		return savedate;
	}
	public void setSavedate(Timestamp savedate) {
		SimpleDateFormat s = new SimpleDateFormat("YYY/MM/dd HH:mm:ss");
		this.savedate = s.format(savedate);
	}
	
}
