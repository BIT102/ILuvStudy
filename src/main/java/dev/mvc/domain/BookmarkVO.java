package dev.mvc.domain;

public class BookmarkVO {

	private Integer id;
	private String userEmail;
	private Integer bsBno;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Integer getBsBno() {
		return bsBno;
	}
	public void setBsBno(Integer bsBno) {
		this.bsBno = bsBno;
	}
	
	@Override
	public String toString() {
		return "BookmarkVO [id=" + id + ", userEmail=" + userEmail + ", bsBno=" + bsBno + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
