package dev.mvc.domain;

import java.util.Date;

public class NoticeVO {
	//bno 공지사항 순서
	//ntTtile 제목
	//content 내용
	//regdate 올린날짜
	  
	private Integer bno;
	private String title;
	private String content;
	private Date regdate;
	private String writer;
	
	public Integer getbno() {
		return bno;
	}
	public void setbno(Integer bno) {
		this.bno = bno;
	}
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	public Date getregdate() {
		return regdate;
	}
	public void setregdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getwriter() {
		return writer;
	}
	public void setwriter(String writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [bno=" + bno + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", writer=" + writer + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}