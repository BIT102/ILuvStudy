package dev.mvc.dto;

import java.util.Date;

public class LoginDTO {
	
	private	String	id;		//	���̵�
	private	String	pw;		//	��й�ȣ
	private	Date	lastLoginDate;		//	������ ������
	private boolean useCookies; // ��Ű
	
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
	public boolean isUseCookies() {
		return useCookies;
	}
	public void setUseCookies(boolean useCookies) {
		this.useCookies = useCookies;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", pw=" + pw + ", lastLoginDate=" + lastLoginDate + ", useCookies=" + useCookies
				+ "]";
	}
	
}
