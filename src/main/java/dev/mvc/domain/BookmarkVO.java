package dev.mvc.domain;

public class BookmarkVO {

	private Integer id;
	private String userEmail;
	private Integer bsBno;
	
	private int checked; //sohee 수정 , 북마크 했는지 체크용, 했으면 1 / 안했으면 0

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

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "BookmarkVO [id=" + id + ", userEmail=" + userEmail + ", bsBno=" + bsBno + ", checked=" + checked
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	
}