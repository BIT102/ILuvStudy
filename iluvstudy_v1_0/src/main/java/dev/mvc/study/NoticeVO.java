package dev.mvc.study;

import java.util.Date;

public class NoticeVO {
	//ntBno 공지사항 순서
	//ntTtile 제목
	//ntContent 내용
	//ntRegdate 올린날짜
	  
	private Integer ntBno;
	private String ntTitle;
	private String ntContent;
	private Date ntRegdate;
	private String ntWriter;
	
	public Integer getNtBno() {
		return ntBno;
	}
	public void setNtBno(Integer ntBno) {
		this.ntBno = ntBno;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
	public Date getNtRegdate() {
		return ntRegdate;
	}
	public void setNtRegdate(Date ntRegdate) {
		this.ntRegdate = ntRegdate;
	}
	public String getNtWriter() {
		return ntWriter;
	}
	public void setNtWriter(String ntWriter) {
		this.ntWriter = ntWriter;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [ntBno=" + ntBno + ", ntTitle=" + ntTitle + ", ntContent=" + ntContent + ", ntRegdate="
				+ ntRegdate + ", ntWriter=" + ntWriter + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}