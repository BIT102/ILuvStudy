package dev.mvc.domain;

import java.util.Date;


//�������� ����̿�
public class ReplyStudyVO {

	private Integer rno; //��۹�ȣ
	private Integer bsBno; //����������ȣ
	private String writer; //�����
	private String content;
	private Date regdate; //�ø���¥
	private String nickname;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Override
	public String toString() {
		return "ReplyStudyVO [rno=" + rno + ", bsBno=" + bsBno + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + ", nickname=" + nickname + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
