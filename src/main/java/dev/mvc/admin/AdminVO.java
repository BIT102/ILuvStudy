package dev.mvc.admin;

import java.util.Date;

public class AdminVO {
	private	String	adminid;			//	아이디
	private	String	adminpw;			//	비밀번호
	private	String	name;				//	이름
	private	Date	registDate;			//	생성일
	private	String	registUser;			//	생성자
	private	Date	lastModifyDate;		//	마지막 수정일
	private	Date	lastLoginDate;		//	마지막 접속일
	private	char status;				//	상태(V:활성, D:사용안함)
	private int bno;					// 번호

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
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
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AdminVO [adminid=" + adminid + ", adminpw=" + adminpw + ", name=" + name + ", registDate=" + registDate
				+ ", registUser=" + registUser + ", lastModifyDate=" + lastModifyDate + ", lastLoginDate="
				+ lastLoginDate + ", status=" + status + ", bno=" + bno + "]";
	}
	
}
