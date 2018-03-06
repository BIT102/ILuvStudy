package dev.mvc.domain;

import java.util.Date;

public class ApplyVO {

	private String usEmail; // use의 bno
	private Integer bsBno; // 스터디 bno
	private String status;
	private Date regdate;

	
	//프로필 사진불러옴
	private String photo;
	
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

	@Override
	public String toString() {
		return "ApplyVO [usEmail=" + usEmail + ", bsBno=" + bsBno + ", status=" + status + ", regdate=" + regdate
				+ ", photo=" + photo + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
}
