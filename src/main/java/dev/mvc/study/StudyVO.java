package dev.mvc.study;

import java.util.Date;

public class StudyVO {
//	BS_BNO	번호
//	BS_TITLE	제목
//	BS_WRITER	글쓴이 (USER.EMAIL)
//	BS_CATEGORY_D	카테고리 대분류
//	BS_CATEGORY_S	카테고리 소분류
//	BS_NOW	현재인원
//	BS_MAX	최대인원
//	BS_R_D_ID	지역(대분류)
//	BS_R_S_ID	지역(소분류)
//	BS_AGE	연령
//	BS_SC	일정(요일별)(sc=스케줄)
//	BS_SD	시작날짜(start Date)
//	BS_ST	시작시간
//	BS_ET	끝나는 시간
//	BS_CONTENT	내용
//	BS_VCT	방문수
//	BS_RCT	댓글수
//	BS_REGDATE	올린 날짜
//	BS_ENDDATE	스터디완료일
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
