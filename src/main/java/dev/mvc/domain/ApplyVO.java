package dev.mvc.domain;

import java.util.Date;

public class ApplyVO {

	
	private String photo;
	private String usEmail; // use의 bno
	private Integer bsBno; // 스터디 bno
	private String status;
	private Date regdate;
	
	private int checked;
	
	
	private String nickname;
	private Integer gender;
	private String homepage;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUsEmail() {
		return usEmail;
	}
	public void setUsEmail(String usEmail) {
		this.usEmail = usEmail;
	}
	public Integer getBsBno() {
		return bsBno;
	}
	public void setBsBno(Integer bsBno) {
		this.bsBno = bsBno;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	private String introduction;

	@Override
	public String toString() {
		return "ApplyVO [photo=" + photo + ", usEmail=" + usEmail + ", bsBno=" + bsBno + ", status=" + status
				+ ", regdate=" + regdate + ", checked=" + checked + ", nickname=" + nickname + ", gender=" + gender
				+ ", homepage=" + homepage + ", introduction=" + introduction + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}