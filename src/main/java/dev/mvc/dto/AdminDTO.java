package dev.mvc.dto;

import java.util.Date;

public class AdminDTO {
	private	String	id;		//	���̵�
	private	String	pw;		//	��й�ȣ
	private	Date	lastLoginDate;		//	������ ������

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	@Override
	public String toString() {
		return "AdminDTO [id=" + id + ", pw=" + pw + ", lastLoginDate=" + lastLoginDate + "]";
	}	
}
