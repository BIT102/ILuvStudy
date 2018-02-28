package dev.mvc.domain;

import java.util.Date;

public class ReplyVO {
	/*
   	RNO			댓글번호	int(11)		PK/AI	NN	
	BQBNO		글번호		varchar(50)			NN	
	CONTENT		내용		text				NN	
	REPLYER 	작성자 		varchar(50)			NN
	REGDATE		올린날짜	DATETIME			CURRENT_TIMESTAMP
	 */
	private int rno;
	private int bqBno;
	private String content;
	private String replyer;
	
	private Date regdate;
	private Date updatedate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBqBno() {
		return bqBno;
	}
	public void setBqBno(int bqBno) {
		this.bqBno = bqBno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bqBno=" + bqBno + ", content=" + content + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + "]";
	}
	
	
	
	
	
	
}
