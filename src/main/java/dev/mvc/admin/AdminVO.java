package dev.mvc.admin;

import java.util.Date;

public class AdminVO {
	private	String	adminId;			//	아이디
	private	String	adminPw;			//	비밀번호
	private	String	name;				//	이름
	private	Date	registDate;			//	생성일
	private	String	registUser;			//	생성자
	private	Date	lastModifyDate;		//	마지막 수정일
	private	Date	lastLoginDate;		//	마지막 접속일
	private	String status;				//	상태(V:활성, D:사용안함)
	private int bno;					// 번호

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public String getRegistUser() {
		return registUser;
	}
	public void setRegistUser(String registUser) {
		this.registUser = registUser;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
	public Date getLastLoginDate() {
		return lastLoginDate;
	}
	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminPw=" + adminPw + ", name=" + name + ", registDate=" + registDate
				+ ", registUser=" + registUser + ", lastModifyDate=" + lastModifyDate + ", lastLoginDate="
				+ lastLoginDate + ", status=" + status + ", bno=" + bno + "]";
	}

	
}
