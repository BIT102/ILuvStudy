package dev.mvc.domain;

import java.util.Date;


//상세페이지 댓글이요
public class ReplyStudyVO {

	private Integer rno; //댓글번호
	private Integer bsBno; //상세페이지번호
	private String writer; //쓴사람
	private String content;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	private Date regdate; //올린날짜
	
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBsBno() {
		return bsBno;
	}
	public void setBsBno(Integer bsBno) {
		this.bsBno = bsBno;
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
		return "ReplyStudyVO [rno=" + rno + ", bsBno=" + bsBno + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
}
