package dev.mvc.domain;

import java.util.Date;

public class ReplyStudyVO {
	private int rno;			//번호
	private int bsBno;			//스터디 번호
	private String content;		//내용
	private String writer;		//글쓴이
	private Date regdate;		//날짜
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBsBno() {
		return bsBno;
	}
	public void setBsBno(int bsBno) {
		this.bsBno = bsBno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ReplyStudyVO [rno=" + rno + ", bsBno=" + bsBno + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + "]";
	}	
}
