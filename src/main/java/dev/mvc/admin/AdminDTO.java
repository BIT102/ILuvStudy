package dev.mvc.admin;

import java.util.Date;

public class AdminDTO {
	private	String	adminid;		//	���̵�
	private	String	adminpw;		//	��й�ȣ
	private	Date	lastLoginDate;		//	������ ������

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
