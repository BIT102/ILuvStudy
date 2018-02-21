package dev.mvc.admin;

import java.util.Date;

public class AdminDTO {
	private	String	adminid;		//	아이디
	private	String	adminpw;		//	비밀번호
	private	Date	lastLoginDate;		//	마지막 접속일

	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}
	@Override
	public String toString() {
		return "AdminDTO [adminid=" + adminid + ", adminpw=" + adminpw + ", lastLoginDate=" + lastLoginDate + "]";
	}
}
