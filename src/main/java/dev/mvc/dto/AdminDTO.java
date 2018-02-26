package dev.mvc.dto;

import java.util.Date;

public class AdminDTO {
	private	String	adminId;		//	아이디
	private	String	adminPw;		//	비밀번호
	private	Date	lastLoginDate;		//	마지막 접속일
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPw=" + adminPw + ", lastLoginDate=" + lastLoginDate + "]";
	}

	
	
	}
