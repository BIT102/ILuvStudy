package dev.mvc.dto;

import java.util.Date;

public class AdminDTO {
	private	String	adminId;		//	���̵�
	private	String	adminPw;		//	��й�ȣ
	private	Date	lastLoginDate;		//	������ ������
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
