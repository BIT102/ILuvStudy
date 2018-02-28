package dev.mvc.domain;

import java.util.Date;

public class ReplyVO {
	/*
   	RNO			��۹�ȣ	int(11)		PK/AI	NN	
	BQBNO		�۹�ȣ		varchar(50)			NN	
	CONTENT		����		text				NN	
	REPLYER 	�ۼ��� 		varchar(50)			NN
	REGDATE		�ø���¥	DATETIME			CURRENT_TIMESTAMP
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
