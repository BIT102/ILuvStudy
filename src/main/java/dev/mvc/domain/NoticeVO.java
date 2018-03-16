package dev.mvc.domain;

import java.util.Date;

public class NoticeVO {
	//bno 공지사항 순서
	//ntTtile 제목
	//content 내용
	//regdate 올린날짜


	private int bno;
	private String title;
	private String content;
	private Date regdate;
	private String writer;
	private Date lastModifyDate;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
	@Override
	public String toString() {
		return "NoticeVO [bno=" + bno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", writer=" + writer + ", lastModifyDate=" + lastModifyDate + "]";
	}

	
}