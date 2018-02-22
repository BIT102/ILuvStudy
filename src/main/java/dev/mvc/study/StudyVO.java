package dev.mvc.study;

import java.util.Date;

public class StudyVO {
//	BS_BNO	��ȣ
//	BS_TITLE	����
//	BS_WRITER	�۾��� (USER.EMAIL)
//	BS_CATEGORY_D	ī�װ� ��з�
//	BS_CATEGORY_S	ī�װ� �Һз�
//	BS_NOW	�����ο�
//	BS_MAX	�ִ��ο�
//	BS_R_D_ID	����(��з�)
//	BS_R_S_ID	����(�Һз�)
//	BS_AGE	����
//	BS_SC	����(���Ϻ�)(sc=������)
//	BS_SD	���۳�¥(start Date)
//	BS_ST	���۽ð�
//	BS_ET	������ �ð�
//	BS_CONTENT	����
//	BS_VCT	�湮��
//	BS_RCT	��ۼ�
//	BS_REGDATE	�ø� ��¥
//	BS_ENDDATE	���͵�Ϸ���
	private int bno; 
	private String title; 
	private String writer; 
	private String categoryD; 
	private int categoryS; 
	private int now;
	private int max;
	private String rDId;
	private int rSId;
	private String age;
	private String sc;
	private String sd;
	private String st;
	private String et;
	private String content;
	private String vct;
	private String rct;
	private Date regDate;
	private Date endDate;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCategoryD() {
		return categoryD;
	}
	public void setCategoryD(String categoryD) {
		this.categoryD = categoryD;
	}
	public int getCategoryS() {
		return categoryS;
	}
	public void setCategoryS(int categoryS) {
		this.categoryS = categoryS;
	}
	public int getNow() {
		return now;
	}
	public void setNow(int now) {
		this.now = now;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getrDId() {
		return rDId;
	}
	public void setrDId(String rDId) {
		this.rDId = rDId;
	}
	public int getrSId() {
		return rSId;
	}
	public void setrSId(int rSId) {
		this.rSId = rSId;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSc() {
		return sc;
	}
	public void setSc(String sc) {
		this.sc = sc;
	}
	public String getSd() {
		return sd;
	}
	public void setSd(String sd) {
		this.sd = sd;
	}
	public String getSt() {
		return st;
	}
	public void setSt(String st) {
		this.st = st;
	}
	public String getEt() {
		return et;
	}
	public void setEt(String et) {
		this.et = et;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getVct() {
		return vct;
	}
	public void setVct(String vct) {
		this.vct = vct;
	}
	public String getRct() {
		return rct;
	}
	public void setRct(String rct) {
		this.rct = rct;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	@Override
	public String toString() {
		return "StudyVO [title=" + title + ", writer=" + writer + ", categoryD=" + categoryD + ", categoryS="
				+ categoryS + ", now=" + now + ", max=" + max + ", rDId=" + rDId + ", rSId=" + rSId + ", age=" + age
				+ ", sc=" + sc + ", sd=" + sd + ", st=" + st + ", et=" + et + ", content=" + content + ", vct=" + vct
				+ ", rct=" + rct + ", regDate=" + regDate + ", endDate=" + endDate + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
